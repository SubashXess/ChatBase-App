import 'package:chatbase_app/Styles/textstyle.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function() onTap;
  const AlreadyHaveAnAccountCheck(
      {Key? key, this.login = true, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(login ? 'Don\'t have an account? ' : 'Already have an account? ',
            style:
                textStyleSimple(kPrimaryDeepLightColor, 16.0, FontWeight.w400)),
        GestureDetector(
          onTap: onTap,
          child: Text(
            login ? 'Sign Up' : 'Login',
            style: textStyleSimple(kPrimaryColor, 16.0, FontWeight.bold),
          ),
        )
      ],
    );
  }
}
