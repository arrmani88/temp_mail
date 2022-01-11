import 'package:flutter/material.dart';
import 'package:mail/constants/constants.dart';
import 'package:mail/widgets/common_widgets.dart';
import 'package:mail/widgets/languages_widget.dart';
import 'package:mail/globals/variables.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mail/bloc/languages_bloc.dart';

class InboxRoute extends StatefulWidget {
  InboxRoute({Key? key}) : super(key: key);
  @override State<InboxRoute> createState() => _InboxRouteState();
}
class _InboxRouteState extends State<InboxRoute> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/icons/min_corner_circles.png', width: kScreenWidth * 0.5, fit: BoxFit.fitWidth),
        SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Center(
                child: SizedBox(
                  width: 530.0,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: IconButton(
                              onPressed: () {setState(() {
                                isLanguagesTabOpened = true;
                                setState(() {});
                                });}, 
                              icon: Image.asset('assets/icons/usa_icon.png'),
                              iconSize: 45.0,
                              padding: EdgeInsets.all(0.0),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SmallButton(onPressed: () {}, title: 'Refresh', icon: Icons.refresh),
                          ],
                        ),
                      ),
                      // SizedBox(height: 5.0),
                      const MailWidget(),
                      const MailWidget(),
                      const MailWidget(),
                      const MailWidget(),
                      const MailWidget(),
                      const MailWidget(),
                      const SizedBox(height: 5.0)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        LanguagesWidget()
      ],
    );
  }
}

class MailWidget extends StatelessWidget {
  const MailWidget({Key? key}) : super(key: key);
  final String longText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/read_message_route');
        },
        child: Container(
          padding: const EdgeInsets.all(20.0),
          // height: 200.0,
          width: 500.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 0.8, blurRadius: 5, offset: const Offset(8, 8),)]
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    );
  }
}

String getFlagIconByState(var state) {
  switch (state) {
    case languages.en:
      return 'assets/icons/usa_icon.png';
    case languages.es:
      return 'assets/icons/spain_icon.png';
    case languages.fr:
      return 'assets/icons/france_icon.png';
    case languages.de:
      return 'assets/icons/germany_icon.png';
  }
  return'';
}