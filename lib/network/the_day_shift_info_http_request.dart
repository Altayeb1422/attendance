import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../models/the_day_shift_info_model.dart';
import '../screen/login/login_screen.dart';


class Services {
  Future getDayShiftInfo(id, day) async {
    var client = http.Client();
    var res = await client.get(
      Uri.parse("http://192.168.1.36/hrm/fetch_today_shift_info.php?empID=${employeeNumberController.text.toString()}&DateOn="+day.toString()),);
    if (res.statusCode == 200) {
      debugPrint("Data posted successfully");
      print(res.body);
      var data = json.decode(res.body);
      data["Result"];
      var jason = res.body;
      return theDayShiftFromJson(jason);
    } else {
      print(res.body);
      var data = json.decode(res.body);
      // attendanceStatus = data["Result"];
      print("hello");
      debugPrint("Something went wrong! Status Code is: ${res.statusCode}");
    }
  }

}
