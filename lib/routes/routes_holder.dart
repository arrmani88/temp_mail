// import 'package:flutter/material.dart';
//
// class RoutesHolder extends StatelessWidget {
//   const RoutesHolder({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoutesHolder extends StatefulWidget {
  RoutesHolder({required this.title});
  final String title;

  @override
  _RoutesHolderState createState() => _RoutesHolderState();
}

class _RoutesHolderState extends State<RoutesHolder>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  Color currentColor = Colors.deepPurple;
  Color inactiveColor = Colors.black;
  late PageController tabBarController;
  late List<Tabs> tabs = [];

  @override
  void initState() {
    super.initState();
    currentPage = 0;

    tabs.add(
        Tabs(Icons.home, "Home"));
    tabs.add(
        Tabs(Icons.search, "Search"));
    tabs.add(
        Tabs(Icons.alarm, "Alarm"));
    tabs.add(
        Tabs(Icons.settings, "Settings"));

    tabBarController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    Widget tabView({required int destinationIndex}) {
      return Container(
        child: InkWell(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(tabs[currentPage].title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w700),),
                const SizedBox(height: 4),
                const Text("Click here to Change the tab To ", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 14.0),),
              ],
            )),
          onTap: () {
            setState(() {
              currentPage = destinationIndex;
              tabBarController.jumpToPage(currentPage);
            });
            }));
    }

    return Scaffold(
      body: PageView(
        controller: tabBarController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          tabView(destinationIndex: 3),
          tabView(destinationIndex: 0),
          tabView(destinationIndex: 1),
          tabView(destinationIndex: 2)
        ]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CubertoBottomBar(
          barBorderRadius: BorderRadius.circular(30.0),
          key: const Key("BottomBar"),
          inactiveIconColor: inactiveColor,
          tabStyle: CubertoTabStyle.STYLE_FADED_BACKGROUND,
          selectedTab: currentPage,
          tabs: tabs
            .map((value) => TabData(
            key: Key(value.title),
            iconData: value.icon,
            title: value.title,
            tabColor: const Color(0xff6AE0D9),
            tabGradient: getGradient()))
            .toList(),
          onTabChangedListener: (position, title, color) {
            setState(() {
              currentPage = position;
              tabBarController.jumpToPage(position);
            });
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabBarController.dispose();
    super.dispose();
  }
}

class Tabs {
  final IconData icon;
  final String title;
  Tabs(this.icon, this.title);
}

getGradient() {
  return LinearGradient(
    colors: [const Color(0xff6AE0D9).withOpacity(0.5), const Color(0xff6AE0D9).withOpacity(0.1)],
    stops: const [0.0, 0.7]
  );
}

