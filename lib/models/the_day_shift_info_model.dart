// To parse this JSON data, do
//
//     final theDayShift = theDayShiftFromJson(jsonString);

import 'dart:convert';

TheDayShift theDayShiftFromJson(String str) => TheDayShift.fromJson(json.decode(str));

String theDayShiftToJson(TheDayShift data) => json.encode(data.toJson());

class TheDayShift {
  TheDayShift({
    this.id,
    this.empId,
    this.totalHoures,
    this.totalDays,
    this.locationName,
    this.dateOn,
    this.day,
    this.checkIn,
    this.checkOut,
    this.status,
    this.latetime,
    this.absettime,
    this.supervisorId,
    this.note,
  });

  String? id;
  String? empId;
  String? totalHoures;
  String? totalDays;
  String? locationName;
  String? dateOn;
  String? day;
  String? checkIn;
  String? checkOut;
  String? status;
  String? latetime;
  String? absettime;
  String? supervisorId;
  String? note;

  factory TheDayShift.fromJson(Map<String, dynamic> json) => TheDayShift(
    id: json["ID"],
    empId: json["empID"],
    totalHoures: json["TotalHoures"],
    totalDays: json["TotalDays"],
    locationName: json["LocationName"],
    dateOn: json["DateOn"],
    day: json["Day"],
    checkIn: json["CheckIn"],
    checkOut: json["CheckOut"],
    status: json["Status"],
    latetime: json["latetime"],
    absettime: json["absettime"],
    supervisorId: json["SupervisorID"],
    note: json["Note"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "empID": empId,
    "TotalHoures": totalHoures,
    "TotalDays": totalDays,
    "LocationName": locationName,
    "DateOn": dateOn,
    "Day": day,
    "CheckIn": checkIn,
    "CheckOut": checkOut,
    "Status": status,
    "latetime": latetime,
    "absettime": absettime,
    "SupervisorID": supervisorId,
    "Note": note,
  };
}
