import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String buttonText;
  final Color bgColor, overlayColor;
  final Color textColor;
  final Function() onPressed;
  const RoundedButton({
    Key? key,
    required this.buttonText,
    required this.bgColor,
    required this.textColor,
    required this.overlayColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29.0),
        child: TextButton(
          onPressed: onPressed,
          child: Text(buttonText),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(bgColor),
            overlayColor: MaterialStateProperty.all(overlayColor),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 20)),
            foregroundColor: MaterialStateProperty.all(textColor),
          ),
        ),
      ),
    );
  }
}
