import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  Function() onPressed;
  final String title;
  final IconData icon;

  RoundedButton({Key? key, required this.onPressed, required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(icon, color: Colors.white),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0),)),
        backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15.0)),
      ),
      onPressed: onPressed,
      label: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w500),),
    );
  }
}

class SmallButton extends StatelessWidget {
  Function() onPressed;
  final String title;
  final IconData icon;
  SmallButton({Key? key, required this.onPressed, required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(icon, color: Colors.white),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),)),
        backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0)),
      ),
      onPressed: onPressed,
      label: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w500),),
    );
  }
}
