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
    this.hospitalName,
    this.experience,
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
    required this.gender,
    this.deletedAt,
    required this.doctorService,
  });

  String id;
  dynamic adminId;
  String name;
  String email;
  dynamic hospitalName;
  dynamic experience;
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
  String createdAt;
  String updatedAt;
  dynamic gender;
  dynamic deletedAt;
  String doctorService;

  factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
    id: json["id"].toString(),
    adminId: json["admin_id"].toString(),
    name: json["name"].toString(),
    email: json["email"].toString(),
    hospitalName: json["hospital_name"].toString(),
    experience: json["experience"].toString(),
    fee: json["fee"].toString(),
    rating: json["rating"].toString(),
    referralCode: json["referral_code"].toString(),
    doctorid: json["doctorid"].toString(),
    mobile: json["mobile"].toString(),
    nid: json["nid"].toString(),
    bmdcReg: json["bmdc_reg"].toString(),
    department: json["department"].toString(),
    degree: json["degree"].toString(),
    designation: json["designation"].toString(),
    specialization: json["specialization"].toString(),
    dob: json["dob"].toString(),
    address: json["address"].toString(),
    district: json["district"].toString(),
    policeStation: json["police_station"].toString(),
    postOffice: json["post_office"].toString(),
    status: json["status"].toString(),
    image: json["image"].toString(),
    emailVerifiedAt: json["email_verified_at"].toString(),
    featured: json["featured"].toString(),
    chambers: json["chambers"].toString(),
    introduction: json["introduction"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
    gender: json["gender"],
    deletedAt: json["deleted_at"],
    doctorService: json["doctor_service"].toString(),
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
    "created_at": createdAt,
    "updated_at": updatedAt,
    "gender": gender,
    "deleted_at": deletedAt,
    "doctor_service": doctorService,
  };
}
