import 'package:chatbase_app/Components/alreadyhaveanaccountcheck.dart';
import 'package:chatbase_app/Components/divider.dart';
import 'package:chatbase_app/Screens/Login_Screen/login_screen.dart';
import 'package:chatbase_app/Screens/SignUp_Screen/Components/background.dart';
import 'package:chatbase_app/Styles/textstyle.dart';
import 'package:chatbase_app/Widgets/emailfield.dart';
import 'package:chatbase_app/Widgets/namefield.dart';
import 'package:chatbase_app/Widgets/passwordfield.dart';
import 'package:chatbase_app/Widgets/rounded_button.dart';
import 'package:chatbase_app/Widgets/socialiconbutton.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Background(
          child: Form(
            key: _formKey,
            child: SizedBox(
              height: size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Text('SIGN UP',
                            style: textStyleSimple(
                                kPrimaryColor, 20.0, FontWeight.bold)),
                        SizedBox(height: size.height * 0.03),
                        SvgPicture.asset('assets/icons/signup.svg',
                            height: size.height * 0.25),
                        SizedBox(height: size.height * 0.02),
                        NameField(
                          onChanged: (String name) {
                            // ignore: avoid_print
                            print(name);
                          },
                        ),
                        SizedBox(height: size.height * 0.015),
                        EmailField(
                          onChanged: (String email) {
                            // ignore: avoid_print
                            print(email);
                          },
                        ),
                        SizedBox(height: size.height * 0.015),
                        PasswordField(
                          onChanged: (String password) {
                            // ignore: avoid_print
                            print(password);
                          },
                        ),
                        SizedBox(height: size.height * 0.02),
                        RoundedButton(
                          buttonText: 'SIGN UP',
                          bgColor: kPrimaryDeepColor,
                          textColor: Colors.white,
                          overlayColor: kPrimaryColor,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // ignore: avoid_print
                              print("Account Created!");
                            }
                          },
                        ),
                        SizedBox(height: size.height * 0.02),
                        AlreadyHaveAnAccountCheck(
                            login: false,
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            }),
                        const OrDivider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialIconButton(
                              iconSrc: 'assets/icons/google.svg',
                              onPressed: () {},
                            ),
                            SocialIconButton(
                              iconSrc: 'assets/icons/facebook.svg',
                              onPressed: () {},
                            ),
                            SocialIconButton(
                              iconSrc: 'assets/icons/apple.svg',
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
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
