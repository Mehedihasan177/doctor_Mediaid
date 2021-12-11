import 'package:care_plus_doctor/constents/constant.dart';
import 'package:http/http.dart' as http;
class DoctorAppointmentHistoryController{

static Future<http.Response> requestThenResponsePrint(String token) async {

String domain = apiDomainRoot;

var url = '$domain/api/doctor/appointment/history';

var response = await http.get(Uri.parse(url),
headers: {
"Accept": "application/json",
'Authorization': 'Bearer $token',
}
);
return response;
}

}