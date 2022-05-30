import 'package:chatbase_app/Models/chat_messages.dart';
import 'package:chatbase_app/Screens/Chat_Details_Screen/chat_details_screen.dart';
import 'package:chatbase_app/Styles/textstyle.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessages? chatMessages;
  const ChatBubble({Key? key, this.chatMessages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: chatMessages!.type == MessageType.receiver
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 5.0, left: 16.0, right: 16.0),
          constraints: const BoxConstraints(maxWidth: 260.0),
          child: Column(
            children: [
              Align(
                alignment: (chatMessages!.type == MessageType.receiver
                    ? Alignment.topLeft
                    : Alignment.topRight),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: chatMessages!.type == MessageType.receiver
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(29.0),
                            topRight: Radius.circular(29.0),
                            bottomRight: Radius.circular(29.0),
                          )
                        : const BorderRadius.only(
                            topLeft: Radius.circular(29.0),
                            topRight: Radius.circular(29.0),
                            bottomLeft: Radius.circular(29.0),
                          ),
                    color: (chatMessages!.type == MessageType.receiver
                        ? kPrimaryLightColor
                        : kPrimaryColor),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 16.0),
                  child: Text(
                    "${chatMessages!.message}",
                    style: textStyleSimple(
                        chatMessages!.type == MessageType.receiver
                            ? Colors.black87
                            : Colors.white,
                        14.0,
                        FontWeight.normal),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Align(
                    alignment: (chatMessages!.type == MessageType.receiver
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Text(
                      "${chatMessages!.dateTime}",
                      style: textStyleSimple(
                        Colors.grey.shade600,
                        12.0,
                        FontWeight.normal,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget _buildReceivedText() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Text(
  //         "${chatMessages!.dateTime}",
  //         style: textStyleSimple(Colors.grey.shade500, 12.0, FontWeight.normal),
  //       ),
  //       Container(
  //         padding: const EdgeInsets.all(10.0),
  //         decoration: const BoxDecoration(
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(29.0),
  //             topRight: Radius.circular(29.0),
  //             bottomRight: Radius.circular(29.0),
  //           ),
  //         ),
  //         child: ConstrainedBox(
  //           constraints: const BoxConstraints(maxWidth: 180.0),
  //           child: Text(
  //             "${chatMessages!.message}",
  //             style: textStyleSimple(Colors.black54, 14.0, FontWeight.normal),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildSenderText() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Row(
  //         children: [
  //           Text(
  //             "${chatMessages!.dateTime}",
  //             style: textStyleSimple(
  //                 Colors.grey.shade500, 12.0, FontWeight.normal),
  //           ),
  //           Container(
  //             padding: const EdgeInsets.all(10.0),
  //             decoration: const BoxDecoration(
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(29.0),
  //                 topRight: Radius.circular(29.0),
  //                 bottomLeft: Radius.circular(29.0),
  //               ),
  //             ),
  //             child: ConstrainedBox(
  //               constraints: const BoxConstraints(maxWidth: 180.0),
  //               child: Text(
  //                 "${chatMessages!.message}",
  //                 style:
  //                     textStyleSimple(Colors.black54, 14.0, FontWeight.normal),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }
}
