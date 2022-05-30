import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddSocialIconButton extends StatefulWidget {
  const AddSocialIconButton({Key? key}) : super(key: key);

  @override
  State<AddSocialIconButton> createState() => _AddSocialIconButtonState();
}

class _AddSocialIconButtonState extends State<AddSocialIconButton> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: size.width,
          child: ListView.builder(
            itemCount: _counter,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => OutlinedButton(
              onPressed: () {
                // ignore: avoid_print
                print("Icon Clicked");
              },
              child: SvgPicture.asset("assets/socialicons/facebook.svg",
                  height: 20.0, color: kPrimaryColor),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29.0),
                  ),
                ),
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
          ),
        ),
        OutlinedButton(
          onPressed: _incrementCounter,
          child: SvgPicture.asset("assets/socialicons/facebook.svg",
              height: 20.0, color: kPrimaryColor),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(29.0),
              ),
            ),
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
      ],
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
    // Container(
    //   color: Colors.transparent,
    //   padding: const EdgeInsets.all(0),
    //   child: TextButton(
    //     onPressed: () {},
    //     child: const Icon(Icons.add_rounded),
    //     clipBehavior: Clip.antiAliasWithSaveLayer,
    //     style: ButtonStyle(
    //       elevation: MaterialStateProperty.all(5.0),
    //       backgroundColor: MaterialStateProperty.all(kPrimaryColor),
    //       foregroundColor: MaterialStateProperty.all(Colors.white),
    //       shape: MaterialStateProperty.all(RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(29.0))),
    //       padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
    //       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    //     ),
    //   ),
    // );

    // Container(
    //   margin: const EdgeInsets.only(right: 10.0),
    //   child: OutlinedButton(
    //     onPressed: onPressed,
    //     child: SvgPicture.asset(iconSrc, height: 20.0, color: kPrimaryColor),
    //     style: ButtonStyle(
    //       shape: MaterialStateProperty.all(
    //         RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(29.0),
    //         ),
    //       ),
    //       side: MaterialStateProperty.all(
    //           const BorderSide(color: kPrimaryLightColor)),
    //       overlayColor: MaterialStateProperty.resolveWith<Color?>(
    //         (states) {
    //           if (states.contains(MaterialState.pressed)) {
    //             return kPrimaryLightColor;
    //           }
    //           return null;
    //         },
    //       ),
    //     ),
    //   ),
    // );
 
