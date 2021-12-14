// To parse this JSON data, do
//
//     final doctorAppointmentSlotResponse = doctorAppointmentSlotResponseFromJson(jsonString);

import 'dart:convert';

DoctorAppointmentSlotResponse doctorAppointmentSlotResponseFromJson(String str) => DoctorAppointmentSlotResponse.fromJson(json.decode(str));

String doctorAppointmentSlotResponseToJson(DoctorAppointmentSlotResponse data) => json.encode(data.toJson());

class DoctorAppointmentSlotResponse {
  DoctorAppointmentSlotResponse({
    required this.message,
    required this.data,
  });

  String message;
  List<Datum> data;

  factory DoctorAppointmentSlotResponse.fromJson(Map<String, dynamic> json) => DoctorAppointmentSlotResponse(
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.doctorId,
    required this.startTime,
    required this.endTime,
    required this.day,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  int id;
  String doctorId;
  String startTime;
  String endTime;
  String day;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    doctorId: json["doctor_id"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    day: json["day"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "start_time": startTime,
    "end_time": endTime,
    "day": day,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
