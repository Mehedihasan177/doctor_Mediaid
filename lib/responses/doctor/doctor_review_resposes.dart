// To parse this JSON data, do
//
//     final doctorReviewResponses = doctorReviewResponsesFromJson(jsonString);

import 'dart:convert';

DoctorReviewResponses doctorReviewResponsesFromJson(String str) => DoctorReviewResponses.fromJson(json.decode(str));

String doctorReviewResponsesToJson(DoctorReviewResponses data) => json.encode(data.toJson());

class DoctorReviewResponses {
  DoctorReviewResponses({
    required this.message,
    required this.data,
  });

  String message;
  List<DoctorReview> data;

  factory DoctorReviewResponses.fromJson(Map<String, dynamic> json) => DoctorReviewResponses(
    message: json["message"],
    data: List<DoctorReview>.from(json["data"].map((x) => DoctorReview.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DoctorReview {
  DoctorReview({
    required this.id,
    required this.userId,
    required this.doctorId,
    required this.appointmentScheduleId,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  int id;
  String userId;
  String doctorId;
  String appointmentScheduleId;
  String rating;
  String comment;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  factory DoctorReview.fromJson(Map<String, dynamic> json) => DoctorReview(
    id: json["id"],
    userId: json["user_id"],
    doctorId: json["doctor_id"],
    appointmentScheduleId: json["appointment_schedule_id"],
    rating: json["rating"],
    comment: json["comment"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "doctor_id": doctorId,
    "appointment_schedule_id": appointmentScheduleId,
    "rating": rating,
    "comment": comment,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user": user.toJson(),
  };
}

class User {
  User({
    required this.id,
    this.adminId,
    required this.name,
    this.weight,
    this.height,
    required this.medicareNo,
    required this.email,
    required this.userid,
    required this.mobile,
    this.dob,
    required this.address,
    this.district,
    this.policeStation,
    this.postOffice,
    required this.status,
    required this.referralCode,
    required this.image,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    this.gender,
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
  dynamic weight;
  dynamic height;
  String medicareNo;
  String email;
  String userid;
  String mobile;
  dynamic dob;
  String address;
  dynamic district;
  dynamic policeStation;
  dynamic postOffice;
  String status;
  String referralCode;
  String image;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic gender;
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
    weight: json["weight"],
    height: json["height"],
    medicareNo: json["medicare_no"],
    email: json["email"],
    userid: json["userid"],
    mobile: json["mobile"],
    dob: json["dob"],
    address: json["address"],
    district: json["district"],
    policeStation: json["police_station"],
    postOffice: json["post_office"],
    status: json["status"],
    referralCode: json["referral_code"],
    image: json["image"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    gender: json["gender"],
    lat: json["lat"],
    lng: json["lng"],
    viewPassword: json["view_password"],
    parentId: json["parent_id"],
    relationship: json["relationship"],
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
