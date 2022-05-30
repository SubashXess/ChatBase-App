import 'package:chatbase_app/Styles/textstyle.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';

class ForgotPasswordText extends StatelessWidget {
  final Function() onTap;
  const ForgotPasswordText({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(left: 45.0),
        child: Text('Forgot password ?',
            style:
                textStyleSimple(kPrimaryDeepLightColor, 16.0, FontWeight.w400)),
      ),
    );
  }
}
