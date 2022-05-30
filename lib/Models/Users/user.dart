import 'package:flutter/material.dart';

class User {
  num? id;
  String? firstName;
  String? lastName;
  String? profileImage;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.profileImage,
  });

  static List<User> generateUsers() {
    return [
      User(
          id: 1,
          firstName: "Jane",
          lastName: "Russel",
          profileImage: "assets/profilepic/userImage1.jpeg"),
      User(
          id: 2,
          firstName: "Glady's",
          lastName: "Murphy",
          profileImage: "assets/profilepic/userImage2.jpeg"),
      User(
          id: 3,
          firstName: "Jorge",
          lastName: "Henry",
          profileImage: "assets/profilepic/userImage3.jpeg"),
      User(
          id: 4,
          firstName: "Philip",
          lastName: "Fox",
          profileImage: "assets/profilepic/userImage4.jpeg"),
      User(
          id: 5,
          firstName: "Debra",
          lastName: "Hawkins",
          profileImage: "assets/profilepic/userImage5.jpeg"),
      User(
          id: 6,
          firstName: "Jacob",
          lastName: "Pena",
          profileImage: "assets/profilepic/userImage6.jpeg"),
      User(
          id: 7,
          firstName: "Andrey",
          lastName: "Jones",
          profileImage: "assets/profilepic/userImage7.jpeg"),
      User(
          id: 8,
          firstName: "John",
          lastName: "Wick",
          profileImage: "assets/profilepic/userImage8.jpeg"),
    ];
  }
}
