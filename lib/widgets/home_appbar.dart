import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  final double opacity;
  final int selectIndex;
  final Function? onChangeIndex;
  final TabController tabController;

  const HomeAppBar(
      {super.key, required this.opacity, this.selectIndex = 0, this.onChangeIndex, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          color: Colors.white.withValues(alpha: opacity),
          height: kToolbarHeight + MediaQuery.of(context).padding.top,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Row(children: [
            Image.asset("assets/images/location_mine_black.png", width: 40, height: 40),
            Text("全国", style: TextStyle(fontSize: 14, color: Colors.black)),
            Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: 8),
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffF2F2F2).withValues(alpha: opacity),
                        border: Border.all(width: .5, color: Colors.white.withValues(alpha: 1 - opacity))),
                    child: Row(children: [
                      SizedBox(width: 8),
                      Image.asset("assets/images/icon_search_b.png", width: 15, height: 15),
                      SizedBox(width: 5),
                      Expanded(child: Text("搜功能  搜产品", style: TextStyle(color: Colors.black, fontSize: 12))),
                      Image.asset("assets/images/icon_mic_b.png", width: 15, height: 15),
                      SizedBox(width: 8)
                    ]))),
            Image.asset("assets/images/epass_home_service_icon.webp", width: 40, height: 40),
            Image.asset("assets/images/msg_mine_black.png", width: 40, height: 40),
            Image.asset("assets/images/more_mine_black.png", width: 40, height: 40)
          ])),
      Opacity(
          opacity: opacity,
          child: Container(
              height: 40,
              color: Colors.white,
              child: TabBar(
                  tabs: [Tab(text: "常用"), Tab(text: "消息")],
                  controller: tabController,
                  isScrollable: true,
                  dividerHeight: 40,
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: Color(0xff666666),
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  onTap: (index) {
                    onChangeIndex?.call(index);
                  },
                  indicatorSize: TabBarIndicatorSize.label,
                  tabAlignment: TabAlignment.start)))
    ]);
  }
}
