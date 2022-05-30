import 'package:chatbase_app/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ShowFullFrameImage extends StatelessWidget {
  final String name;
  final String profilePic;
  const ShowFullFrameImage(
      {Key? key, required this.name, required this.profilePic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          maxLines: 1,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: kPrimaryColor,
            size: 20.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
          highlightColor: Colors.transparent,
          splashColor: kPrimaryLightColor,
          splashRadius: 20.0,
        ),
      ),
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        // scrollDirection: Axis.vertical,
        child: SizedBox(
          height: size.height,
          width: double.infinity,
          child: Image.asset(profilePic, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
