import 'dart:ui';

import 'package:chatbase_app/Screens/Chat_Details_Screen/chat_details_screen.dart';
import 'package:chatbase_app/Screens/Chat_Screen/Components/chatlist_option_menu.dart';
import 'package:chatbase_app/Screens/Chat_Screen/Components/photo_dialog_box.dart';
import 'package:chatbase_app/Styles/textstyle.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';

class ChatUserList extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String chatText;
  final String profileImage;
  final String time;
  final bool isMessageRead;
  const ChatUserList({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.chatText,
    required this.profileImage,
    required this.time,
    required this.isMessageRead,
  }) : super(key: key);

  @override
  State<ChatUserList> createState() => _ChatUserListState();
}

class _ChatUserListState extends State<ChatUserList> {
  List<ChatListOptionMenu> chatlistOptionMenu = [
    ChatListOptionMenu(
        title: "Pin", color: Colors.green, icons: Icons.push_pin_rounded),
    ChatListOptionMenu(
        title: "Archive", color: Colors.purple, icons: Icons.archive_rounded),
    ChatListOptionMenu(
        title: "Mute notifications",
        color: Colors.blue,
        icons: Icons.notifications_off_rounded),
    ChatListOptionMenu(
        title: "Hide",
        color: Colors.orange,
        icons: Icons.visibility_off_rounded),
    ChatListOptionMenu(
        title: "Delete",
        fontWeight: FontWeight.bold,
        textColor: Colors.red,
        color: Colors.red,
        icons: Icons.delete_rounded),
    ChatListOptionMenu(
        title: "Block",
        fontWeight: FontWeight.bold,
        textColor: Colors.red,
        color: Colors.red,
        icons: Icons.block_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    String userName = widget.firstName + " " + widget.lastName;

    return GestureDetector(
      child: ListTile(
        leading: GestureDetector(
          child: CircleAvatar(
            backgroundImage: AssetImage(widget.profileImage),
            backgroundColor: kPrimaryDeepLightColor,
            maxRadius: 28.0,
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => PhotoDialogBox(
                    profilePic: widget.profileImage, name: userName));
          },
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        title: Text(
          widget.firstName + " " + widget.lastName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textStyleSimple(Colors.black87, 16.0, FontWeight.w600),
        ),
        subtitle: Text(
          widget.chatText,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textStyleSimple(
            widget.isMessageRead ? Colors.grey.shade800 : Colors.grey.shade600,
            14.0,
            widget.isMessageRead ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.time,
              style: textStyleSimple(
                widget.isMessageRead ? kPrimaryColor : Colors.grey.shade400,
                12.0,
                widget.isMessageRead ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            widget.isMessageRead
                ? Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: kPrimaryColor,
                    ),
                    child: const Text(
                      '1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  )
                : Container(width: 0.0),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChatDetails(
                  userName: userName,
                  profilePic: widget.profileImage,
                )));
        // ignore: avoid_print
        print('Name : ' + userName);
        // ignore: avoid_print
        print('Profile Pic : ' + widget.profileImage);
      },
      onLongPress: () {
        showOptionSheet(context, userName);
        // ignore: avoid_print
        print("Name : " + userName);
      },
    );
  }

  void showOptionSheet(BuildContext context, String userName) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: DraggableScrollableSheet(
              maxChildSize: 0.8,
              minChildSize: 0.4,
              initialChildSize: 0.65,
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
                    Center(
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 16.0, left: 16.0, right: 16.0),
                        child: Text(
                          userName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ListView.separated(
                      itemCount: chatlistOptionMenu.length,
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
                                color: chatlistOptionMenu[index].color!.shade50,
                              ),
                              child: Icon(
                                chatlistOptionMenu[index].icons,
                                size: 24.0,
                                color:
                                    chatlistOptionMenu[index].color!.shade400,
                              ),
                            ),
                            title: Text(chatlistOptionMenu[index].title!),
                          ),
                          onTap: () {
                            // ignore: avoid_print
                            print(chatlistOptionMenu[index].title);
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
}
