import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  String title;
  IconData icon;
  DrawerItem({Key? key, required this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      width: 500.0,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: const Color(0xff585D6A)),
          const SizedBox(width: 20.0),
          Text(title, style: const TextStyle(fontSize: 25.0, color: Color(0xff585D6A))),
        ],
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
                          children: const [
                            SizedBox(width: 30.0),
                            Icon(Icons.menu, color: Color(0xff585D6A), size: 35),
                            SizedBox(width: 20.0),
                            Text('Menu', style: TextStyle(fontSize: 35.0, color: Color(0xff585D6A))),
                          ],
                        ),
                      ),
                      DrawerItem(icon: Icons.help, title: 'F.A.Q.'),
                      DrawerItem(icon: Icons.privacy_tip_outlined, title: 'Privacy policy'),
                      DrawerItem(icon: Icons.feedback, title: 'Feedback'),
                      DrawerItem(icon: Icons.share, title: 'Share this app'),
                      DrawerItem(icon: Icons.info, title: 'About us'),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
