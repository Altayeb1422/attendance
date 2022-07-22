import 'dart:convert';
import 'package:attendance/screen/user/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import '../../widget/calendar widgets/date_widget.dart';
import '../../widget/calendar widgets/time_widget.dart';
import 'package:http/http.dart' as http;
import '../login/login_screen.dart';


class UserCheckIn extends StatefulWidget {
   UserCheckIn({Key? key, this.imeiNo, this.empID, this.dateOn,this.attenID,this.attenIn,this.attenOut, this.status, this.location,  this.clockIn, this.clockOut,  this.totalHrs}) : super(key: key);
  String? imeiNo;
  String? empID;
  String? attenID;
  String? location;
  String? clockIn;
  String? clockOut;
  String? totalHrs;
  String? status;
  String? attenIn;
  String? attenOut;
  String? dateOn;

  @override
  State<UserCheckIn> createState() => _UserCheckInState();
}

class _UserCheckInState extends State<UserCheckIn> {
   // AttendanceStatus? attendanceStatus;

  @override
  void initState() {
    super.initState();
    print(widget.status);
    print(widget.empID);
    print(widget.location);
    print(widget.dateOn);
  }
  String getSystemTime()  {
    initializeDateFormatting("ar_EG", "en_US");
    var now = DateTime.now();
    var formatter = DateFormat.jm() ;
    // print(formatter.locale);
    String formatted = formatter.format(now).toString();
    // print(defaultLocale);
    return formatted;
  }
  Future updateIN() async {
    var res = await http.post(Uri.parse("http://192.168.15.124/hrm/atte_record_In.php"), body: {
      "LocationName": "Khartoum",
      "empID": widget.empID.toString(),
      "DateOn": date.toString(),
      "AttendCheckIn": getSystemTime.toString(),
      "Status": "0",
    }); //sending post request with header data

    if (res.statusCode == 200) {
      print(res.body);
      print("Post successful"); //print raw response on console
      var data = json.decode(res.body);
      // carAdsId = data["AdsId"];
      print(data["Status"]); //decoding json to array
    } else {
      debugPrint("Something went wrong! Status Code is: ${res.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    String? Astatus = widget.status;
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 40.0, left: 30),
                  child: Text("The Company", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, right: 30),
                  child: InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const User()));},
                    child: Hero(
                      tag: 'user_image',
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: const[
                              BoxShadow(
                                  blurRadius: 7.0,
                                  color: Color(0xffa7a9af)
                              )
                            ]
                        ),
                        child: const CircleAvatar(
                          minRadius: 35,
                          maxRadius: 35,
                          backgroundColor: Colors.white10,
                          foregroundImage: AssetImage(
                            'assets/user.jpg',
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 65.0),
              child: Center(child: Time()),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Center(child: Date()),
            ),
            Center(
              child:Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Column(
                  children:  [
                    InkWell(
                      onTap: ()async{
                        // setState(() {
                        //   Astatus = !Astatus!;
                        // });
                        await updateIN();
                         if(widget.status == "0"){

                         }else {

                         }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(120),
                            boxShadow: const[
                              BoxShadow(
                                  blurRadius: 7.0,
                                  color: Color(0xffa7a9af)
                              )
                            ]
                        ),
                        child: CircleAvatar(
                          minRadius: 120,
                          maxRadius: 120,
                          backgroundColor:widget.status == 1? Colors.green :Colors.blueAccent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.fingerprint_rounded, size: 100, color: Colors.white,),
                              SizedBox(height: 20,),
                              Text("Check In",style: TextStyle(color: Colors.white, fontSize: 18),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Icon(Icons.pin_drop, color: Colors.grey, size: 20,),
                          Text("Location: ",style: TextStyle(color: Colors.grey, fontSize: 20),),
                          Text(widget.location.toString(),style: TextStyle(color: Colors.grey, fontSize: 20),)
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.timer_outlined, color: Colors.blueAccent,),
                              SizedBox(height: 5,),
                              Text(widget.clockIn.toString(),style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                              Text("Clock in",style: TextStyle(color: Colors.grey, fontSize: 15),),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.timer_off_outlined, color: Colors.redAccent,),
                              SizedBox(height: 5,),
                              Text(widget.clockOut.toString(),style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                              Text("Clock Out",style: TextStyle(color: Colors.grey, fontSize: 15),),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.schedule, color: Colors.green,),
                              SizedBox(height: 5,),
                              Text(widget.totalHrs.toString(),style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                              Text("Working Hrs",style: TextStyle(color: Colors.grey, fontSize: 15),),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
