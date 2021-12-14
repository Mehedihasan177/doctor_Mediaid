import 'package:care_plus_doctor/constents/constant.dart';
import 'package:http/http.dart' as http;
class DoctorAppointmentSlotDeleteController{

  static Future<http.Response> requestThenResponsePrint(String token,id) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/doctor/appointment-slot/$id';
    print(url);

    var response = await http.delete(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}