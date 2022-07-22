import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import 'package:timer_builder/timer_builder.dart';

// final String currentTime = getSystemTime();


class Time extends StatefulWidget {
  const Time({Key? key}) : super(key: key);

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  final String defaultLocale = Platform.localeName;

  String getSystemTime()  {
    initializeDateFormatting("ar_EG", "en_US");
    var now = DateTime.now();
    var formatter = defaultLocale == "ar_EG"? DateFormat.jm('ar_EG'):DateFormat.jm('en_US') ;
    // print(formatter.locale);
    String formatted = formatter.format(now).toString();
    // print(defaultLocale);
    return formatted;
  }
  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(const Duration(seconds: 60), builder: (context) {
      return Text(
          getSystemTime(),
          style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 60)
      );
    });
  }
}

