import 'package:flutter/material.dart';

class AppTextNew extends StatelessWidget {
  String label;
  String hint;
  bool password;
  TextEditingController controler;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode focusNext;

  AppTextNew(
    this.label,
    this.hint, {
    this.password = false,
    this.controler,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.focusNext,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controler,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (focusNext != null) {
          FocusScope.of(context).requestFocus(focusNext);
        }
      },
      style: TextStyle(
        fontSize: 25,
        color: Colors.blue,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 25,
          color: Colors.grey,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
