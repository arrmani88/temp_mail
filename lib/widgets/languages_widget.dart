import 'package:flutter/material.dart';
import 'package:mail/widgets/common_widgets.dart';
import 'package:mail/globals/variables.dart';
import 'package:mail/bloc/language_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LanguagesWidget extends StatefulWidget {
  const LanguagesWidget({Key? key}) : super(key: key);
  @override _LanguagesWidgetState createState() => _LanguagesWidgetState();
}
class _LanguagesWidgetState extends State<LanguagesWidget> with SingleTickerProviderStateMixin {
  late final Animation<double> animation;
  late final AnimationController animationController;
  late List<bool> languagesState = [];
  List<LanguagePressedEvent> eventsList = [EnglishPressed(), SpanishPressed(), FrenchPressed(), GermanPressed()];

  void knowLanguagesState () {
    languagesState.setAll(0, [false, false, false, false]);
    if (selectedLanguage == languages.EN) languagesState[0] = true;
    if (selectedLanguage == languages.ES) languagesState[1] = true;
    if (selectedLanguage == languages.FR) languagesState[2] = true;
    if (selectedLanguage == languages.DE) languagesState[3] = true;
  }

  @override
  void initState() {
    knowLanguagesState();
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    animation = CurvedAnimation(parent: animationController, curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    if (isLanguagesTabOpened == true) {
      animationController.forward();
      return Positioned.fill(
        child: Container(
        color: Colors.black.withOpacity(0.7),
          child: InkWell(
            onTap: () {
              isLanguagesTabOpened = false;
              animationController.reverse().then((value) => setState(() {}));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      width: 500.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: SizeTransition(
                        sizeFactor: animation,
                        axis: Axis.vertical,
                        axisAlignment: -1,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SmallButton(onPressed: () {
                                  isLanguagesTabOpened = false;
                                  animationController.reverse().then((value) => setState(() {}));
                                }, title: 'Confirm', icon: Icons.check),
                              ],
                            ),
                            LanguageChoice(index: 0, iconPath: 'assets/icons/usa_icon.png', title: 'English'),
                            LanguageChoice(index: 1, iconPath: 'assets/icons/spain_icon.png', title: 'Español'),
                            LanguageChoice(index: 2, iconPath: 'assets/icons/france_icon.png', title: 'Français'),
                            LanguageChoice(index: 3, iconPath: 'assets/icons/germany_icon.png', title: 'Deutsch'),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    return Container();
  }
}

class LanguageChoice extends StatefulWidget {
  final String iconPath;
  final String title;
  int index;

  LanguageChoice({Key? key, required this.iconPath, required this.title, required this.index}) : super(key: key);
  @override State<LanguageChoice> createState() => _LanguageChoiceState();
}
class _LanguageChoiceState extends State<LanguageChoice> {

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LanguageBloc, List<bool>>(
      builder: (context, state) {
        return InkWell(
          onTap: () {

          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: Image.asset(widget.iconPath), iconSize: 45.0, padding: const EdgeInsets.all(0.0)),
                Text(widget.title, style: const TextStyle(fontSize: 20.0)),
                Checkbox(
                  onChanged: (_) {},
                  value: state[widget.index],
                )
              ],
            ),
          ),
        );
      }
    );
  }
}

