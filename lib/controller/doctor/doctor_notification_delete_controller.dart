import 'package:care_plus_doctor/constents/constant.dart';
import 'package:http/http.dart' as http;
class DoctorNotificationDeleteController{

  static Future<http.Response> requestThenResponsePrint(String token, id) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/doctor/delete-notification/$id';

    var response = await http.get(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}