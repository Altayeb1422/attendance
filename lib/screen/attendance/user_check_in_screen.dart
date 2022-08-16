import 'dart:convert';
import 'dart:io';
import 'package:attendance/models/clock_view.dart';
import 'package:attendance/screen/user/user.dart';
import 'package:device_information/device_information.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../api/local_auth_api.dart';
import '../../network/attendance_status_http_request.dart';
import '../../widget/calendar widgets/date_widget.dart';
import '../../widget/calendar widgets/time_widget.dart';
import 'package:http/http.dart' as http;
import '../login/login_screen.dart';
import 'package:lottie/lottie.dart';
import '../user/calendar/years_tabs.dart';


DateTime now = DateTime.now();
String formattedTime = DateFormat.jm().format(now);
final DateFormat formatter = DateFormat('yyyy-MM-dd');
final String formatted = formatter.format(now);
var inProgress = false;

class UserCheckIn extends StatefulWidget {
  UserCheckIn(
      {Key? key,
      this.imeiNo,
      this.empID,
      this.attendID,
      this.dateOn,
      this.attenID,
      this.attenIn,
      this.attenOut,
      this.status,
      this.location,
      this.clockIn,
      this.clockOut,
      this.totalHrs})
      : super(key: key);
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
  String? attendID;

  @override
  State<UserCheckIn> createState() => _UserCheckInState();
}

class _UserCheckInState extends State<UserCheckIn> {
  String _imeiNo = "";
  String _location = '';
  String _address = '';

  @override
  void initState() {
    super.initState();
    askPermission();
    if (kDebugMode) {
      print("Employee ID: $empID");
    }
  }

  Future<bool?> askPermission() async {
    PermissionStatus status = await Permission.phone.request();
    if (status.isDenied == true) {
      askPermission();
    } else {
      return true;
    }
  }

  Future<void> initPlatformState() async {
    late String platformVersion, imeiNo = '';
    // Platform messages may fail,
    // so we use a try/catch PlatformException.
    try {
      PermissionStatus status = await Permission.phone.request();
      if (status.isDenied == true) {
        askPermission();
      } else {
        platformVersion = await DeviceInformation.platformVersion;
        imeiNo = await DeviceInformation.deviceIMEINumber;
        if (kDebugMode) {
          print(platformVersion);
        }
      }
    } on PlatformException catch (e) {
      platformVersion = '${e.message}';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _imeiNo = imeiNo;
    });
  }

  Future<Position> _determinePosition() async {
    inProgress = true;
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }
    inProgress = true;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      inProgress = true;
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    inProgress = true;
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> getAddressFromLatLong(Position position) async {
    inProgress = true;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (kDebugMode) {
      print(placemarks);
    }
    Placemark place = placemarks[0];
    _address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country},${place.name},${place.hashCode}';
    setState(() {
      inProgress = false;
    });
  }

  Future checkIn(date, formattedTime) async {
    try {
      inProgress = true;
      var res = await http
          .post(Uri.parse("http://192.168.1.33/hrm/atte_record_In.php"), body: {
        "LocationName": "Khartoum-Tayif",
        "empID": widget.empID.toString(),
        "DateOn": date.toString(),
        "AttendCheckIn": formattedTime.toString(),
        "Status": checkStatus.toString(),
      }); //sending post request with header data

      if (res.statusCode == 200) {
        setState(() {
          inProgress = false;
        });
        if (kDebugMode) {
          print(res.body);
        }
        if (kDebugMode) {
          print("Clock In successful");
        } //print raw response on console
      } else {
        debugPrint("Something went wrong! Status Code is: ${res.statusCode}");
      }
    } on SocketException catch (_) {
      setState(() {
        inProgress = false;
      });
      Fluttertoast.showToast(
          msg: "Check your internet connection",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future checkOut(date, formattedTime) async {
    try {
      inProgress = true;
      var res = await http.post(
          Uri.parse("http://192.168.1.33/hrm/atte_record_OUT.php"),
          body: {
            "LocationName": "Khartoum-Tayif",
            "empID": widget.empID.toString(),
            "DateOn": date.toString(),
            "AttendCheckOut": formattedTime.toString(),
            "Status": checkStatus.toString(),
            "ID": attId.toString(),
          }); //sending post request with header data

      if (res.statusCode == 200) {
        setState(() {
          inProgress = false;
        });
        if (kDebugMode) {
          print(res.body);
        }
        if (kDebugMode) {
          print("Clock Out successful");
        } //print raw response on console
        var data = json.decode(res.body);
        // carAdsId = data["AdsId"];
        if (kDebugMode) {
          print(data["Status"]);
        } //decoding json to array
      } else {
        debugPrint("Something went wrong! Status Code is: ${res.statusCode}");
      }
    } on SocketException catch (_) {
      setState(() {
        inProgress = false;
      });
      Fluttertoast.showToast(
          msg: "Check your internet connection",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Flexible(
          //   flex: 1,
          //   fit:  FlexFit.tight,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "company".tr(),
          //         style: const TextStyle(
          //           color: Colors.black,
          //           fontWeight: FontWeight.bold,
          //           fontSize: 30,
          //           fontFamily: 'Tajawal',
          //         ),
          //       ),
          //       InkWell(
          //         onTap: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const User()));
          //         },
          //         child: Hero(
          //           tag: 'user_image',
          //           child: Container(
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(35),
          //                 boxShadow: const [
          //                   BoxShadow(
          //                       blurRadius: 7.0, color: Color(0xffa7a9af))
          //                 ]),
          //             child: const CircleAvatar(
          //               minRadius: 35,
          //               maxRadius: 35,
          //               backgroundColor: Colors.white10,
          //               foregroundImage: AssetImage(
          //                 'assets/user.jpg',
          //               ),
          //             ),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          SizedBox(height: 20,),
          Flexible(
            flex: 1,
            child: Column(
              children: const [
                Time(),
                Date()
              ],
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: InkWell(
              onTap: () async {
                DateTime now = DateTime.now();
                String formattedTime = DateFormat.jm().format(now);
                DateTime date =
                DateTime(now.year, now.month, now.day);
                final isAuthenticated =
                await LocalAuthApi.authentication();
                if (checkStatus == 0 && isAuthenticated) {
                  Position position = await _determinePosition();
                  _location =
                  "Lat: ${position.latitude}, Lon: ${position.longitude}";
                  await getAddressFromLatLong(position);
                  await checkIn(date, formattedTime);
                  await AttendanceServices()
                      .getAttenRecStatus(empID, date);
                  setState(() {
                    checkStatus;
                  });
                } else if (checkStatus == 1 && isAuthenticated) {
                  Position position = await _determinePosition();
                  _location =
                  "Lat: ${position.latitude}, Lon: ${position.longitude}";
                  print(_location);
                  await getAddressFromLatLong(position);
                  await checkOut(date, formattedTime);
                  await AttendanceServices()
                      .getAttenRecStatus(empID, date);
                  setState(() {
                    checkStatus;
                  });
                }
              },
              child: const ClockView(),
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on_rounded,
                        size: 25, color: Colors.red),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "location: ".tr(),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontFamily: 'Tajawal',
                      ),
                    ),
                    Text(
                      widget.location.toString(),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontFamily: 'Tajawal',
                      ),
                    )
                  ],
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/lottie/clock_in.json',
                            ),

                            Text(
                              widget.clockIn.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Tajawal',
                              ),
                            ),
                            Text(
                              "in".tr(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: 'Tajawal',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/lottie/clock_out.json',
                            ),

                            Text(
                              widget.clockOut.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Tajawal',
                              ),
                            ),

                            Text(
                              "out".tr(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: 'Tajawal',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/lottie/working_hrs.json',
                            ),
                            Text(
                              widget.totalHrs.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Tajawal',
                              ),
                            ),
                            Text(
                              "hrs".tr(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: 'Tajawal',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class MenuItems extends StatelessWidget {
  const MenuItems({
    Key? key,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);
  final dynamic icon;
  final Color color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              boxShadow: const [
                BoxShadow(blurRadius: 7.0, color: Color(0xffa7a9af))
              ]),
          child: CircleAvatar(
            maxRadius: 28,
            minRadius: 28,
            foregroundColor: Colors.green,
            backgroundColor: color,
            child: icon,
          ),
        ),
      ),
    );
  }
}
