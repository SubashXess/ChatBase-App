import 'dart:ui';
import 'package:chatbase_app/Screens/Profile_Screen/Components/bio_menu.dart';
import 'package:chatbase_app/Screens/Profile_Screen/Components/my_status_chips.dart';
import 'package:chatbase_app/Screens/Profile_Screen/Components/profile_event_set.dart';
import 'package:chatbase_app/Screens/Profile_Screen/Components/profile_screen_list_items.dart';
import 'package:chatbase_app/Screens/Profile_Screen/Components/profile_settings_lists.dart';
import 'package:chatbase_app/Screens/Profile_Screen/Components/profile_sheet.dart';
import 'package:chatbase_app/Screens/Profile_Screen/Components/request_modal_sheet.dart';
import 'package:chatbase_app/Screens/Profile_Screen/Components/adding_social_icon_button.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final settingsList = ProfileScreenListItem.generateSettingsList();
  final ScrollController _scrollController = ScrollController();
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
              height: size.height / 5,
              width: size.width,
              child: Image.asset("assets/images/image1.jpg", fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              height: size.height / 1.5,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 120),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(29.0),
                ),
              ),
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                clipBehavior: Clip.none,
                fit: StackFit.loose,
                children: [
                  Positioned(
                    top: -50,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(width: 3.8, color: Colors.white),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 5.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/profilepic/userImage4.jpeg"),
                        maxRadius: 56.0,
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height / 10,
                    child: Container(
                      width: size.width,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          const Text(
                            "Kelvin Dukkon",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "UI/UX Designer",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          // const StatusChips(),
                          // Container(
                          //   width: double.infinity,
                          //   height: ,
                          //   child: const AddSocialIconButton(),
                          // ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10.0, left: 16.0, right: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Bio",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: size.height * 0.12,
                                  margin: const EdgeInsets.only(top: 5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14.5),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black45,
                                        spreadRadius: 0.0,
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
        ],
      ),
    );
    //     SingleChildScrollView(
    //       controller: _scrollController,
    //       physics: const BouncingScrollPhysics(),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisSize: MainAxisSize.max,
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.only(left: 16.0),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 const Text(
    //                   "My Profile",
    //                   style: TextStyle(
    //                     fontSize: 24.0,
    //                     color: kPrimaryColor,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 Align(
    //                   alignment: Alignment.topRight,
    //                   child: IconButton(
    //                     onPressed: () {
    //                       showModal(context);
    //                     },
    //                     icon: const Icon(Icons.settings_rounded),
    //                     splashRadius: 20.0,
    //                     color: kPrimaryColor,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           const SizedBox(height: 10.0),
    //           Padding(
    //             padding: const EdgeInsets.only(left: 16.0, right: 16.0),
    //             child: Row(
    //               children: [
    //                 Container(
    //                   clipBehavior: Clip.antiAliasWithSaveLayer,
    //                   decoration: BoxDecoration(
    //                       border:
    //                           Border.all(width: 4.0, color: kPrimaryLightColor),
    //                       borderRadius: BorderRadius.circular(46.0)),
    //                   child: const CircleAvatar(
    //                     backgroundColor: kPrimaryColor,
    //                     backgroundImage:
    //                         AssetImage('assets/profilepic/userImage3.jpeg'),
    //                     maxRadius: 46.0,
    //                   ),
    //                 ),
    //                 Container(
    //                   width: size.width * 0.56,
    //                   // color: Colors.red,
    //                   margin: const EdgeInsets.only(left: 16.0),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: const [
    //                       Text(
    //                         "Dia Framton",
    //                         style: TextStyle(
    //                           color: Colors.black,
    //                           fontSize: 20.0,
    //                           fontWeight: FontWeight.bold,
    //                           overflow: TextOverflow.ellipsis,
    //                         ),
    //                       ),
    //                       Text(
    //                         'Senior Designer',
    //                         style: TextStyle(
    //                           color: Colors.black45,
    //                           fontSize: 14.0,
    //                           fontWeight: FontWeight.w400,
    //                           overflow: TextOverflow.ellipsis,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           SizedBox(height: size.height * 0.016),

    //           const ProfileSettingsList(),

    //           // TextButton(
    //           //   child: const Text(
    //           //     "Go Pro",
    //           //     style: TextStyle(color: Colors.white),
    //           //   ),
    //           //   style: ButtonStyle(
    //           //     backgroundColor: MaterialStateProperty.all(kPrimaryColor),
    //           //     shape: MaterialStateProperty.all(RoundedRectangleBorder(
    //           //         borderRadius: BorderRadius.circular(29.0))),
    //           //     padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
    //           //         horizontal: 14.0, vertical: 8.0)),
    //           //     overlayColor: MaterialStateProperty.all(kPrimaryDeepColor),
    //           //   ),
    //           //   onPressed: () {
    //           //     // ignore: avoid_print
    //           //     print("Go Pro");
    //           //   },
    //           // ),
    //           // const Padding(
    //           //   padding: EdgeInsets.only(left: 16.0, right: 16.0),
    //           //   child: BioMenu(),
    //           // ),
    //           // const RequestModalSheet(),
    //           // ProfileEventSet(
    //           //   onTap: () {
    //           //     // ignore: avoid_print
    //           //     print("Set Notes");
    //           //   },
    //           //   title: "Dia's Notes",
    //           //   buttonText: "Set Notes",
    //           //   buttonColor: kPrimaryColor,
    //           //   child: Container(),
    //           // ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    // void showModal(BuildContext context) {
    //   showModalBottomSheet(
    //       context: context,
    //       backgroundColor: Colors.transparent,
    //       builder: (context) {
    //         return BackdropFilter(
    //           filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
    //           child: DraggableScrollableSheet(
    //             maxChildSize: 0.8,
    //             minChildSize: 0.4,
    //             initialChildSize: 0.6,
    //             builder: (context, scrollController) => Container(
    //               height: MediaQuery.of(context).size.height / 2.5,
    //               clipBehavior: Clip.antiAliasWithSaveLayer,
    //               decoration: const BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.only(
    //                   topLeft: Radius.circular(29.0),
    //                   topRight: Radius.circular(29.0),
    //                 ),
    //               ),
    //               child: ListView(
    //                 physics: const BouncingScrollPhysics(),
    //                 controller: scrollController,
    //                 padding: const EdgeInsets.only(top: 16.0),
    //                 children: [
    //                   Center(
    //                     child: Container(
    //                       height: 4.0,
    //                       width: 40.0,
    //                       decoration: BoxDecoration(
    //                         color: Colors.grey.shade400,
    //                         borderRadius: BorderRadius.circular(29.0),
    //                       ),
    //                     ),
    //                   ),
    //                   const SizedBox(height: 10.0),
    //                   ListView.separated(
    //                     itemCount: settingsList.length,
    //                     padding: const EdgeInsets.only(top: 10.0, bottom: 16.0),
    //                     shrinkWrap: true,
    //                     physics: const BouncingScrollPhysics(),
    //                     itemBuilder: (context, index) {
    //                       return ListTile(
    //                         horizontalTitleGap: 16,
    //                         leading: Container(
    //                           height: 45.0,
    //                           width: 45.0,
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(29.0),
    //                             color: settingsList[index].color!.shade50,
    //                           ),
    //                           child: Icon(
    //                             settingsList[index].icon,
    //                             size: 24.0,
    //                             color: settingsList[index].color!.shade400,
    //                           ),
    //                         ),
    //                         title: Text(settingsList[index].title!),
    //                         trailing: Icon(
    //                           Icons.arrow_forward_ios_rounded,
    //                           size: 20.0,
    //                           color: Colors.grey.shade400,
    //                         ),
    //                         onTap: () {
    //                           // ignore: avoid_print
    //                           print(settingsList[index].title!);
    //                         },
    //                       );
    //                     },
    //                     separatorBuilder: (context, index) {
    //                       return const Divider(
    //                         indent: 40.0,
    //                         endIndent: 40.0,
    //                       );
    //                     },
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         );
    // });
  }
}
