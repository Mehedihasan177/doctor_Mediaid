import 'package:care_plus_doctor/constents/constant.dart';
import 'package:http/http.dart' as http;
class EPrescriptionShowController{

  static Future<http.Response> requestThenResponsePrint(String token) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/doctor/e-prescription/2';

    var response = await http.get(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}