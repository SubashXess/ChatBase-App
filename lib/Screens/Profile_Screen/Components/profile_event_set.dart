import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';

class ProfileEventSet extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String buttonText;
  final Color buttonColor;
  final Widget child;
  const ProfileEventSet({
    Key? key,
    required this.onTap,
    required this.title,
    required this.buttonText,
    required this.buttonColor,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 4.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                onPressed: onTap,
                style: TextButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  elevation: 2.0,
                  padding:
                      const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29.0),
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          child,
        ],
      ),
    );
  }
}
