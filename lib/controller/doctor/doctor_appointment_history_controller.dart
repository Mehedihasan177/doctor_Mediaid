import 'package:care_plus_doctor/constents/constant.dart';
import 'package:http/http.dart' as http;
class DoctorAppointmentHistoryController{

static Future<http.Response> requestThenResponsePrint(String token) async {

String domain = apiDomainRoot;

var url = '$domain/api/doctor/appointment-schedule';
///'$domain/api/doctor/appointment-schedule'; test korle data ase. but what is difference between history and appointment schedule

var response = await http.get(Uri.parse(url),
headers: {
"Accept": "application/json",
'Authorization': 'Bearer $token',
}
);
return response;
}

}