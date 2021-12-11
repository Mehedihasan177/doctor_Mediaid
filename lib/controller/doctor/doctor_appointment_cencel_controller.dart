import 'package:care_plus_doctor/constents/constant.dart';
import 'package:http/http.dart' as http;
class AppointmentCencelController{

  static Future<http.Response> requestThenResponsePrint(String token) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/doctor/appointment-schedule-cancel/1';

    var response = await http.get(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}