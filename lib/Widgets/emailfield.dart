import 'package:chatbase_app/Styles/shadowstyle.dart';
import 'package:chatbase_app/Styles/textstyle.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  final Function(String email) onChanged;
  const EmailField({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    _emailController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.removeListener(onListen);
    _emailController.dispose();
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
          borderRadius: BorderRadius.circular(29.0)),
      child: TextFormField(
        controller: _emailController,
        style: textStyleSimple(kPrimaryColor, 16.0, FontWeight.normal),
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: 'Enter Email',
          hintStyle:
              textStyleSimple(kPrimaryDeepLightColor, 16.0, FontWeight.w400),
          errorStyle:
              textStyleSimple(kPrimaryDeepColor, 12.0, FontWeight.normal),
          prefixIcon: const Icon(Icons.mail_rounded, color: kPrimaryColor),
          suffixIcon: _emailController.text.isEmpty
              ? Container(width: 0.0)
              : IconButton(
                  onPressed: () => _emailController.clear(),
                  icon: const Icon(Icons.close_rounded, color: kPrimaryColor)),
        ),
        keyboardType: TextInputType.emailAddress,
        cursorColor: kPrimaryDeepColor,
        autofillHints: const [AutofillHints.email],
        validator: emailValidator,
        onChanged: widget.onChanged,
      ),
    );
  }

  String? emailValidator(String? email) {
    if (email!.isEmpty) {
      // showSnackBar(context, 'Required Email');
      return 'Required email';
    } else {
      bool result = checkEmail(email);
      if (result) {
        // action perform
        // ignore: avoid_print
        print("Email : $result");
      } else {
        // showSnackBar(context, 'Please enter valid email');
        return 'Please enter valid email';
      }
    }
    return null;
  }

  bool checkEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern.toString());
    return (!regExp.hasMatch(value)) ? false : true;
  }
}
