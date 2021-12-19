import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mail/constants/constants.dart';
import 'home_route.dart';
import 'inbox_route.dart';
import 'read_message_route.dart';
import 'package:mail/globals/variables.dart';

class DrawerItem extends StatelessWidget {
  String title;
  IconData icon;
  DrawerItem({Key? key, required this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: const Color(0xff585D6A),),
          Text(title, style: const TextStyle(fontSize: 25.0, color: Color(0xff585D6A))),
          Container(width: 10.0)
        ],
      ),
    );
  }
}


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
      
      endDrawer: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 100.0, bottom: 5.0, right: 5.0, top: 5.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            width: 400.0,
            // margin: EdgeInsets.only(bottom: 60.0),
            child: Stack(
              children: [
                Image.asset('assets/icons/min_gradient.png'),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    children: [
                      DrawerItem(icon: Icons.help, title: 'F.A.Q.'),
                      DrawerItem(icon: Icons.privacy_tip_outlined, title: 'Privacy policy'),
                      DrawerItem(icon: Icons.feedback, title: 'Feedback'),
                      DrawerItem(icon: Icons.info, title: 'About us'),
                      DrawerItem(icon: Icons.share, title: 'Share this app'),

                    ],
                  ),
                ),
              ],
            )),
        ),
      ),
      
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

