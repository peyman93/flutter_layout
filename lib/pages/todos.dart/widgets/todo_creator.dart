import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TodoCreator extends StatefulWidget {
  const TodoCreator({required this.onSubmit, super.key});

  final void Function(String) onSubmit;

  @override
  State<TodoCreator> createState() => _TodoCreatorState();
}

class _TodoCreatorState extends State<TodoCreator> {
  final _formKey = GlobalKey<FormState>();

  final _titleTextFieldController = TextEditingController();
  final _descriptionTextFieldController = TextEditingController();

  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) => Row(
        children: [
          ElevatedButton(
            onPressed: _onSubmit,
            child: const Text('Submit'),
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _title(),
                  _description(),
                ],
              ),
            ),
          ),
        ],
      );

  Widget _title() => TextFormField(
        onFieldSubmitted: (_) => _onSubmit(),
        focusNode: _focusNode,
        keyboardType: TextInputType.number,
        controller: _titleTextFieldController,
        validator: _validator,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Title'),
        ),
      );

  String? _validator(String? value) {
    if (value == null) {
      return null;
    }

    if (value.isEmpty) {
      return 'Title is required';
    }

    if (value.length < 3) {
      return 'Title must be longer than 3';
    }

    return null;
  }

  Widget _description() => TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(6),
          FilteringTextInputFormatter.digitsOnly,
        ],
        controller: _descriptionTextFieldController,
        decoration: const InputDecoration(
          label: Text('Description'),
        ),
      );

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onSubmit(_titleTextFieldController.text);
      _titleTextFieldController.clear();
      _descriptionTextFieldController.clear();
      _focusNode.requestFocus();
    }
  }
}
