import 'package:flutter/material.dart';
import 'routes/slash_page.dart';
import 'package:mail/constants/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    getScreenDimensions();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff50C2C9),
        canvasColor: Color(0xffE5E5E5),
        primarySwatch: Colors.blue,
        fontFamily: 'poppins',
      ),
      initialRoute: '/slash_page',
      routes: {
        '/slash_page': (context) => SlashPage(),
      },
    );
  }
}
