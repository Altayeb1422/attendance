import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../models/the_day_shift_info_model.dart';
import '../screen/login/login_screen.dart';

var error;

class Services {
  Future getDayShiftInfo(id, day) async {
    var client = http.Client();
    var res = await client.get(
      Uri.parse("http://192.168.15.124/hrm/fetch_today_shift_info.php?empID=${employeeNumberController.text.toString()}&DateOn="+day.toString()),);
    if (res.statusCode == 200) {
      debugPrint("Data posted successfully");
      print(res.body);
      json.decode(res.body).toString();
      var jason = res.body;
      print("dsfghjfnjnv");
      return theDayShiftFromJson(jason);
    } else {
      print(res.body);
      json.decode(res.body).toString();
      var jason = res.body;
      print("hello");
      debugPrint("Something went wrong! Status Code is: ${res.statusCode}");
    }
  }

}
