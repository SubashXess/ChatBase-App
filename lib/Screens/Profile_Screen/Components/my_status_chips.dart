import 'package:flutter/material.dart';

class StatusChips extends StatelessWidget {
  const StatusChips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.12,
      width: double.infinity,
      child: ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ActionChip(
                label: Icon(Icons.add),
                onPressed: () {},
              ),
            );
          }),
    );
  }
}
