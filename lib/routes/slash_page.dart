import 'package:flutter/material.dart';
import 'package:mail/constants/constants.dart';
import 'widgets/common_widgets.dart';

class SlashPage extends StatelessWidget {
  const SlashPage({Key? key}) : super(key: key);
  final String text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum dictum tempus, interdum at dignissim metus. Ultricies sed nunc.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/icons/min_corner_circles.png', width: kScreenWidth * 0.5, fit: BoxFit.fitWidth),
          // SafeArea(
          //     child: IconButton(onPressed: () {}, icon: Image.asset('assets/icons/usa_icon.png'), iconSize: 45.0, padding: const EdgeInsets.all(15.0),),
          // ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(onPressed: () {}, icon: Image.asset('assets/icons/usa_icon.png'), iconSize: 45.0, padding: const EdgeInsets.all(15.0),),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, contraints) {
                        return SingleChildScrollView(
                          child: SizedBox(
                            height: contraints.maxHeight,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 50.0,),
                                Center(child: Image.asset('assets/icons/message_sent.png', height: kScreenHeight * 0.25,)),
                                const SizedBox(height: 20.0,),
                                const Center(child: Text('What is Lorem Ipsum ?', style: TextStyle(fontSize: 20.0))),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                                  child: Center(
                                    child: Container(
                                      width: 400.0,
                                      height: 110.0,
                                      child: Text(text, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w200), textAlign: TextAlign.center,)
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 400.0,
                                  child: RoundedButton(
                                    icon: Icons.play_arrow_outlined,
                                    title: 'Get started',
                                    onPressed: () {
                                      // Navigator.pop(context);
                                      Navigator.pushNamed(context, '/read_message_route');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

