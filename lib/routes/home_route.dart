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
          Image.asset('assets/icons/min_corner_circles.png', width: kScreenWidth * 0.5, fit: BoxFit.fitWidth),
          SafeArea(
            child: IconButton(onPressed: () {}, icon: Image.asset('assets/icons/usa_icon.png'), iconSize: 45.0, padding: const EdgeInsets.all(15.0),),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(child: Text('Your email address', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),)),
                  const SizedBox(height: 30.0,),
                  Container(
                    width: 400.0,
                    decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Container(width: 60.0, child: Image.asset('assets/icons/email.png')),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text('nkiaygaboyka@mail.com'),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Container(width: 400.0, child: RoundedButton(onPressed: () {}, title: 'Copy', icon: Icons.copy)),
                  const SizedBox(height: 30.0),
                  Container(width: 400.0, child: RoundedButton(onPressed: () {}, title: 'Change', icon: Icons.import_export_rounded,))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
