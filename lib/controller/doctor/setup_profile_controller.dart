
import 'dart:convert';

import 'package:care_plus_doctor/responses/doctor/doctor_update_profile_responses.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/model/doctor/doctor_registration_model.dart';
import 'package:care_plus_doctor/model/setup_profile_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_registration_responses.dart';
import 'package:http/http.dart' as http;
class DoctorSetupProfileController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(String token,Map dataMap) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/doctor-profile-update';

    // var body = json.encode(dataMap);
   // DOCTORUPDATEPROFILERESPONSES = body as DoctorUpdateProfile;
    // Here we are getting the response
    var response = await http.post(Uri.parse(url), body: dataMap,
        headers: {
          //"Content-Type": "application/json",
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );

    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }

}