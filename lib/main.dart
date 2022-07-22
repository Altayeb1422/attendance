import 'package:attendance/screen/bottom_navigation_screen.dart';
import 'package:attendance/screen/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee Attendance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       initialRoute: "LoginScreen",
      home: const LoginScreen(),
      routes: {
        "LoginScreen": (context) =>  const LoginScreen(),
      },
    );
  }
}
