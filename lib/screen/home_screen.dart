import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class Home extends StatefulWidget {
  String imeiNo;
  dynamic location = '';
  dynamic Address = '';

   Home({Key? key, required this.imeiNo, required this.location,required this.Address}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Home"
          ),
        ),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                "IMEI: ${widget.imeiNo}"
            ),
            Text(
                "Location: ${widget.location}"
            ),
            Text(
                "Address: ${widget.Address}"
            ),
          ],
        ),
      ),
    );
  }
}
