// To parse this JSON data, do
//
//     final attendanceStatus = attendanceStatusFromJson(jsonString);

import 'dart:convert';

AttendanceStatus attendanceStatusFromJson(String str) => AttendanceStatus.fromJson(json.decode(str));

String attendanceStatusToJson(AttendanceStatus data) => json.encode(data.toJson());

class AttendanceStatus {
  AttendanceStatus({
    this.id,
    this.empId,
    this.recDate,
    this.recName,
    this.time,
    this.locationName,
    this.status,
    this.attendCheckIn,
    this.attendCheckOut,
    this.attendanceId,
    this.deviceIn,
    this.deviceOut,
    this.dateOut,
    this.note,
  });

  String? id;
  String? empId;
  String? recDate;
  dynamic recName;
  dynamic time;
  String? locationName;
  String? status;
  String? attendCheckIn;
  dynamic attendCheckOut;
  String? attendanceId;
  String? deviceIn;
  dynamic deviceOut;
  dynamic dateOut;
  dynamic note;

  factory AttendanceStatus.fromJson(Map<String, dynamic> json) => AttendanceStatus(
    id: json["ID"],
    empId: json["empID"],
    recDate: json["RecDate"],
    recName: json["RecName"],
    time: json["Time"],
    locationName: json["LocationName"],
    status: json["Status"],
    attendCheckIn: json["AttendCheckIn"],
    attendCheckOut: json["AttendCheckOut"],
    attendanceId: json["AttendanceId"],
    deviceIn: json["DeviceIn"],
    deviceOut: json["DeviceOut"],
    dateOut: json["DateOut"],
    note: json[" \tNote"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "empID": empId,
    "RecDate": recDate,
    "RecName": recName,
    "Time": time,
    "LocationName": locationName,
    "Status": status,
    "AttendCheckIn": attendCheckIn,
    "AttendCheckOut": attendCheckOut,
    "AttendanceId": attendanceId,
    "DeviceIn": deviceIn,
    "DeviceOut": deviceOut,
    "DateOut": dateOut,
    " \tNote": note,
  };
}
