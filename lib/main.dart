import 'package:flutter/material.dart';
import 'package:mail/constants/constants.dart';
import 'routes/slash_route.dart';
import 'routes/routes_holder.dart';
import 'routes/home_route.dart';
import 'routes/inbox_route.dart';
import 'routes/read_message_route.dart';

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
        primaryColor: const Color(0xff50C2C9),
        canvasColor: const Color(0xffE5E5E5),
        primarySwatch: Colors.blue,
        fontFamily: 'poppins',
      ),
      initialRoute: '/slash_route',
      routes: {
        '/slash_route': (context) => const SlashPage(),
        '/routes_holder': (context) => RoutesHolder(title: 'TITLE'),
        '/home_route': (context) => const HomeRoute(),
        '/inbox_route': (context) => InboxRoute(),
        '/read_message_route': (context) => const ReadMessageRoute()
      },
    );
  }
}

