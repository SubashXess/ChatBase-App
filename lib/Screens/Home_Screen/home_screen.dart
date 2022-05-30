import 'package:chatbase_app/Screens/Call_Screen/call_screen.dart';
import 'package:chatbase_app/Screens/Chat_Screen/chat_screen.dart';
import 'package:chatbase_app/Screens/Notifications_Screens/notifications_screen.dart';

import 'package:chatbase_app/Screens/Profile_Screen/profile_screen.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _pagesData = [
    const ChatScreen(),
    const CallScreen(),
    const NotificationScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black.withOpacity(0.6),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: GNav(
              gap: 10,
              activeColor: kPrimaryDeepColor,
              iconSize: 24,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutCubic,
              color: kPrimaryColor,
              tabBackgroundColor: kPrimaryLightColor,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              tabs: const [
                GButton(icon: Icons.chat_rounded, text: 'Chats'),
                GButton(icon: Icons.call_rounded, text: 'Calls'),
                GButton(
                    icon: Icons.notifications_rounded, text: 'Notifications'),
                GButton(icon: Icons.account_circle_rounded, text: 'Profile'),
              ],
              selectedIndex: _currentIndex,
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: _pagesData[_currentIndex],
      ),
    );
  }
}
