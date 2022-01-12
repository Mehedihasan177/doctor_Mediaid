import 'package:care_plus_doctor/responses/doctor/doctor_login_responses.dart' as login;
import 'package:care_plus_doctor/responses/doctor/doctor_login_responses.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_registration_responses.dart' as registration;
import 'package:care_plus_doctor/responses/doctor/doctor_update_profile_responses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String apiDomainRoot = "http://mediaidpro.skoder.co";
String avatarLink = '$apiDomainRoot/asset_p/img/logo.jpeg';

String USERTOKEN = '';
double LAT = 0.0, LNG = 0.0;
int USERID = 0;
String PHONE_NUMBER= '';
String PASSWORD= '';
late SignInResponse DOCTOR_INITIAL;
String bmdc = 'AHPRA';


String PHONEONLY = '';
String COUNTRYCODE = '';
String APPNAME = 'Doctor Mediaid';


