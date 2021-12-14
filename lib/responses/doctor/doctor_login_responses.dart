// To parse this JSON data, do
//
//     final doctorLoginResponse = doctorLoginResponseFromJson(jsonString);

import 'dart:convert';

DoctorLoginResponse doctorLoginResponseFromJson(String str) => DoctorLoginResponse.fromJson(json.decode(str));

String doctorLoginResponseToJson(DoctorLoginResponse data) => json.encode(data.toJson());

class DoctorLoginResponse {
  DoctorLoginResponse({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory DoctorLoginResponse.fromJson(Map<String, dynamic> json) => DoctorLoginResponse(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.user,
    required this.token,
  });

  User user;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  User({
    required this.id,
    required this.token,
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
    required this.department,
    required this.degree,
    required this.designation,
    required this.specialization,
    this.dob,
    required this.address,
    this.district,
    this.policeStation,
    this.postOffice,
    required this.status,
    required this.image,
    this.emailVerifiedAt,
    required this.featured,
    required this.chambers,
    required this.introduction,
    required this.createdAt,
    required this.updatedAt,
    required this.gender,
    this.deletedAt,
    required this.doctorService,
  });

  String id;
  String token;
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
  String department;
  String degree;
  String designation;
  String specialization;
  dynamic dob;
  String address;
  dynamic district;
  dynamic policeStation;
  dynamic postOffice;
  String status;
  String image;
  dynamic emailVerifiedAt;
  String featured;
  String chambers;
  String introduction;
  String createdAt;
  String updatedAt;
  String gender;
  dynamic deletedAt;
   String doctorService; //List<dynamic>

  factory User.fromJson(Map<dynamic, dynamic> json) => User(
    id: json["id"].toString(),
    token: json["token"].toString(),
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
    gender: json["gender"].toString(),
    deletedAt: json["deleted_at"].toString(),
    doctorService: json["doctor_service"].toString(),//List<dynamic>.from(json["doctor_service"].map((x) => x).),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
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
