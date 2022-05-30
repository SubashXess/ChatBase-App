import 'package:chatbase_app/Components/alreadyhaveanaccountcheck.dart';
import 'package:chatbase_app/Components/forgotpasswordtext.dart';
import 'package:chatbase_app/Error/Text_Field_Errors/textfield_errors.dart';
import 'package:chatbase_app/Screens/Forgot_Password_Screen/forgotpasswordscreen.dart';
import 'package:chatbase_app/Screens/Home_Screen/home_screen.dart';
import 'package:chatbase_app/Screens/Login_Screen/Components/background.dart';
import 'package:chatbase_app/Screens/SignUp_Screen/signup_screen.dart';
import 'package:chatbase_app/Styles/textstyle.dart';
import 'package:chatbase_app/Widgets/emailfield.dart';
import 'package:chatbase_app/Widgets/passwordfield.dart';
import 'package:chatbase_app/Widgets/rounded_button.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String loadEmail = '';
  String loadPassword = '';

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
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Text('LOGIN',
                            style: textStyleSimple(
                                kPrimaryColor, 20.0, FontWeight.bold)),
                        SizedBox(height: size.height * 0.03),
                        SvgPicture.asset(
                          'assets/icons/login.svg',
                          height: size.height * 0.25,
                        ),
                        SizedBox(height: size.height * 0.03),
                        EmailField(
                          onChanged: (String email) {
                            loadEmail = email.trim().replaceAll(' ', '');
                            // ignore: avoid_print
                            print("Load Email :  $loadEmail");
                          },
                        ),
                        SizedBox(height: size.height * 0.015),
                        PasswordField(
                          onChanged: (String password) {
                            loadPassword = password.trim().replaceAll(' ', '');
                            // ignore: avoid_print
                            print("Load Password : $loadPassword");
                          },
                        ),
                        SizedBox(height: size.height * 0.02),
                        ForgotPasswordText(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordScreen()));
                          },
                        ),
                        SizedBox(height: size.height * 0.02),
                        RoundedButton(
                          buttonText: 'LOGIN',
                          bgColor: kPrimaryDeepColor,
                          textColor: Colors.white,
                          overlayColor: kPrimaryColor,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // ignore: avoid_print
                              print("Logged In");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                            }
                          },
                        ),
                        SizedBox(height: size.height * 0.03),
                        AlreadyHaveAnAccountCheck(
                          login: true,
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
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
      ),
    );
  }
}
