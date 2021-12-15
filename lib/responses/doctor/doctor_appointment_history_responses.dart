// To parse this JSON data, do
//
//     final doctorAppointmentHistoryResponse = doctorAppointmentHistoryResponseFromJson(jsonString);

import 'dart:convert';

DoctorAppointmentHistoryResponse doctorAppointmentHistoryResponseFromJson(String str) => DoctorAppointmentHistoryResponse.fromJson(json.decode(str));

String doctorAppointmentHistoryResponseToJson(DoctorAppointmentHistoryResponse data) => json.encode(data.toJson());

class DoctorAppointmentHistoryResponse {
  DoctorAppointmentHistoryResponse({
    required this.message,
    required this.data,
  });

  String message;
  List<DoctorAppointmentHistoryResponseElement> data;

  factory DoctorAppointmentHistoryResponse.fromJson(Map<String, dynamic> json) => DoctorAppointmentHistoryResponse(
    message: json["message"],
    data: List<DoctorAppointmentHistoryResponseElement>.from(json["data"].map((x) => DoctorAppointmentHistoryResponseElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DoctorAppointmentHistoryResponseElement {
  DoctorAppointmentHistoryResponseElement({
    required this.id,
    required this.userId,
    required this.doctorId,
    required this.appointmentSlotId,
    required this.date,
    required this.rescheduleDate,
    this.rescheduleSlotId,
    required this.appointmentFor,
    required this.active,
    required this.consult,
    required this.reschedule,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.user,
  });
//district, dappointment_for, rescheduleDate
  int id;
  String userId;
  String doctorId;
  String appointmentSlotId;
  DateTime date;
  String rescheduleDate;
  dynamic rescheduleSlotId;
  String appointmentFor;
  String active;
  String consult;
  String reschedule;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  User user;

  factory DoctorAppointmentHistoryResponseElement.fromJson(Map<String, dynamic> json) => DoctorAppointmentHistoryResponseElement(
    id: json["id"],
    userId: json["user_id"].toString(),
    doctorId: json["doctor_id"].toString(),
    appointmentSlotId: json["appointment_slot_id"].toString(),
    date: DateTime.parse(json["date"]),
    rescheduleDate: json["reschedule_date"].toString(),
    rescheduleSlotId: json["reschedule_slot_id"],
    appointmentFor: json["appointment_for"].toString(),
    active: json["active"].toString(),
    consult: json["consult"].toString(),
    reschedule: json["reschedule"].toString(),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"].toString(),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "doctor_id": doctorId,
    "appointment_slot_id": appointmentSlotId,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "reschedule_date": rescheduleDate,
    "reschedule_slot_id": rescheduleSlotId,
    "appointment_for": appointmentFor,
    "active": active,
    "consult": consult,
    "reschedule": reschedule,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "user": user.toJson(),
  };
}

class User {
  User({
    required this.id,
    this.adminId,
    required this.name,
    required this.weight,
    required this.height,
    required this.medicareNo,
    required this.email,
    required this.userid,
    required this.mobile,
    this.dob,
    required this.address,
    required this.district,
    this.policeStation,
    this.postOffice,
    required this.status,
    required this.referralCode,
    required this.image,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.gender,
    required this.lat,
    required this.lng,
    required this.viewPassword,
    this.parentId,
    this.relationship,
    this.deletedAt,
    required this.labReports,
  });

  int id;
  dynamic adminId;
  String name;
  String weight;
  String height;
  String medicareNo;
  String email;
  String userid;
  String mobile;
  dynamic dob;
  String address;
  String district;
  dynamic policeStation;
  dynamic postOffice;
  String status;
  String referralCode;
  String image;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String gender;
  String lat;
  String lng;
  String viewPassword;
  dynamic parentId;
  dynamic relationship;
  dynamic deletedAt;
  List<dynamic> labReports;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    adminId: json["admin_id"],
    name: json["name"],
    weight: json["weight"].toString(),
    height: json["height"].toString(),
    medicareNo: json["medicare_no"].toString(),
    email: json["email"],
    userid: json["userid"],
    mobile: json["mobile"],
    dob: json["dob"],
    address: json["address"],
    district: json["district"].toString(),
    policeStation: json["police_station"],
    postOffice: json["post_office"],
    status: json["status"].toString(),
    referralCode: json["referral_code"],
    image: json["image"].toString(),
    emailVerifiedAt: json["email_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    gender: json["gender"].toString(),
    lat: json["lat"],
    lng: json["lng"],
    viewPassword: json["view_password"],
    parentId: json["parent_id"].toString(),
    relationship: json["relationship"].toString(),
    deletedAt: json["deleted_at"],
    labReports: List<dynamic>.from(json["lab_reports"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_id": adminId,
    "name": name,
    "weight": weight,
    "height": height,
    "medicare_no": medicareNo,
    "email": email,
    "userid": userid,
    "mobile": mobile,
    "dob": dob,
    "address": address,
    "district": district,
    "police_station": policeStation,
    "post_office": postOffice,
    "status": status,
    "referral_code": referralCode,
    "image": image,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "gender": gender,
    "lat": lat,
    "lng": lng,
    "view_password": viewPassword,
    "parent_id": parentId,
    "relationship": relationship,
    "deleted_at": deletedAt,
    "lab_reports": List<dynamic>.from(labReports.map((x) => x)),
  };
}
