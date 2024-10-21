import 'package:flutter/material.dart';

class NumberInputField extends StatelessWidget {
  const NumberInputField({
    Key? key,
    this.formKey,
    this.label,
    this.controller,
    this.onChanged,
    this.isReal = true,
  }) : super(key: key);

  final String? label;
  final bool isReal;
  final void Function(String)? onChanged;
  final GlobalKey<FormState>? formKey;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: TextFormField(
        controller: controller,
        style: TextStyle(fontSize: 16),
        key: formKey,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(2),
            labelText: label),
        textAlign: TextAlign.start,
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        validator: ((value) {
          if (value == null
              // || !(isReal ? numRegex.hasMatch(value) : intRegex.hasMatch(value))
              ) return 'Invalid number';
          return null;
        }),
      ),
    );
  }
}
