import 'package:flutter/material.dart';
import 'package:mail/constants/constants.dart';

class SlashPage extends StatelessWidget {
  const SlashPage({Key? key}) : super(key: key);
  final String text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum dictum tempus, interdum at dignissim metus. Ultricies sed nunc.';

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50.0,),
                Center(child: Image.asset('assets/images/message_sent.png', height: kScreenHeight * 0.25,)),
                const SizedBox(height: 20.0,),
                const Center(child: Text('What is Lorem Ipsum ?', style: TextStyle(fontSize: 20.0))),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Center(
                    child: Container(
                      width: 400.0,
                      child: Text(text, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w200), textAlign: TextAlign.center,)
                    ),
                  ),
                ),
                const SizedBox(height: 30.0,),
                Center(
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      )),
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15.0, horizontal: 115.0)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/routes_holder');
                    },
                    child: const Text('Get Started', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w500),),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
