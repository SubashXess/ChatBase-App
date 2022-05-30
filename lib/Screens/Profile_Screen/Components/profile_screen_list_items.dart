import 'package:flutter/material.dart';

class ProfileScreenListItem {
  IconData? icon;
  String? title;
  MaterialColor? color;

  ProfileScreenListItem({this.icon, this.title, this.color});

 static List<ProfileScreenListItem> generateSettingsList() {
    return [
      ProfileScreenListItem(
          title: "Edit Profile",
          icon: Icons.person_rounded,
          color: Colors.pink),
      ProfileScreenListItem(
          title: "Chats",
          icon: Icons.chat_bubble_rounded,
          color: Colors.deepOrange),
      ProfileScreenListItem(
          title: "Subscriptions", icon: Icons.pix_rounded, color: Colors.amber),
      ProfileScreenListItem(
          title: "Account Settings",
          icon: Icons.manage_accounts_rounded,
          color: Colors.green),
      ProfileScreenListItem(
          title: "Privacy Settings",
          icon: Icons.shield_rounded,
          color: Colors.teal),
      ProfileScreenListItem(
          title: "Settings",
          icon: Icons.settings_rounded,
          color: Colors.purple),
      ProfileScreenListItem(
          title: "Help", icon: Icons.help_rounded, color: Colors.blue),
      ProfileScreenListItem(
          title: "Tell a Friend",
          icon: Icons.person_add_alt_rounded,
          color: Colors.red),
    ];
  }
}
