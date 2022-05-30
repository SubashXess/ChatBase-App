import 'package:chatbase_app/Screens/Forgot_Password_Screen/Components/background.dart';
import 'package:chatbase_app/Styles/textstyle.dart';
import 'package:chatbase_app/Widgets/emailfield.dart';
import 'package:chatbase_app/Widgets/rounded_button.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String loadEmail = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Background(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      Text('RESET PASSWORD',
                          // textAlign: TextAlign.center,
                          style: textStyleSimple(
                              kPrimaryColor, 20.0, FontWeight.bold)),
                      SizedBox(height: size.height * 0.02),
                      Text(
                          'Please enter your email address to reset your password',
                          textAlign: TextAlign.center,
                          style: textStyleSimple(
                              kPrimaryDeepLightColor, 16.0, FontWeight.w400)),
                      SizedBox(height: size.height * 0.03),
                      EmailField(
                        onChanged: (String email) {
                          loadEmail = email.trim().replaceAll(' ', '');
                          // ignore: avoid_print
                          print(loadEmail);
                        },
                      ),
                      SizedBox(height: size.height * 0.01),
                      RoundedButton(
                        buttonText: 'RESET PASSWORD',
                        bgColor: kPrimaryDeepColor,
                        textColor: Colors.white,
                        overlayColor: kPrimaryColor,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // ignore: avoid_print
                            print(loadEmail);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
