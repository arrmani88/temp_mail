import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';

class DrawerItem extends StatelessWidget {
  String title;
  IconData icon;
  String url;
  DrawerItem({Key? key, required this.icon, required this.title, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {if (!await launch(url)) throw 'Could not launch $url';},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        width: 500.0,
        child: Row(
          children: [
            Icon(icon, color: const Color(0xff585D6A)),
            const SizedBox(width: 20.0),
            Text(title, style: const TextStyle(fontSize: 25.0, color: Color(0xff585D6A))),
          ],
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 100.0, bottom: 5.0, right: 5.0, top: 5.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            width: 400.0,
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(15.0)),
                    child: Image.asset('assets/icons/min_gradient.png')
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    children: [
                      Container(
                        width: 500.0,
                        height: 100.0,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 30.0),
                            const Icon(Icons.menu, color: Color(0xff585D6A), size: 35),
                            const SizedBox(width: 20.0),
                            Text('menu'.tr(), style: TextStyle(fontSize: 35.0, color: Color(0xff585D6A))),
                          ],
                        ),
                      ),
                      DrawerItem(title: 'F.A.Q.', icon: Icons.help, url: 'https://www.google.com',),
                      DrawerItem(title: 'privacy_policy'.tr(), icon: Icons.privacy_tip_outlined, url: 'https://www.google.com',),
                      DrawerItem(title: 'feedback'.tr(), icon: Icons.feedback, url: 'https://www.google.com',),
                      DrawerItem(title: 'share_this_app'.tr(), icon: Icons.share, url: 'https://www.google.com',),
                      DrawerItem(title: 'about_us'.tr(), icon: Icons.info, url: 'https://www.google.com',),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

void f() {
  return
}