import 'package:chatbase_app/Models/Users/messages.dart';
import 'package:chatbase_app/Screens/Chat_Screen/Components/chat_user_list.dart';
import 'package:chatbase_app/Models/users.dart';
import 'package:chatbase_app/Styles/shadowstyle.dart';
import 'package:chatbase_app/Styles/textstyle.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _searchController = TextEditingController();

  static List<Users> chatUsers = [
    Users(
        firstName: "Jane",
        lastName: "Russel",
        chatText:
            "which can then be used anywhere you want to use a popup menu.",
        profileImage: "assets/profilepic/userImage1.jpeg",
        time: "Now"),
    Users(
        firstName: "Glady's",
        lastName: "Murphy",
        chatText: "That's Great",
        profileImage: "assets/profilepic/userImage2.jpeg",
        time: "Yesterday"),
    Users(
        firstName: "Jorge",
        lastName: "Henry",
        chatText:
            "If you are going to use a gridView or listview for laying out the images on the screen.",
        profileImage: "assets/profilepic/userImage3.jpeg",
        time: "31 Mar"),
    Users(
        firstName: "Philip",
        lastName: "Fox",
        chatText: "Busy! Call me in 20 mins",
        profileImage: "assets/profilepic/userImage4.jpeg",
        time: "28 Mar"),
    Users(
        firstName: "Debra",
        lastName: "Hawkins",
        chatText: "Thankyou, It's awesome",
        profileImage: "assets/profilepic/userImage5.jpeg",
        time: "23 Mar"),
    Users(
        firstName: "Jacob",
        lastName: "Pena",
        chatText: "will update you in evening",
        profileImage: "assets/profilepic/userImage6.jpeg",
        time: "17 Mar"),
    Users(
        firstName: "Andrey",
        lastName: "Jones",
        chatText: "Can you please share the file?",
        profileImage: "assets/profilepic/userImage7.jpeg",
        time: "24 Feb"),
    Users(
        firstName: "John",
        lastName: "Wick",
        chatText: "How are you?",
        profileImage: "assets/profilepic/userImage8.jpeg",
        time: "18 Feb"),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 16.0, right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Chats',
                          style: textStyleSimple(
                              kPrimaryColor, 24.0, FontWeight.bold),
                        ),
                        MaterialButton(
                          child: Row(children: [
                            const Icon(Icons.add_rounded,
                                color: kPrimaryColor, size: 24.0),
                            const SizedBox(width: 6.0),
                            Text('New',
                                style: textStyleSimple(
                                    kPrimaryColor, 16.0, FontWeight.w600)),
                          ]),
                          color: kPrimaryLightColor,
                          elevation: 0.0,
                          splashColor: Colors.transparent,
                          highlightElevation: 2.0,
                          padding: const EdgeInsets.all(0.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(29.0)),
                          highlightColor: Colors.transparent,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 16.0, left: 16.0, right: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29.0),
                          color: kPrimaryLightColor,
                          boxShadow: [
                            boxShadowStyle(
                                kPrimaryDeepLightColor.withOpacity(0.0)),
                          ]),
                      child: TextFormField(
                        controller: _searchController,
                        style: textStyleSimple(
                            kPrimaryColor, 16.0, FontWeight.normal),
                        cursorColor: kPrimaryDeepColor,
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: textStyleSimple(
                              kPrimaryDeepLightColor, 16.0, FontWeight.normal),
                          border: InputBorder.none,
                          prefixIcon: const Icon(Icons.search_rounded,
                              color: kPrimaryDeepLightColor, size: 28.0),
                        ),
                        onChanged: searchChat,
                      ),
                    ),
                  ),
                  ListView.separated(
                    itemCount: chatUsers.length,
                    shrinkWrap: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ChatUserList(
                        firstName: chatUsers[index].firstName!,
                        lastName: chatUsers[index].lastName!,
                        chatText: chatUsers[index].chatText!,
                        profileImage: chatUsers[index].profileImage!,
                        time: chatUsers[index].time!,
                        isMessageRead:
                            (index == 0 || index == 3) ? true : false,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(indent: 75.0);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void searchChat(String query) {
    final suggestions = chatUsers.where((chat) {
      final chatUserName =
          chat.firstName!.toLowerCase() + chat.lastName!.toLowerCase();

      final input = query.toLowerCase();

      return chatUserName.contains(input);
    }).toList();
    setState(() => chatUsers = suggestions);
  }
}
