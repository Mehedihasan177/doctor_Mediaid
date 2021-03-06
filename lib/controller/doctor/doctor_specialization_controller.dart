import 'package:care_plus_doctor/constents/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class DoctorSpecializationController{

  static Future<http.Response> requestThenResponsePrint() async {

    String domain = apiDomainRoot;

    var url = '$domain/api/specialization';

    var response = await http.get(Uri.parse(url),
        headers: {
          "Accept": "application/json",
         // 'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}