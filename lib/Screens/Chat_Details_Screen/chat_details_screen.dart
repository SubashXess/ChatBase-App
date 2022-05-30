import 'dart:ui';

import 'package:chatbase_app/Models/chat_messages.dart';
import 'package:chatbase_app/Models/users.dart';
import 'package:chatbase_app/Screens/Chat_Details_Screen/Components/chat_bubble.dart';
import 'package:chatbase_app/Screens/Chat_Details_Screen/Components/chat_details_screen_appbar.dart';
import 'package:chatbase_app/Screens/Chat_Details_Screen/Components/send_menu_items.dart';
import 'package:chatbase_app/Styles/shadowstyle.dart';
import 'package:chatbase_app/Styles/textstyle.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';

enum MessageType {
  sender,
  receiver,
}

class ChatDetails extends StatefulWidget {
  final String userName;
  final String profilePic;

  const ChatDetails(
      {Key? key, required this.userName, required this.profilePic})
      : super(key: key);

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  final TextEditingController _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  static List<ChatMessages> chatMessages = [
    ChatMessages(
        message: "Hi John", dateTime: "10:14", type: MessageType.receiver),
    ChatMessages(
        message: "Hope you are doin good",
        dateTime: "10:14",
        type: MessageType.receiver),
    ChatMessages(
        message: "Hello Jane, I'm good what about you?",
        dateTime: "10:14",
        type: MessageType.sender),
    ChatMessages(
        message: "I'm fine, Working from home",
        dateTime: "10:14",
        type: MessageType.receiver),
    ChatMessages(
        message: "Oh! Nice. Same here man",
        dateTime: "10:14",
        type: MessageType.sender),
    ChatMessages(
        message: "Hi John", dateTime: "10:14", type: MessageType.receiver),
    ChatMessages(
        message: "Hope you are doin good",
        dateTime: "10:14",
        type: MessageType.receiver),
    ChatMessages(
        message:
            "Hello Jane, I'm good what about you? Hello Jane, I'm good what about you?",
        dateTime: "10:14",
        type: MessageType.sender),
    ChatMessages(
        message: "I'm fine, Working from home",
        dateTime: "10:14",
        type: MessageType.receiver),
    ChatMessages(
        message: "Oh! Nice. Same here man",
        dateTime: "10:14",
        type: MessageType.sender),
  ];

  List<SendMenuItems> menuItems = [
    SendMenuItems(
        title: "Photos", icons: Icons.image_rounded, color: Colors.amber),
    SendMenuItems(
        title: "Video", icons: Icons.video_library_rounded, color: Colors.blue),
    SendMenuItems(
        title: "Audio", icons: Icons.headphones_rounded, color: Colors.red),
    SendMenuItems(
        title: "Document",
        icons: Icons.insert_drive_file_rounded,
        color: Colors.deepOrange),
    SendMenuItems(
        title: "Location",
        icons: Icons.location_on_rounded,
        color: Colors.green),
    SendMenuItems(
        title: "Contact", icons: Icons.person_rounded, color: Colors.purple),
  ];

  @override
  void initState() {
    _textController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    _textController.removeListener(onListen);
    _textController.dispose();
    super.dispose();
  }

  void onListen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: ChatDetailsScreenAppBar(
          userName: widget.userName,
          profilePic: widget.profilePic,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              ListView.builder(
                itemCount: chatMessages.length,
                shrinkWrap: true,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                reverse: true,
                padding: const EdgeInsets.only(top: 16.0, bottom: 90.0),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ChatBubble(
                    chatMessages: chatMessages[index],
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 80.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(29.0),
                      topRight: Radius.circular(29.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45.withOpacity(0.4),
                        blurRadius: 2.5,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Material(
                          color: kPrimaryDeepColor,
                          child: InkWell(
                            splashColor: kPrimaryColor,
                            child: const SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: Icon(
                                Icons.add_rounded,
                                color: Colors.white,
                                size: 24.0,
                              ),
                            ),
                            onTap: () {
                              // ignore: avoid_print
                              print('Show Modal');
                              setState(() {
                                showModal();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29.0),
                            color: kPrimaryLightColor,
                          ),
                          child: TextFormField(
                            controller: _textController,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            textCapitalization: TextCapitalization.sentences,

                            style: textStyleSimple(
                                kPrimaryColor, 16.0, FontWeight.normal),
                            cursorColor: kPrimaryColor,
                            // validator: textFieldValidate,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type message...',
                              hintStyle: const TextStyle(
                                  color: kPrimaryDeepLightColor,
                                  fontSize: 16.0),
                              suffixIcon: IconButton(
                                icon: _textController.text.isEmpty
                                    ? const Icon(
                                        Icons.camera_alt_rounded,
                                        color: kPrimaryColor,
                                      )
                                    : const Icon(
                                        Icons.close_rounded,
                                        color: kPrimaryColor,
                                      ),
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                splashRadius: 10,
                                iconSize: 24.0,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.all(0.0),
                                onPressed: () {
                                  _textController.text.isEmpty
                                      ?
                                      // ignore: avoid_print
                                      print('Open Camera')
                                      : _textController.clear();
                                },
                              ),
                            ),
                            onChanged: (textMessage) {
                              // ignore: avoid_print
                              print(textMessage);
                            },
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: FloatingActionButton(
                          child: const Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                            size: 18.0,
                          ),
                          backgroundColor: kPrimaryDeepColor,
                          elevation: 0.0,
                          mini: true,
                          splashColor: kPrimaryColor,
                          highlightElevation: 0.0,
                          onPressed: () {
                            validateTextField();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showModal() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: DraggableScrollableSheet(
              maxChildSize: 0.8,
              minChildSize: 0.4,
              initialChildSize: 0.6,
              builder: (context, scrollController) => Container(
                height: MediaQuery.of(context).size.height / 2.5,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(29.0),
                    topRight: Radius.circular(29.0),
                  ),
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  padding: const EdgeInsets.only(top: 16.0),
                  children: [
                    Center(
                      child: Container(
                        height: 4.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(29.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ListView.separated(
                      itemCount: menuItems.length,
                      padding: const EdgeInsets.only(top: 10.0, bottom: 16.0),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          child: ListTile(
                            horizontalTitleGap: 16,
                            leading: Container(
                              height: 45.0,
                              width: 45.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(29.0),
                                color: menuItems[index].color!.shade50,
                              ),
                              child: Icon(
                                menuItems[index].icons,
                                size: 24.0,
                                color: menuItems[index].color!.shade400,
                              ),
                            ),
                            title: Text(menuItems[index].title!),
                          ),
                          onTap: () {
                            // ignore: avoid_print
                            print(menuItems[index].title);
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          indent: 40.0,
                          endIndent: 40.0,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void validateTextField() {
    if (_textController.text.isEmpty) {
      // ignore: avoid_print
      print("Not send");
    } else {
      // ignore: avoid_print
      print("Message send : " + _textController.text);
    }
  }
}
