import 'dart:ui';

import 'package:chatbase_app/Components/full_frame_image.dart';
import 'package:chatbase_app/Styles/textstyle.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';

class PhotoDialogBox extends StatelessWidget {
  final String profilePic;
  final String name;
  const PhotoDialogBox({Key? key, required this.profilePic, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),
          elevation: 0.0,
          backgroundColor: kPrimaryColor,
          child: dialogContent(context),
        ),
      ),
    );
  }

  dialogContent(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(29.0)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(profilePic, fit: BoxFit.cover),
            ),
            onTap: () {
              // ignore: avoid_print
              print("Navigate");
              // Navigator.of(context).pushReplacement(MaterialPageRoute(
              //     builder: (context) =>
              //         ShowFullFrameImage(name: name, profilePic: profilePic)));
            },
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            child: Text(
              name,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
