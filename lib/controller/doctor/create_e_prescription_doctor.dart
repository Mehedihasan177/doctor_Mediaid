import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/responses/doctor/create_E_prescription_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class CreateEPrescriptionController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint( token, CreateEPrescriptionModel ePrescription ) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/doctor/e-prescription';

    Map data1 = {
      'appointment_schedule_id': '${ePrescription.appointment_schedule_id}',
      'advice': '${ePrescription.advice}',
      'cc': '${ePrescription.cc}',
      'oe': '${ePrescription.oe}',
      'rx': '${ePrescription.rx}'
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