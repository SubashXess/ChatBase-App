import 'package:flutter/material.dart';

class ProfileSheet extends StatefulWidget {
  const ProfileSheet({Key? key}) : super(key: key);

  @override
  State<ProfileSheet> createState() => _ProfileSheetState();
}

class _ProfileSheetState extends State<ProfileSheet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        width: double.infinity,
        // height: size.height / 2,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(29.0),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 6.0,
              spreadRadius: 0.0,
              color: Colors.black38,
            ),
          ],
        ),
        child: SizedBox(
          child: Container(),
        ),
      ),
    );
  }
}
