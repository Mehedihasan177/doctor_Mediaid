
import 'dart:convert';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/model/doctor/doctor_sinIn_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_login_responses.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DoctorSigninController{

  static Future<http.Response> requestThenResponsePrint(DoctorSignInModel doctorSignInModel) async {

    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/doctor-login';

    Map login = {
      'mobile': "${doctorSignInModel.mobile}",
      'password': "${doctorSignInModel.password}",
    };

    // Here we are getting the response
    var response = await http.post(Uri.parse(url), body: login,
        headers: {
          "Accept": "application/json",
        }
    );

    if(response.statusCode==200) {
      final Map<String, dynamic> parsed = json.decode(response.body);
      final loginobject = DoctorLoginResponse.fromJson(parsed);
      print(loginobject.data.token);
      USERTOKEN = loginobject.data.token;
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      sharedPreferences.setString("token", loginobject.data.token);
      print(sharedPreferences.getString("token"));
      DOCTOR_INITIAL = loginobject.data.user;

      PHONE_NUMBER = doctorSignInModel.mobile;
      PASSWORD = doctorSignInModel.password;

    }
    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }

}
