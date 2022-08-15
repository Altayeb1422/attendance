import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/attendance_status_model.dart';
import '../screen/attendance/user_check_in_screen.dart';
import '../screen/login/login_screen.dart';



var checkStatus = 0;
var attId;
class AttendanceServices {
  postAttenRecStatus() async {
    var res = await http.post(Uri.parse("http://192.168.1.43/hrm/fetch_atten_rec.php"),body: {
      "empID":empID,
      "RecDate": formatted.toString(),
    });
    if (res.statusCode == 200) {
      print(res.body);
      print("Post ATTENDANCE");
      //print raw response on console
      var data = json.decode(res.body);
      print(data);
      if(data == null){
        checkStatus = 0;
      }else{
        checkStatus= 1;
        print(data["ID"]);
        attId = data["ID"];
      }
      print(data); //decoding json to array
    } else {
      debugPrint("Something went wrong! Status Code is: ${res.statusCode}");
    }
  }

   getAttenRecStatus(id, day) async {
    var client = http.Client();
    var res = await client.get(
      Uri.parse("http://192.168.1.43/hrm/get_atten_rec.php?empID=${id}&RecDate="+day.toString()),);
    if (res.statusCode == 200) {
      print(res.body);
      print("Get ATTENDANCE");
      //print raw response on console
      var data = json.decode(res.body);

      if(data == null){
        checkStatus = 0;
      }else{
        checkStatus= 1;
        print(data["ID"]);
        attId = data["ID"];
      }
      print(data);
      // return AttendanceStatus.fromJson(data);//decoding json to array
    } else {
      print(res.body);
      json.decode(res.body).toString();
      var jason = res.body;
      print("hello");
      debugPrint("Something went wrong! Status Code is: ${res.statusCode}");
    }
  }

}

