import 'package:flutter/material.dart';

class ProfilePostListItems {
  String? title;
  String? name;
  String? desc;
  String? image;
  IconData? icon;
  IconData? trailingIcon;
  MaterialColor? color;

  ProfilePostListItems(
      {this.title,
      this.name,
      this.image,
      this.desc,
      this.icon,
      this.color,
      this.trailingIcon});

  static List<ProfilePostListItems> generateProfileListItems() {
    return [
      ProfilePostListItems(image: "assets/profilepic/userImage1.jpeg"),
      ProfilePostListItems(image: "assets/profilepic/userImage2.jpeg"),
      ProfilePostListItems(image: "assets/profilepic/userImage3.jpeg"),
      ProfilePostListItems(image: "assets/profilepic/userImage4.jpeg"),
      ProfilePostListItems(image: "assets/profilepic/userImage5.jpeg"),
      ProfilePostListItems(image: "assets/profilepic/userImage6.jpeg"),
      ProfilePostListItems(image: "assets/profilepic/userImage7.jpeg"),
      ProfilePostListItems(image: "assets/profilepic/userImage8.jpeg"),
      ProfilePostListItems(image: "assets/profilepic/userImage4.jpeg"),
    ];
  }
}
