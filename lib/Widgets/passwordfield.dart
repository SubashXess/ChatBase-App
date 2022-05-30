import 'package:chatbase_app/Components/showSnackBar.dart';
import 'package:chatbase_app/Styles/shadowstyle.dart';
import 'package:chatbase_app/Styles/textstyle.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordField extends StatefulWidget {
  final Function(String password) onChanged;
  const PasswordField({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final TextEditingController _passwordController = TextEditingController();

  RegExp regExp = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  bool _isHiddenPassword = true;

  @override
  void initState() {
    _passwordController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.removeListener(onListen);
    _passwordController.dispose();
    super.dispose();
  }

  void onListen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        boxShadow: [boxShadowStyle(kPrimaryDeepColor.withOpacity(0.4))],
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29.0),
      ),
      child: TextFormField(
        obscureText: _isHiddenPassword,
        controller: _passwordController,
        obscuringCharacter: '•',
        maxLength: 16,
        maxLines: 1,
        style: textStyleSimple(kPrimaryColor, 16.0, FontWeight.normal),
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          hintText: 'Password',
          hintStyle:
              textStyleSimple(kPrimaryDeepLightColor, 16.0, FontWeight.w400),
          errorStyle:
              textStyleSimple(kPrimaryDeepColor, 12.0, FontWeight.normal),
          prefixIcon: const Icon(Icons.lock_rounded, color: kPrimaryColor),
          suffixIcon: _passwordController.text.isEmpty
              ? Container(width: 0.0)
              : IconButton(
                  splashRadius: 5.0,
                  color: kPrimaryDeepLightColor,
                  onPressed: () {
                    togglePasswordVisibility();
                  },
                  icon: _isHiddenPassword
                      ? const Icon(
                          Icons.visibility_off_rounded,
                          color: kPrimaryColor,
                        )
                      : const Icon(
                          Icons.visibility_rounded,
                          color: kPrimaryColor,
                        ),
                ),
          // const Icon(Icons.visibility_rounded, color: kPrimaryColor),
        ),
        keyboardType: TextInputType.visiblePassword,
        cursorColor: kPrimaryDeepColor,
        autofillHints: const [AutofillHints.password],
        onEditingComplete: () => TextInput.finishAutofillContext(),
        validator: passwordValidate,
        onChanged: widget.onChanged,
      ),
    );
  }

  String? passwordValidate(String? value) {
    if (value!.isEmpty) {
      // showSnackBar(context, 'Required password');
      return 'Required password';
    } else if (value.length < 8) {
      // showSnackBar(context, 'Password must be at least 8 characters');
      return 'Password must be at least 8 characters';
    } else if (value.length >= 16) {
      // showSnackBar(context, 'Your password is too long');
      return 'Your password is too long';
    } else {
      bool result = checkPassword(value);
      if (result) {
        // perform actions
        // ignore: avoid_print
        print("Password : $result");
      } else {
        // showSnackBar(context,
        //     'Password should contain capital letter, small letter, number & special characters');
        return 'Password should contain capital letter, small letter, number & special characters';
      }
    }
  }

  bool checkPassword(String value) {
    String _password = value.trim().replaceAll(' ', '');
    if (regExp.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  void togglePasswordVisibility() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }
}
