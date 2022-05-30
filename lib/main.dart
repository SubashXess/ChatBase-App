import 'package:chatbase_app/Screens/Welcome_Screen/welcome_screen.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatBase App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        splashColor: kPrimaryLightColor,
        highlightColor: Colors.transparent,
      ),
      home: const WelcomeScreen(),
    );
  }
}
