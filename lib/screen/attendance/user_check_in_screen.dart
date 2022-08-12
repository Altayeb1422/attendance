import 'dart:convert';
import 'dart:io';
import 'package:attendance/screen/user/user.dart';
import 'package:device_information/device_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../api/local_auth_api.dart';
import '../../network/attendance_status_http_request.dart';
import '../../widget/calendar widgets/date_widget.dart';
import '../../widget/calendar widgets/time_widget.dart';
import 'package:http/http.dart' as http;
import '../login/login_screen.dart';


DateTime now = DateTime.now();
String formattedTime = DateFormat.jm().format(now);
final DateFormat formatter = DateFormat('yyyy-MM-dd');
final String formatted = formatter.format(now);

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
  String _Address = '';
  @override
  void initState() {
    super.initState();
    askPermission();
    print("Employee ID: $empID");
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
        print(platformVersion);
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

  Future<void> GetAddressFromLatLong(Position position) async {
    inProgress = true;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    _Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country},${place.name},${place.hashCode}';
    setState(() {
      inProgress = false;
    });
  }

  Future CheckIN(date, formattedTime) async {
    try {
      inProgress = true;
      var res = await http
          .post(Uri.parse("http://192.168.1.36/hrm/atte_record_In.php"), body: {
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
        print(res.body);
        print("Clock In successful"); //print raw response on console
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
          Uri.parse("http://192.168.1.36/hrm/atte_record_OUT.php"),
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
        print(res.body);
        print("Clock Out successful"); //print raw response on console
        var data = json.decode(res.body);
        // carAdsId = data["AdsId"];
        print(data["Status"]); //decoding json to array
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

  var attenid;
  var inProgress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 40.0, left: 30),
                  child: Text(
                    "The Company",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, right: 30),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const User()));
                    },
                    child: Hero(
                      tag: 'user_image',
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 7.0, color: Color(0xffa7a9af))
                            ]),
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
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        DateTime now = DateTime.now();
                        String formattedTime = DateFormat.jm().format(now);
                        DateTime date = DateTime(now.year, now.month, now.day);
                        final isAuthenticated =
                            await LocalAuthApi.authentication();
                        if (checkStatus == 0 && isAuthenticated) {
                          Position position = await _determinePosition();
                          _location =
                              "Lat: ${position.latitude}, Lon: ${position.longitude}";
                          await GetAddressFromLatLong(position);
                          print(_location);
                          print("IMEI: ${_imeiNo}");
                          await CheckIN(date, formattedTime);
                          await AttendanceServices()
                              .getAttenRecStatus(empID, date);
                          print("I have passed");
                          // attenid =attendanceStatus!.id;
                          print("Atten Id:$attId");
                          print("checkStatus ${checkStatus}");
                          setState(() {
                            checkStatus;
                          });

                          print("checkStatus ${checkStatus}");
                        } else if (checkStatus == 1 && isAuthenticated) {
                          Position position = await _determinePosition();
                          _location =
                              "Lat: ${position.latitude}, Lon: ${position.longitude}";
                          await GetAddressFromLatLong(position);
                          print(_location);
                          print("IMEI: ${_imeiNo}");
                          await checkOut(date, formattedTime);
                          await AttendanceServices()
                              .getAttenRecStatus(empID, date);
                          print("Atten Id:$attId");
                          print(formattedTime);
                          setState(() {
                            checkStatus;
                          });
                          print("checkStatus ${checkStatus}");
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(120),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 7.0, color: Color(0xffa7a9af))
                            ]),
                        child: CircleAvatar(
                          minRadius: 120,
                          maxRadius: 120,
                          backgroundColor: checkStatus == 0
                              ? Colors.blueAccent
                              : Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              inProgress == true
                                  ? const SizedBox(height: 100,width: 100, child: CircularProgressIndicator(color: Colors.white,))
                                  : const Icon(
                                      Icons.fingerprint_rounded,
                                      size: 130,
                                      color: Colors.white,
                                    ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                checkStatus == 0 ? "Clock In" : "clock Out",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_on_rounded,
                              size: 25, color: Colors.red),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Location: ",
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 20),
                          ),
                          Text(
                            widget.location.toString(),
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 20),
                          )
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
                              const Icon(
                                Icons.timer_outlined,
                                color: Colors.blueAccent,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.clockIn.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Clock in",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(
                                Icons.timer_off_outlined,
                                color: Colors.redAccent,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.clockOut.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Clock Out",
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(
                                Icons.schedule,
                                color: Colors.green,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.totalHrs.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Working Hrs",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
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
