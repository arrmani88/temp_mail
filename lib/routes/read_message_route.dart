import 'package:flutter/material.dart';
import 'package:mail/constants/constants.dart';
import 'package:mail/routes/widgets/common_widgets.dart';

class ReadMessageRoute extends StatelessWidget {
  const ReadMessageRoute({Key? key}) : super(key: key);

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
                    IconButton(onPressed: () {}, icon: Image.asset('assets/icons/usa_icon.png'), iconSize: 45.0, padding: EdgeInsets.all(0.0),),
                    SizedBox(height: 8.0),
                    SmallButton(onPressed: () {}, title: 'Back', icon: Icons.arrow_left_rounded),
                    SizedBox(height: 10.0),
                    Container(
                      padding: EdgeInsets.all(25.0),
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
                          Text('Verify your email for winning Article V2', style: TextStyle(fontWeight: FontWeight.w600)),
                          const Padding(child: Divider(color: Colors.grey), padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0)),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.asset('assets/images/blank_profile_picture.jpeg', height: 50.0, width: 50.0,),
                              ),
                              SizedBox(width: 15.0),
                              Expanded(flex: 1, child: Text('from: <noreply@winning-article-v2.firebaseapp.com>', style: TextStyle(fontWeight: FontWeight.w400),))
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

