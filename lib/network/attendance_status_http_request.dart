import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/attendance_status_model.dart';
import '../screen/login/login_screen.dart';



class AttendanceServices {
  Future getAttenRecStatus(id, day) async {
    var client = http.Client();
    var res = await client.get(
      Uri.parse("http://192.168.15.124/hrm/fetch_atten_rec.php?empID=${employeeNumberController.text.toString()}&RecDate="+day.toString()),);
    if (res.statusCode == 200) {
      debugPrint("Data posted successfully");
      print(res.body);
      json.decode(res.body).toString();
      var jason = res.body;
      print("dsfghjfnjnv");
      return attendanceStatusFromJson(jason);
    } else {
      print(res.body);
      json.decode(res.body).toString();
      var jason = res.body;
      print("hello");
      debugPrint("Something went wrong! Status Code is: ${res.statusCode}");
    }
  }

}
