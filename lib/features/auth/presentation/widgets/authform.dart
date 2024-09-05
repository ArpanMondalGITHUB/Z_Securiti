import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool isObscureText;
  const AuthForm(
      {super.key, required this.hint, this.isObscureText = false, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscureText,
      decoration: InputDecoration(
        
        hintText: hint,
      ),

      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return '$hint is missing';
        }
          return null;
      },
      
    );
  }
}
