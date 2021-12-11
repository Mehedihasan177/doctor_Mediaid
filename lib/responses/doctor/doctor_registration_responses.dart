// To parse this JSON data, do
//
//     final doctorRegistrationResponse = doctorRegistrationResponseFromJson(jsonString);

import 'dart:convert';

DoctorRegistrationResponse doctorRegistrationResponseFromJson(String str) => DoctorRegistrationResponse.fromJson(json.decode(str));

String doctorRegistrationResponseToJson(DoctorRegistrationResponse data) => json.encode(data.toJson());

class DoctorRegistrationResponse {
  DoctorRegistrationResponse({
    required this.data,
    required this.token,
  });

  Data data;
  String token;

  factory DoctorRegistrationResponse.fromJson(Map<String, dynamic> json) => DoctorRegistrationResponse(
    data: Data.fromJson(json["data"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "token": token,
  };
}

class Data {
  Data({
    required this.id,
    this.adminId,
    required this.name,
    required this.email,
    required this.hospitalName,
    required this.experience,
    required this.fee,
    required this.rating,
    required this.referralCode,
    required this.doctorid,
    required this.mobile,
    this.nid,
    this.bmdcReg,
    this.department,
    this.degree,
    this.designation,
    this.specialization,
    this.dob,
    this.address,
    this.district,
    this.policeStation,
    this.postOffice,
    required this.status,
    this.image,
    this.emailVerifiedAt,
    required this.featured,
    this.chambers,
    this.introduction,
    required this.createdAt,
    required this.updatedAt,
    this.gender,
    this.deletedAt,
    required this.doctorService,
  });

  int id;
  dynamic adminId;
  String name;
  String email;
  String hospitalName;
  String experience;
  String fee;
  String rating;
  String referralCode;
  String doctorid;
  String mobile;
  dynamic nid;
  dynamic bmdcReg;
  dynamic department;
  dynamic degree;
  dynamic designation;
  dynamic specialization;
  dynamic dob;
  dynamic address;
  dynamic district;
  dynamic policeStation;
  dynamic postOffice;
  String status;
  dynamic image;
  dynamic emailVerifiedAt;
  String featured;
  dynamic chambers;
  dynamic introduction;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic gender;
  dynamic deletedAt;
  List<dynamic> doctorService;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    adminId: json["admin_id"],
    name: json["name"],
    email: json["email"],
    hospitalName: json["hospital_name"],
    experience: json["experience"],
    fee: json["fee"],
    rating: json["rating"],
    referralCode: json["referral_code"],
    doctorid: json["doctorid"],
    mobile: json["mobile"],
    nid: json["nid"],
    bmdcReg: json["bmdc_reg"],
    department: json["department"],
    degree: json["degree"],
    designation: json["designation"],
    specialization: json["specialization"],
    dob: json["dob"],
    address: json["address"],
    district: json["district"],
    policeStation: json["police_station"],
    postOffice: json["post_office"],
    status: json["status"],
    image: json["image"],
    emailVerifiedAt: json["email_verified_at"],
    featured: json["featured"],
    chambers: json["chambers"],
    introduction: json["introduction"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    gender: json["gender"],
    deletedAt: json["deleted_at"],
    doctorService: List<dynamic>.from(json["doctor_service"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_id": adminId,
    "name": name,
    "email": email,
    "hospital_name": hospitalName,
    "experience": experience,
    "fee": fee,
    "rating": rating,
    "referral_code": referralCode,
    "doctorid": doctorid,
    "mobile": mobile,
    "nid": nid,
    "bmdc_reg": bmdcReg,
    "department": department,
    "degree": degree,
    "designation": designation,
    "specialization": specialization,
    "dob": dob,
    "address": address,
    "district": district,
    "police_station": policeStation,
    "post_office": postOffice,
    "status": status,
    "image": image,
    "email_verified_at": emailVerifiedAt,
    "featured": featured,
    "chambers": chambers,
    "introduction": introduction,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "gender": gender,
    "deleted_at": deletedAt,
    "doctor_service": List<dynamic>.from(doctorService.map((x) => x)),
  };
}
