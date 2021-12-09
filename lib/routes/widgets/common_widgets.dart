import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  Function() onPressed;
  String title;

  RoundedButton({Key? key, required this.onPressed, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0),)),
        backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15.0, horizontal: 115.0)),
      ),
      onPressed: onPressed,
      child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w500),),
    );
  }
}
