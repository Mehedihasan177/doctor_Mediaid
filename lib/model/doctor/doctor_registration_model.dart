import 'dart:core';

class DoctorRegReqModel {
  String name;
  String email;
  String password;
  String mobile;
  String bmdc_reg;
  String password_confirmation;



  DoctorRegReqModel({
    required this.name,
    required this.email,
    required this.password,
    required this.mobile,
    required this.bmdc_reg,
    required this.password_confirmation,


  });
}
