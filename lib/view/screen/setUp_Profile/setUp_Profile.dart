import 'dart:convert';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_registration_controller.dart';
import 'package:care_plus_doctor/controller/doctor/setup_profile_controller.dart';
import 'package:care_plus_doctor/data/doctor_appointment_data/doctor_about_and_appointment_data.dart';
import 'package:care_plus_doctor/helper/alertDialogue.dart';
import 'package:care_plus_doctor/helper/snackbarDialouge.dart';
import 'package:care_plus_doctor/model/setup_profile_model.dart';
import 'package:care_plus_doctor/model/ui_model/doctor_appointment_model/doctor_about_and_appointment_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_registration_responses.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_update_profile_responses.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/otp/otp.dart';
import 'package:care_plus_doctor/view/screen/setUp_Profile/image_upload_page.dart';
import 'package:care_plus_doctor/widget/doctor_about_and_appointment_widget/doctor_about_and_appointment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SetupProfile extends StatefulWidget {
  SetupProfile({Key? key,

  }) : super(key: key);

  @override
  _SetupProfileState createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  TextEditingController _name = TextEditingController();
  TextEditingController _specialization = TextEditingController();
  TextEditingController _ahpra = TextEditingController();
  TextEditingController _designation = TextEditingController();
  TextEditingController _fee = TextEditingController();
  TextEditingController _chember = TextEditingController();
  TextEditingController _introduction = TextEditingController();
  bool checkbox = true;
  String gender = 'Male';

  final maxLines = 15;
  List<DoctorAppointmentModel> doctorAppointment = List.of(doctor_appointment_data);









  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => OTPpage()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          children:[
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Text("Set up your profile",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black.withOpacity(0.5),
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20),
              child: Text("Update your profile picture or renew informaton",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: (){

                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => NewImageUploadPage()),);
                },
                child: GestureDetector(

                  child: Stack(
                      children:
                      [

                        Center(
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => NewImageUploadPage()),);
                            },
                            child: Container(
                              height: 130,
                              width: 120,
                              decoration: BoxDecoration(
                                // border: Border.all(color: Colors.black.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(0.07),
                              ), //BoxDecoration
                            ),
                          ),
                        ), //Container

                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 115),
                            child: Image.asset("images/camera.png", height: 30,width: 30,),
                          ),
                        ),
                      ]
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 40,
            ),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 33),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 17,
                        width: 17,
                        child: Image(image: AssetImage("images/gender.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Gender",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Checkbox(
                            value: checkbox,
                            shape: CircleBorder(),
                            onChanged: (bool? value) {
                              setState(() {
                                print('value');
                                print(value);
                                if(checkbox==false)checkbox = !checkbox;
                              });
                            },
                          ),
// SizedBox(width: 20,),
                          Text("Male", style: TextStyle(fontSize: 15),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Checkbox(
                            value: !checkbox,
                            shape: CircleBorder(),
                            onChanged: (bool? value) {
                              setState(() {
                                print('value');
                                print(value);
                                if(checkbox==true)checkbox = !checkbox;
                              });
                            },
                          ),
// SizedBox(width: 10,),
                          Text("Female", style: TextStyle(fontSize: 15),),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 40,
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: Text("Designation",
                            style: TextStyle(
                                fontSize: 15
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10, top: 8),
                        child: Center(
                          child: Container(
                            child: TextField(
// controller: _textEmail,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black),
//scrollPadding: EdgeInsets.all(10),
                              decoration: InputDecoration(
//contentPadding: EdgeInsets.all(20),
                                  hintText: "Enter your designation",
                                  hintStyle: TextStyle(
                                      fontSize: 10
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: Text("AHPRA no.")),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                        child: Center(
                          child: Container(
                            child: TextField(
// controller: _textEmail,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black),
//scrollPadding: EdgeInsets.all(10),
                              decoration: InputDecoration(
//contentPadding: EdgeInsets.all(20),
                                  hintText: "Enter AHPRA no.",
                                  hintStyle: TextStyle(
                                      fontSize: 10
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 40,
            ),


            SizedBox(height: 20,),


            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.black.withOpacity(0.5),),
                        Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            child: Text("Chamber")),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Center(
                      child: Container(
                        child: TextField(
// controller: _textEmail,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.black),
//scrollPadding: EdgeInsets.all(10),
                          decoration: InputDecoration(
//contentPadding: EdgeInsets.all(20),
                              hintText: "Enter your fee",
                              hintStyle: TextStyle(
                                  fontSize: 10
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),


            Container(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 35),
                      alignment: Alignment.centerLeft,
                      child: Text("Introduction")),


                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Center(
                      child: Container(
                        child:
                        Container(
                          margin: EdgeInsets.all(12),
                          height: maxLines * 6.0,
// decoration: BoxDecoration(
//     border: Border.all(),
//     borderRadius: BorderRadius.all(Radius.circular(10))
// ),
                          child: TextField(
                            maxLines: maxLines,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
//hintText: "Enter a message",
                              fillColor: Colors.white,
//filled: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            SizedBox(
              height: 20,
            ),


            RaisedButton(
              onPressed: (){
                print(checkbox);
                if(checkbox==true){
                  gender='Male';
                }else{
                  gender='Female';
                }
                print(gender);
              },
              child: Text('tsr'),
            ),

            Container(
              child: ElevatedButton(
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async{

// EasyLoading.show(status: 'loading...');


                  Map data1 = {
                    'gender': "${gender}",
                    'designation': "${_designation.text}",
                    'bmdc_reg': "${_ahpra.text}",
                    'chambers': "${_chember.text}",
                    'introduction': "${_introduction.text}",


                  };

                  await DoctorSetupProfileController.requestThenResponsePrint( USERTOKEN, data1).then((value) async {
                    print(value.statusCode);
                    print(value.body);
                    final Map parsed = json.decode(value.body);

                    final doctorProfile = DoctorUpdateProfile.fromJson(parsed);
                    DOCTORUPDATEPROFILERESPONSES = doctorProfile;

                    print(value.statusCode);
                    print(value.body);
//EasyLoading.dismiss();
                    if(value.statusCode==200){
                      SnackbarDialogueHelper().showSnackbarDialog(context, 'successfully set up your profile', Colors.green);
                      return Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()),);

                    }else{
                      SnackbarDialogueHelper().showSnackbarDialog(context, value.body.replaceAll('"', ' ')
                          .replaceAll('{', ' ')
                          .replaceAll('}', ' ')
                          .replaceAll('[', ' ')
                          .replaceAll(']', ' '), Colors.red);
                    }
                  }
                  );

                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 59),
//maximumSize: const Size(350, 59),
                  primary: Color(0xFF1CBFA8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              decoration: BoxDecoration(
//color: Color(0xF60D72),
                  borderRadius: BorderRadius.circular(18)),
            ),


          ]
        ),
      ),
    );
  }


}
