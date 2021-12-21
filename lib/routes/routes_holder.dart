import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mail/constants/constants.dart';
import 'package:mail/widgets/drawer.dart';
import 'home_route.dart';
import 'inbox_route.dart';
import 'package:mail/globals/variables.dart';

class RoutesHolder extends StatefulWidget {
  const RoutesHolder({Key? key}) : super(key: key);
  @override _RoutesHolderState createState() => _RoutesHolderState();
}
class _RoutesHolderState extends State<RoutesHolder> with SingleTickerProviderStateMixin {
  late int currentPage;
  late PageController tabBarController;
  late List<Tabs> tabs = [];
  double bottomBarPadding = kScreenWidth > 500.0 ? (kScreenWidth - 500.0) * 0.5 : 0.0;

  @override
  void initState() {
    super.initState();
    currentPage = 0;
    tabs.add(Tabs(Icons.home, "Home"));
    tabs.add(Tabs(Icons.inbox, "Inbox"));
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
        ],
      ),
      endDrawer: MyDrawer(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: bottomBarPadding),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: CubertoBottomBar(
            drawer: const CubertoDrawer(style: CubertoDrawerStyle.END_DRAWER),
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
              tabGradient: getGradient())
            ).toList(),
            onTabChangedListener: (position, title, color) {
              setState(() {
                isLanguagesTabOpened = false;
                currentPage = position;
                tabBarController.jumpToPage(position);
              });
            },
          ),
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

