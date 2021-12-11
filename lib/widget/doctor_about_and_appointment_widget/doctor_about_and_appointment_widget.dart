// import 'package:care_plus_doctor/model/ui_model/doctor_appointment_model/doctor_about_and_appointment_model.dart';
// import 'package:care_plus_doctor/view/screen/appointmnet_list/appointment_list_ui.dart';
// import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/rendering.dart';
//
// Widget DoctorAboutAppointmentWidget(DoctorAppointmentModel doctorAppointment, context) =>
//     Column(
//                 children: [
//
//                   Padding(
//                     padding: EdgeInsets.only(top: 10, left: 30),
//                     child: Column(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.only(left: 8),
//                             alignment: Alignment.centerLeft,
//                             child: Text("Select day and time")),
//                         Container(
//                           margin: EdgeInsets.symmetric(vertical: 5.0),
//                           height: 80.0,
//                           child: ListView(
//                             scrollDirection: Axis.horizontal,
//                             children: [
//                               Container(
//                                 width: 60,
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                   color: Colors.white,
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 10),
//                                         child: Text(doctorAppointment.card_day,
//                                           style: TextStyle(
//                                             // fontSize: 17,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 17),
//                                         child: Text(doctorAppointment.card_date,
//                                           style: TextStyle(
//                                             // fontSize: 20,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 60,
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                   color: Colors.white,
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 10),
//                                         child: Text(doctorAppointment.card_day,
//                                           style: TextStyle(
//                                             // fontSize: 17,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 17),
//                                         child: Text(doctorAppointment.card_date,
//                                           style: TextStyle(
//                                             // fontSize: 20,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 60,
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                   color: Colors.white,
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 10),
//                                         child: Text(doctorAppointment.card_day,
//                                           style: TextStyle(
//                                             // fontSize: 17,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 17),
//                                         child: Text(doctorAppointment.card_date,
//                                           style: TextStyle(
//                                             // fontSize: 20,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 60,
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                   color: Colors.white,
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 10),
//                                         child: Text(doctorAppointment.card_day,
//                                           style: TextStyle(
//                                             // fontSize: 17,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 17),
//                                         child: Text(doctorAppointment.card_date,
//                                           style: TextStyle(
//                                             // fontSize: 20,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 60,
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                   color: Colors.white,
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 10),
//                                         child: Text(doctorAppointment.card_day,
//                                           style: TextStyle(
//                                             // fontSize: 17,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 17),
//                                         child: Text(doctorAppointment.card_date,
//                                           style: TextStyle(
//                                             // fontSize: 20,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 60,
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                   color: Colors.white,
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 10),
//                                         child: Text(doctorAppointment.card_day,
//                                           style: TextStyle(
//                                             // fontSize: 17,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 17),
//                                         child: Text(doctorAppointment.card_date,
//                                           style: TextStyle(
//                                             // fontSize: 20,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 60,
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                   color: Colors.white,
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 10),
//                                         child: Text(doctorAppointment.card_day,
//                                           style: TextStyle(
//                                             // fontSize: 17,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 17),
//                                         child: Text(doctorAppointment.card_date,
//                                           style: TextStyle(
//                                             // fontSize: 20,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 60,
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                   color: Colors.white,
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 10),
//                                         child: Text(doctorAppointment.card_day,
//                                           style: TextStyle(
//                                             // fontSize: 17,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 17),
//                                         child: Text(doctorAppointment.card_date,
//                                           style: TextStyle(
//                                             // fontSize: 20,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 60,
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                   color: Colors.white,
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 10),
//                                         child: Text(doctorAppointment.card_day,
//                                           style: TextStyle(
//                                             // fontSize: 17,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 17),
//                                         child: Text(doctorAppointment.card_date,
//                                           style: TextStyle(
//                                             // fontSize: 20,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 60,
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                   color: Colors.white,
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 10),
//                                         child: Text(doctorAppointment.card_day,
//                                           style: TextStyle(
//                                             // fontSize: 17,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 17),
//                                         child: Text(doctorAppointment.card_date,
//                                           style: TextStyle(
//                                             // fontSize: 20,
//                                               fontWeight: FontWeight.bold
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//
//                         Container(
//                           padding: EdgeInsets.only(top: 20),
//                           alignment: Alignment.centerLeft,
//                           child: Text(doctorAppointment.dateandtime,
//                             style: TextStyle(
//                               color: Colors.black.withOpacity(0.5),
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold
//                             ),
//                           ),
//                         ),
//
//                         Container(
//                           margin: EdgeInsets.symmetric(vertical: 5.0),
//                           height: 40.0,
//                           child: ListView(
//                             scrollDirection: Axis.horizontal,
//                             children: [
//                               Container(
//                                 width: 90,
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                   color: Colors.white,
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 10),
//                                         child: Center(
//                                           child: Text(doctorAppointment.times,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 90,
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                   color: Colors.white,
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 10),
//                                         child: Center(
//                                           child: Text(doctorAppointment.times,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 90,
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                   color: Colors.white,
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 10),
//                                         child: Center(
//                                           child: Text(doctorAppointment.times,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 90,
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                   color: Colors.white,
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 10),
//                                         child: Center(
//                                           child: Text(doctorAppointment.times,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 90,
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                   color: Colors.white,
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 10),
//                                         child: Center(
//                                           child: Text(doctorAppointment.times,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     child: ElevatedButton(
//                       child: Text(
//                         "Save",
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                       onPressed: () async{
//
//                         EasyLoading.show(status: 'loading...');
//                         DoctorRegReqModel myInfo = new DoctorRegReqModel(
//                           name: _name.text,
//                           //username: "",
//                           email: _textEmail.text,
//                           password: _password.text,
//                           password_confirmation: _confirmPassword.text,
//                           //image: "assets/download.jpg",
//                           mobile: _phoneNumber.text,
//                           bmdc_reg: _AHPRANo.text,
//                         );
//                         //EasyLoading.show(status: 'loading...');
//                         await DoctorRegistrationController.requestThenResponsePrint(myInfo).then((value) async {
//                           print(value.statusCode);
//                           print(value.body);
//                           EasyLoading.dismiss();
//                           if(value.statusCode==200){
//
//                             //EasyLoading.showSuccess('logging in...');
//                             DoctorSignInModel myInfo = new DoctorSignInModel(
//                                 mobile: _phoneNumber.text, password: _password.text);
//                             await DoctorSigninController.requestThenResponsePrint(myInfo)
//                                 .then((value) async {
//                               print(value.statusCode);
//                               print(value.body);
//
//                               final Map parsed = json.decode(value.body);
//
//                               var jsonData = null;
//                               SharedPreferences sharedPreferences =
//                               await SharedPreferences.getInstance();
//                               final loginobject = User.fromJson(parsed);
//                               print(loginobject.token);
//                               sharedPreferences.setString("token", loginobject.token);
//                               //EasyLoading.dismiss();
//                               if (value.statusCode == 200) {
//                                 sharedPreferences.setString("mobile", _phoneNumber.text);
//                                 sharedPreferences.setString("password", _password.text);
//
//                                 return Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SetupProfile()),);
//                               } else {
//                                 // return LoginController.requestThenResponsePrint(jsonData);
//                                 AlertDialogueHelper().showAlertDialog(context, 'Warning', value.body);
//                               }
//
//                             });
//
//                           }else{
//                             AlertDialogueHelper().showAlertDialog(context, 'Warning', value.body.replaceAll('"', ' ')
//                                 .replaceAll('{', ' ')
//                                 .replaceAll('}', ' ')
//                                 .replaceAll('[', ' ')
//                                 .replaceAll(']', ' '));
//
//
//
//                           }
//                         });
//
//                       },
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(350, 59),
//                         //maximumSize: const Size(350, 59),
//                         primary: Color(0xFF1CBFA8),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                       ),
//                     ),
//                     decoration: BoxDecoration(
//                       //color: Color(0xF60D72),
//                         borderRadius: BorderRadius.circular(18)),
//                   ),
//                 ],
//               );
//
//
//
