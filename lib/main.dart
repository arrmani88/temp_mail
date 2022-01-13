import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mail/constants/constants.dart';
import 'routes/get_started_route.dart';
import 'routes/routes_holder.dart';
import 'routes/read_message_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('fr'), Locale('es'), Locale('en'), Locale('de')],
    fallbackLocale: const Locale('de'),
    startLocale: const Locale('de'),
    path: 'assets/translations',
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff50C2C9),
        canvasColor: const Color(0xffE5E5E5),
        fontFamily: 'poppins',
      ),
      initialRoute: '/routes_holder',
      routes: {
        '/get_started_route': (context) => const GetStartedRoute(),
        '/routes_holder': (context) => RoutesHolder(),
        '/read_message_route': (context) => const ReadMessageRoute()
      },
    );
  }
}
