import 'package:chatbase_app/Styles/textstyle.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';

class ChatDetailsScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String userName;
  final String profilePic;
  const ChatDetailsScreenAppBar(
      {Key? key, required this.userName, required this.profilePic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      elevation: 2.5,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop(context);
                },
                splashColor: Colors.transparent,
                highlightColor: kPrimaryLightColor,
                splashRadius: 20.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(profilePic),
                    backgroundColor: kPrimaryDeepLightColor,
                    maxRadius: 20.0,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  horizontalTitleGap: 10.0,
                  minLeadingWidth: 0.0,
                  minVerticalPadding: 0,
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: textStyleSimple(
                          kPrimaryColor,
                          16.0,
                          FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Online',
                        style: textStyleSimple(
                            Colors.green[800]!, 12.0, FontWeight.normal),
                      ),
                    ],
                  ),
                  onTap: () {
                    // ignore: avoid_print
                    print('User Profile');
                  },
                ),
              ),
              const SizedBox(width: 10.0),
              SizedBox(
                child: Row(
                  children: [
                    IconButton(
                      highlightColor: kPrimaryLightColor,
                      splashColor: Colors.transparent,
                      splashRadius: 20.0,
                      icon: const Icon(Icons.videocam_rounded,
                          color: kPrimaryColor, size: 28.0),
                      onPressed: () {
                        // ignore: avoid_print
                        print('Video Call');
                      },
                    ),
                    const SizedBox(width: 4.0),
                    IconButton(
                      highlightColor: kPrimaryLightColor,
                      splashColor: Colors.transparent,
                      splashRadius: 20.0,
                      icon: const Icon(Icons.call_rounded,
                          color: kPrimaryColor, size: 25.0),
                      onPressed: () {
                        // ignore: avoid_print
                        print('Audio Call');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
