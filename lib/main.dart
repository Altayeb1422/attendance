import 'package:attendance/screen/bottom_navigation_screen.dart';
import 'package:attendance/screen/login/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/lang/', // <-- change the path of the translation files
      fallbackLocale: const Locale('en', 'US'),
      saveLocale: true,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Employee Attendance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "LoginScreen",
      home: const LoginScreen(),
      routes: {
        "BottomScreen": (context) => const BottomHomeScreen(),
        "LoginScreen": (context) => const LoginScreen(),
      },
    );
  }
}
