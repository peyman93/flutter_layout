import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/user_model.dart';

class ErrorPracticePage extends StatefulWidget {
  const ErrorPracticePage({super.key});

  @override
  State<ErrorPracticePage> createState() => _ErrorPracticePageState();
}

class _ErrorPracticePageState extends State<ErrorPracticePage> {
  List<UserModel>? _userList = null;
  _State _state = _State.loading;
  String? _error = null;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _body(),
      );

  Widget _body() {
    if (_state == _State.loading) {
      return const Text('Loading...');
    }

    if (_state == _State.success) {
      return ListView.separated(
        itemBuilder: (_, index) => Text(_userList![index].name),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: _userList!.length,
      );
    }

    return Column(
      children: [
        Text(_error!),
        ElevatedButton(
          onPressed: _fetchData,
          child: const Text('Retry'),
        ),
      ],
    );
  }

  void _fetchData() async {
    setState(() => _state = _State.loading);
    try {
      await Future.delayed(const Duration(seconds: 2));

      final uri = Uri.parse('https://jsonplaceholder.typicode.com/users');

      final response = await http.get(uri);

      

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        _userList = (data as List<dynamic>)
            .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
            .toList();

        setState(() => _state = _State.success);
      } else {
        setState(() {
          _error = response.statusCode.toString();
          _state = _State.retry;
        });
      }



    } catch (error) {
      setState(() {
        _error = error.toString();
        _state = _State.retry;
      });
    }
  }
}

enum _State { loading, success, retry }
