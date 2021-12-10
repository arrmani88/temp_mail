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
          Image.asset('assets/images/min_corner_circles.png', width: kScreenWidth * 0.5, fit: BoxFit.fitWidth),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {}, icon: Image.asset('assets/images/usa_icon.png'), iconSize: 45.0, padding: EdgeInsets.all(0.0),),
                      Text('Mailbox', style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w700, height: 1.0)),
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
                  MailWidget()
                ],
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(23.0),
      height: 200.0,
      width: 400.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 20,
              offset: const Offset(0, 8),
            )
          ]
      ),

      child: Row(
        children: [
          // green point
          Column(
            children: [
              Container(
                height: 12.0,
                width: 12.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(50.0)
                ),
              )
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
                    Text('Google account verification', style: TextStyle(fontWeight: FontWeight.w700),),
                    Text('13:25')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
