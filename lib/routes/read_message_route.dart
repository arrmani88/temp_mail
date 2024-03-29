import 'package:flutter/material.dart';
import 'package:mail/constants/constants.dart';
import 'package:mail/widgets/common_widgets.dart';
import 'package:easy_localization/easy_localization.dart';

class ReadMessageRoute extends StatelessWidget {
  const ReadMessageRoute({Key? key}) : super(key: key);
  final String _txt = 'Hello nkiaygaboyka@mail.com,\n\nFollow this link to verify your email address.\n\nhttps://winning-article-v2.firebaseapp.com/__/auth/action?mode=verifyEmail&oobCode=FpVDozhnYNobeV1U7l7LRGOVpCHhNR5sFRLQ1 ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/icons/min_corner_circles.png', width: kScreenWidth * 0.5, fit: BoxFit.fitWidth),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // IconButton(onPressed: () {}, icon: Image.asset('assets/icons/usa_icon.png'), iconSize: 45.0, padding: const EdgeInsets.all(0.0),),
                    // const SizedBox(height: 8.0),
                    SmallButton(onPressed: () {
                      Navigator.pop(context);
                    }, title: 'back'.tr(), icon: Icons.arrow_left_rounded),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.all(25.0),
                      height: 500.0,
                      width: 500.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 0.8, blurRadius: 5, offset: const Offset(8, 8),)]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Verify your email for winning Article V2', style: TextStyle(fontWeight: FontWeight.w600)),
                          const Padding(child: Divider(color: Colors.grey), padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0)),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: Image.asset('assets/images/blank_profile_picture.jpeg', height: 50.0, width: 50.0,),
                                  ),
                                  const SizedBox(width: 15.0),
                                  Expanded(child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('from'.tr() + '<noreply@winning-article-v2.firebaseapp.com>', style: TextStyle(fontWeight: FontWeight.w400)),
                                      Text('date'.tr() + '22-11-2021 23:59:22', style: TextStyle(fontWeight: FontWeight.w400)),
                                    ],
                                  )),
                                ],
                              ),
                              const Padding(child: Divider(color: Colors.grey), padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0)),
                              Text(_txt ,style: const TextStyle(color: Color(0xff585D6A))),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

