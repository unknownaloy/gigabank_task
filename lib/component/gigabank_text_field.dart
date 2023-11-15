import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GigabankTextField extends StatelessWidget {
  const GigabankTextField({
    super.key,
    required this.hintText,
    this.validator,
    this.inputFormatters,
    this.controller,
  });

  final String hintText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      validator: validator,
      inputFormatters: inputFormatters,
    );
  }
}
