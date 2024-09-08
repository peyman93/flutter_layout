import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final _formKey = GlobalKey<FormState>();
  final _todoValueTextController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Add ToDo')),
        body: _body(),
      );

  Widget _body() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Enter your ToDo'),
                const SizedBox(height: 16),
                _textField(),
                const SizedBox(height: 32),
                _submitButton(),
                if (_isLoading) ...[
                  const SizedBox(height: 16),
                  const CircularProgressIndicator(),
                ],
              ],
            ),
          ),
        ),
      );

  Widget _submitButton() => IgnorePointer(
        ignoring: _isLoading,
        child: ElevatedButton(
          onPressed: _onTap,
          child: const Text('Submit'),
        ),
      );

  void _onTap() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      try {

        final response = await http.post(
          Uri.parse("http://127.0.0.1:3000/todos"),
          body: jsonEncode({"value": _todoValueTextController.text}),
        );

        if (!mounted) {
          return;
        }

        if (response.statusCode == 201) {
          print('Done');
          Navigator.pop<bool>(context, true);
        }

        setState(() => _isLoading = false);
      } catch (e) {
        print(e);
        setState(() => _isLoading = false);
      }
    }
  }

  Widget _textField() => TextFormField(
        enabled: !_isLoading,
        controller: _todoValueTextController,
        decoration: const InputDecoration(hintText: 'ToDo'),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null) {
            return null;
          }

          if (value.isEmpty) {
            return 'Todo value is required';
          }

          return null;
        },
      );
}
