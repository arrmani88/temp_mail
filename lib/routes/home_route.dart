import 'package:flutter/material.dart';
import 'package:mail/constants/constants.dart';
import 'package:mail/widgets/common_widgets.dart';
import 'package:mail/widgets/languages_widget.dart';
import 'package:mail/globals/globals.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mail/bloc/languages_bloc.dart';
import 'package:mail/functions/functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mail/widgets/marquee.dart';

class HomeRoute extends StatefulWidget {
  HomeRoute({Key? key}) : super(key: key);
  @override State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/icons/min_corner_circles.png', width: kScreenWidth * 0.5, fit: BoxFit.fitWidth),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Center(
              child: SizedBox(
                height: kScreenHeight,
                width: 500.0,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 500.0, child: Align(alignment: Alignment.topLeft, child: IconButton(
                        onPressed: () {
                          isLanguagesTabOpened = true;
                          setState(() {});
                        },
                        icon: BlocBuilder<LanguagesBloc, languages?>(
                          builder: (context, state) {
                            return Image.asset(getFlagIconByState(confirmedLanguage));
                          },
                        ),
                        iconSize: 45.0,
                        padding: const EdgeInsets.all(0.0)
                    ))),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(child: Text(
                                'your_email_address'.tr(),
                                style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),)
                              ),
                              const SizedBox(height: 30.0,),
                              Container(
                                width: 500.0,
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
                              Container(width: 500.0, child: RoundedButton(onPressed: () {}, title: 'copy'.tr(), icon: Icons.copy)),
                              const SizedBox(height: 30.0),
                              Container(width: 500.0, child: RoundedButton(onPressed: () {}, title: 'change'.tr(), icon: Icons.import_export_rounded,))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
