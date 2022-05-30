import 'package:chatbase_app/Screens/Profile_Screen/Components/post_list_items.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';

class RequestModalSheet extends StatefulWidget {
  const RequestModalSheet({Key? key}) : super(key: key);

  @override
  State<RequestModalSheet> createState() => _RequestModalSheetState();
}

class _RequestModalSheetState extends State<RequestModalSheet>
    with TickerProviderStateMixin<RequestModalSheet> {
  final ScrollController scrollController = ScrollController();

  final postList = ProfilePostListItems.generateProfileListItems();
  @override
  Widget build(BuildContext context) {
    final TabController _tabController = TabController(length: 3, vsync: this);

    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              // labelPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
              isScrollable: true,
              indicator: CircleTabIndicator(color: kPrimaryColor, radius: 4),
              tabs: const [
                Tab(
                  child: Text(
                    "Post",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Request",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "About",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: size.height,
          child: TabBarView(
            controller: _tabController,
            children: [
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: postList.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200.0,
                      width: 150.0,
                      margin: const EdgeInsets.all(2.0),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.0),
                        image: DecorationImage(
                          image: AssetImage(postList[index].image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
              // ListView.builder(
              //     itemCount: postList.length,
              //     shrinkWrap: true,
              //     physics: const BouncingScrollPhysics(),
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (_, index) {
              //       return Container(
              //         height: size.height * 0.2,
              //         width: 150.0,
              //         margin: const EdgeInsets.only(top: 16.0),
              //         decoration: BoxDecoration(
              //           color: Colors.red,
              //           borderRadius: BorderRadius.circular(29.0),
              //           image: DecorationImage(
              //             image: AssetImage(postList[index].image!),
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //       );
              //     }),
              ListView.builder(
                  itemCount: postList.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(29.0),
                        image: DecorationImage(
                          image: AssetImage(postList[index].image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
              ListView.builder(
                  itemCount: postList.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(29.0),
                        image: DecorationImage(
                          image: AssetImage(postList[index].image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
            ],
          ),
        )
      ],
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;
  CircleTabIndicator({required Color color, required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;
  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
