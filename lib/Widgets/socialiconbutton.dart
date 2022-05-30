import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIconButton extends StatelessWidget {
  final String iconSrc;
  final Function() onPressed;
  const SocialIconButton(
      {Key? key, required this.iconSrc, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: OutlinedButton(
        onPressed: onPressed,
        child: SvgPicture.asset(iconSrc,
            width: 20.0, height: 20.0, color: kPrimaryColor),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const CircleBorder()),
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
          side: MaterialStateProperty.all(
              const BorderSide(color: kPrimaryLightColor)),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return kPrimaryLightColor;
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}
