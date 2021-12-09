import 'package:flutter/material.dart';
import 'package:mail/constants/constants.dart';
import 'package:mail/routes/widgets/common_widgets.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/min_corner_circles.png', width: kScreenWidth * 0.5, fit: BoxFit.fitWidth),
          SafeArea(
            child: IconButton(onPressed: () {}, icon: Image.asset('assets/images/usa_icon.png'), iconSize: 45.0, padding: const EdgeInsets.all(15.0),),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: Text('Your email address', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
                          child: Image.asset('assets/images/email.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text('nkiaygaboyka@mail.com'),
                        )
                      ],
                    ),
                  ),
                ),
                RoundedButton(onPressed: () {}, title: 'Copy'),
                RoundedButton(onPressed: () {}, title: 'Change')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
