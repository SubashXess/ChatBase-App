import 'package:chatbase_app/Screens/Login_Screen/login_screen.dart';
import 'package:chatbase_app/Screens/SignUp_Screen/signup_screen.dart';
import 'package:chatbase_app/Screens/Welcome_Screen/Components/background.dart';
import 'package:chatbase_app/Styles/textstyle.dart';
import 'package:chatbase_app/Widgets/rounded_button.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Welcome to ChatBase',
                      style:
                          textStyleSimple(kPrimaryColor, 20.0, FontWeight.bold),
                    ),
                    SizedBox(height: size.height * 0.05),
                    SvgPicture.asset('assets/icons/chat.svg',
                        height: size.height * 0.45),
                    SizedBox(height: size.height * 0.05),
                    RoundedButton(
                      buttonText: 'LOGIN',
                      bgColor: kPrimaryDeepColor,
                      textColor: Colors.white,
                      overlayColor: kPrimaryColor,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                      },
                    ),
                    // SizedBox(height: size.height * 0.05),
                    RoundedButton(
                      buttonText: 'SIGN UP',
                      bgColor: kPrimaryDeepLightColor,
                      textColor: Colors.white,
                      overlayColor: kPrimaryColor,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
