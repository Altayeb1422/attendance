import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'dart:io';



class Date extends StatefulWidget {
  const Date({Key? key}) : super(key: key);

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  final String defaultLocale = Platform.localeName;

   String getSystemDate()  {
      initializeDateFormatting('ar_EG', "en_US");
     var now = DateTime.now();
     var formatter = defaultLocale == 'ar_EG'? DateFormat.MMMEd('ar_EG'):DateFormat.MMMEd('en_US') ;
     // print(formatter.locale);
     String formatted = formatter.format(now).toString();
     // print(formatted);
     //  print(defaultLocale);
     return formatted;
  }
  @override
  Widget build(BuildContext context) {
    return  Text(
      getSystemDate(),
      style: const TextStyle(color: Colors.grey, fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}