import 'package:chatbase_app/Components/showsnackbar.dart';
import 'package:flutter/material.dart';

// TextFormField textFormFieldValidate() {
//   return TextFormField(
//     validator: ,
//   );
// }
class ValidateTextField {
  String? loginTextFormFieldValidator(BuildContext context,
      [String email = '', String password = '']) {
    if (email.isEmpty && password.isEmpty) {
      showSnackBar(context, 'Please enter Email, password');
    } else if (email.isEmpty) {
      showSnackBar(context, 'Please enter Email');
      if (email.isEmpty && password.length < 8) {
        showSnackBar(context,
            'Please enter Email and Password must be at least 8 characters');
      }
    } else if (password.isEmpty) {
      showSnackBar(context, 'Please enter Password');
      if (password.length < 8) {
        showSnackBar(context, 'Password must be at least 8 characters');
      } else if (password.length > 16) {
        showSnackBar(context, 'Your Password is too long');
      }
    }
    return null;
  }
}
