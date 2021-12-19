import 'package:flutter/material.dart';
import 'package:mail/widgets/common_widgets.dart';
import 'package:mail/globals/variables.dart';
import 'package:mail/widgets/drawer.dart';

class LanguagesWidget extends StatefulWidget {
  const LanguagesWidget({Key? key}) : super(key: key);
  @override _LanguagesWidgetState createState() => _LanguagesWidgetState();
}
class _LanguagesWidgetState extends State<LanguagesWidget> with SingleTickerProviderStateMixin {
  late final Animation<double> animation;
  late final AnimationController animationController;

  @override
  void initState() {
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
              // crossAxisAlignment: CrossAxisAlignment.center,
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
                            LanguageChoice(iconPath: 'assets/icons/usa_icon.png', title: 'English', id: languages.EN,),
                            LanguageChoice(iconPath: 'assets/icons/spain_icon.png', title: 'Español', id: languages.ES,),
                            LanguageChoice(iconPath: 'assets/icons/france_icon.png', title: 'Français', id: languages.FR,),
                            LanguageChoice(iconPath: 'assets/icons/germany_icon.png', title: 'Deutsch', id: languages.DE,),
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
  String iconPath;
  String title;
  var id;

  LanguageChoice({Key? key, required this.iconPath, required this.title, required this.id}) : super(key: key);
  @override State<LanguageChoice> createState() => _LanguageChoiceState();
}
class _LanguageChoiceState extends State<LanguageChoice> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectedLanguage = widget.id;
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Image.asset(widget.iconPath), iconSize: 45.0, padding: const EdgeInsets.all(0.0)),
            Text(widget.title, style: const TextStyle(fontSize: 20.0)),
            Checkbox(onChanged: (_) {}, value: (widget.id == selectedLanguage) ? true : false)
          ],
        ),
      ),
    );
  }
}

