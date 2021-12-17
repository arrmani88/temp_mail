import 'package:flutter/material.dart';
import 'package:mail/widgets/common_widgets.dart';

class LanguagesWidget extends StatefulWidget {
  const LanguagesWidget({Key? key}) : super(key: key);
  @override _LanguagesWidgetState createState() => _LanguagesWidgetState();
}
class _LanguagesWidgetState extends State<LanguagesWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
      color: Colors.black.withOpacity(0.7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                width: 500.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SmallButton(onPressed: () {}, title: 'Confirm', icon: Icons.check),
                      ],
                    ),
                    LanguageChoice(iconPath: 'assets/icons/usa_icon.png', title: 'English'),
                    LanguageChoice(iconPath: 'assets/icons/france_icon.png', title: 'Français'),
                    LanguageChoice(iconPath: 'assets/icons/daad_icon.png', title: 'العربية'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LanguageChoice extends StatelessWidget {
  String iconPath;
  String title;
  LanguageChoice({Key? key, required this.iconPath, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: Image.asset(iconPath), iconSize: 45.0, padding: const EdgeInsets.all(0.0)),
          Text(title, style: const TextStyle(fontSize: 20.0)),
          Checkbox(onChanged: (_) {}, value: false)
        ],
      ),
    );
  }
}

