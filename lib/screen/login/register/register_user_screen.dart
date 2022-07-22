import 'package:attendance/api/local_auth_api.dart';
import 'package:attendance/screen/home_screen.dart';
import 'package:device_information/device_information.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';


class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  TextEditingController employmentNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  String _imeiNo = "";
  String _location = '';
  String _Address = '';
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    late String imeiNo = '';
    try {
      imeiNo = await DeviceInformation.deviceIMEINumber;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    if (!mounted) return;

    setState(() {
      _imeiNo = imeiNo;
    });
  }
  Future<Position> _determinePosition() async {
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

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
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
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high, );
  }
  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    _Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   const Center(
          child: Text(
              "Register"
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
            child: TextFormField(
              controller: employmentNumberController ,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Employment Number",
                icon: Icon(Icons.numbers),
                label: Text("Employment Number"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
            child: TextFormField(
              controller: employmentNumberController ,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: "Employee Name",
                icon: Icon(Icons.person),
                label: Text("Employee name"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Center(
              child: InkWell(
                onTap: () async {
                  final isAuthenticated = await LocalAuthApi.authentication();
                  if (isAuthenticated) {
                    Position position = await _determinePosition();
                    _location= "Lat: ${position.latitude}, Lon: ${position.longitude}";
                    await GetAddressFromLatLong(position);
                    print(_location);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(imeiNo: _imeiNo, location: _location, Address: _Address,)));

                  }
                },
                child: Container(
                  height: MediaQuery.of(context).size.height*.25,
                  width: MediaQuery.of(context).size.height*.3,
                  decoration: DottedDecoration(
                      shape: Shape.box,
                      strokeWidth: 2,
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.fingerprint_rounded,
                        size: 50,
                        color: Colors.teal,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Register Finger Print',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


