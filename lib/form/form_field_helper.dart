import 'package:flutter/material.dart';

class FormFieldHelper {
  static Widget textFieldBuilder(
      {required TextEditingController controller,
      String hint = "",
      TextInputType? keyboardType,
      String? Function(String?)? validator}) {
    return TextFormField(
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: hint,
      ),
      autofocus: false,
      autocorrect: false,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.none,
      controller: controller,
      validator: validator,
    );
  }

  static String? Function(String?)? validator(String type,
      {String secondValue = ''}) {
    switch (type) {
      case 'email':
        {
          return (String? value) {
            if (value == null || value.isEmpty) {
              return 'Email required';
            }
            if (!value.contains('@')) {
              return 'Not a valid email';
            }
            return null;
          };
        }
      case 'password':
        {
          return (String? value) {
            if (value == null || value.isEmpty) {
              return 'Password required';
            }
            return null;
          };
        }
      case 'passwordRepeat':
        {
          return (String? value) {
            if (value == null || value.isEmpty) {
              return 'Password required';
            }
            if (value != secondValue) {
              return 'Passwords do not match';
            }
            return null;
          };
        }
      case 'empty':
        {
          return (String? value) {
            if (value == null || value.isEmpty) {
              return 'Value required';
            }
            return null;
          };
        }
      case 'numbers':
        {
          return (String? value) {
            if (value == null || value.isEmpty) {
              return 'Value required';
            }
            if (value.contains(RegExp(r'[A-Za-z]'))) {
              return 'Only numbers are allowed';
            }
            return null;
          };
        }

      default:
        return (String? value) {
          return null;
        };
    }
  }
}
