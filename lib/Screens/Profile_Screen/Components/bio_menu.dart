import 'package:flutter/material.dart';

class BioMenu extends StatelessWidget {
  const BioMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "@diaframton895",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Text(
          "Digital Creator",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: Colors.black45,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.home_work_rounded,
              color: Colors.grey.shade600,
              size: 18.0,
            ),
            const Text(
              "Works at ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: Colors.black45,
              ),
            ),
            const Text(
              "InfoSys",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.home_rounded,
              color: Colors.grey.shade600,
              size: 18.0,
            ),
            const Text(
              "Lives in ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: Colors.black45,
              ),
            ),
            const Text(
              "Rourkela",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.cake_rounded,
              color: Colors.grey.shade600,
              size: 18.0,
            ),
            const Text(
              "Birthday ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: Colors.black45,
              ),
            ),
            const Text(
              "August 26 1999",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.02),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: const [
        //     Text(
        //       "About",
        //       textAlign: TextAlign.center,
        //       style: TextStyle(
        //         fontSize: 14.0,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.black,
        //       ),
        //     ),
        //     Text(
        //       "You may see that flutter provide you a simple application code that simply counts or increment the number when a user clicks on a button and the counter variable get incremented and displayed on the screen.",
        //       style: TextStyle(
        //         fontSize: 14.0,
        //         fontWeight: FontWeight.normal,
        //         color: Colors.black54,
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
