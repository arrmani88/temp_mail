import 'package:flutter/material.dart';
import 'package:mail/constants/constants.dart';
import 'package:mail/routes/widgets/common_widgets.dart';

class InboxRoute extends StatelessWidget {
  InboxRoute({Key? key}) : super(key: key);
  // final List<Widget> _content = ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/icons/min_corner_circles.png', width: kScreenWidth * 0.5, fit: BoxFit.fitWidth),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,    vertical: 15.0),
              child: Center(
                child: Container(
                  width: 400.0,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: () {}, icon: Image.asset('assets/icons/usa_icon.png'), iconSize: 45.0, padding: EdgeInsets.all(0.0),),
                          Text('Mailbox', style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w600, height: 1.0)),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SmallButton(onPressed: () {}, title: 'Refresh', icon: Icons.refresh),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      MailWidget(),
                      MailWidget(),
                      MailWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MailWidget extends StatelessWidget {
  const MailWidget({Key? key}) : super(key: key);
  final String longText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        // height: 200.0,
        width: 400.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 0.8, blurRadius: 5, offset: const Offset(8, 8),)]
        ),

        child: Row(
          children: [
            // green point
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 12.0,
                  width: 12.0,
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(50.0)),
                ),
              ],
            ),
            SizedBox(width: 20.0),
            // content
            Expanded(
              child: Column(
                children: [
                  // title + time
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Google account verification', style: TextStyle(fontWeight: FontWeight.w600, height: 1),),
                      Text('13:37', style: TextStyle(color: Colors.grey.withOpacity(0.7), fontWeight: FontWeight.w600, height: 1),)
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    longText,
                    maxLines: 5,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

