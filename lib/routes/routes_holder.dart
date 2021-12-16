import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_route.dart';
import 'inbox_route.dart';
import 'read_message_route.dart';

class RoutesHolder extends StatefulWidget {
  RoutesHolder({required this.title});
  final String title;

  @override
  _RoutesHolderState createState() => _RoutesHolderState();
}

class _RoutesHolderState extends State<RoutesHolder> with SingleTickerProviderStateMixin {
  late int currentPage;
  late PageController tabBarController;
  late List<Tabs> tabs = [];

  @override
  void initState() {
    super.initState();
    currentPage = 0;
    tabs.add(Tabs(Icons.home, "Home"));
    tabs.add(Tabs(Icons.inbox, "Inbox"));
    tabs.add(Tabs(Icons.menu, "Menu"));
    tabBarController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: tabBarController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeRoute(),
          InboxRoute(),
          ReadMessageRoute()
        ]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(5.0),
        child: CubertoBottomBar(
          barBorderRadius: BorderRadius.circular(15.0),
          key: const Key("BottomBar"),
          inactiveIconColor: Colors.black,
          tabStyle: CubertoTabStyle.STYLE_FADED_BACKGROUND,
          selectedTab: currentPage,
          tabs: tabs.map((value) => TabData(
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
    colors: [const Color(0xff6AE0D9).withOpacity(0.5), const Color(0xff6AE0D9).withOpacity(0.2)],
    stops: const [0.0, 0.7]
  );
}

