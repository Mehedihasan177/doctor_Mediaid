
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/model/doctor/doctor_registration_model.dart';
import 'package:care_plus_doctor/model/setup_profile_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_registration_responses.dart';
import 'package:http/http.dart' as http;
class DoctorSetupProfileController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(SetUpProfile data, String token) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/doctor-register';

    Map data1 = {
      'name': "${data.name}",
      'specialization': "${data.specialization}",
      'bmdcReg': "${data.bmdcReg}",
      'designation': "${data.designation}",
      'fee': "${data.fee}",
      'chambers': "${data.chambers}",
      'introduction': "${data.introduction}",
      // 'image': "${doctorRegReqModel.image}",

    };

    // Here we are getting the response
    var response = await http.post(Uri.parse(url), body: data1,
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );

    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }

}