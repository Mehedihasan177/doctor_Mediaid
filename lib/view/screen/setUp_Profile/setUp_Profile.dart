import 'dart:convert';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/constents/global_appbar.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_registration_controller.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_signIn_controller.dart';
import 'package:care_plus_doctor/controller/doctor/setup_profile_controller.dart';
import 'package:care_plus_doctor/data/doctor_appointment_data/doctor_about_and_appointment_data.dart';
import 'package:care_plus_doctor/helper/alertDialogue.dart';
import 'package:care_plus_doctor/helper/snackbarDialouge.dart';
import 'package:care_plus_doctor/model/doctor/doctor_sinIn_model.dart';
import 'package:care_plus_doctor/model/setup_profile_model.dart';
import 'package:care_plus_doctor/model/ui_model/doctor_appointment_model/doctor_about_and_appointment_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_login_responses.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_registration_responses.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_update_profile_responses.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/otp/otp.dart';
import 'package:care_plus_doctor/view/screen/setUp_Profile/image_upload_page.dart';
import 'package:care_plus_doctor/view/screen/setUp_Profile/setup_profile_controller.dart';
import 'package:care_plus_doctor/view/screen/setUp_Profile/setup_profile_model.dart';
import 'package:care_plus_doctor/view/screen/sing_up_page/sign_up_page.dart';
import 'package:care_plus_doctor/widget/doctor_about_and_appointment_widget/doctor_about_and_appointment_widget.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_easyloading/flutter_easyloading.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({Key? key,}) : super(key: key);

  @override
  _SetupProfileState createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  TextEditingController _hospital = TextEditingController();
  TextEditingController _designation = TextEditingController();
  TextEditingController _chember = TextEditingController();
  TextEditingController _introduction = TextEditingController();
  TextEditingController _department = TextEditingController();
  TextEditingController _degree = TextEditingController();
  TextEditingController _address = TextEditingController();
  bool checkbox = true;
  String gender = 'Male';
  final maxLines = 15;
  // List<DoctorAppointmentModel> doctorAppointment = List.of(doctor_appointment_data);









  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        // Navigator.push(context,MaterialPageRoute(builder: (context) => SingUpPage()));
        return true;
      },
      child: Scaffold(
        appBar: myAppBar("Setup Profile", null),
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tap back again to leave'),
          ),
          child: ListView(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              children:[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Stack(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              //flex: 1,
                              fit: FlexFit.loose,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NewImageUploadPage(page: 2)),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: 78,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                      child: Image.network(
                                        DOCTOR_INITIAL.image.toString()=='null'?
                                        avatarLink:'$apiDomainRoot/images/${DOCTOR_INITIAL.image}',

                                        fit: BoxFit.fill,
                                        width: 170,
                                        height: 190,
                                      )),
                                ),
                              ), //Container
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NewImageUploadPage(page: 2)),
                            );
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 138),
                              child: Image.asset(
                                "images/camera.png",
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),

                  ]),
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
                                  controller: _designation,
                                  keyboardType: TextInputType.text,
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
                              child: Text("Hospital Name")),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                            child: Center(
                              child: Container(
                                child: TextField(
                                  controller: _hospital,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.black),
//scrollPadding: EdgeInsets.all(10),
                                  decoration: InputDecoration(
//contentPadding: EdgeInsets.all(20),
                                      hintText: "Enter hospital name",
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 20),
                              alignment: Alignment.centerLeft,
                              child: Text("Department",
                                style: TextStyle(
                                    fontSize: 15
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10, top: 8),
                            child: Center(
                              child: Container(
                                child: TextField(
                                  controller: _department,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.black),
//scrollPadding: EdgeInsets.all(10),
                                  decoration: InputDecoration(
//contentPadding: EdgeInsets.all(20),
                                      hintText: "Enter your deparment",
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
                              child: Text("Degree")),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                            child: Center(
                              child: Container(
                                child: TextField(
                                  controller: _degree,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.black),
//scrollPadding: EdgeInsets.all(10),
                                  decoration: InputDecoration(
//contentPadding: EdgeInsets.all(20),
                                      hintText: "Enter hospital degree",
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
                              controller: _chember,
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: Colors.black),
//scrollPadding: EdgeInsets.all(10),
                              decoration: InputDecoration(
//contentPadding: EdgeInsets.all(20),
                                  hintText: "Enter chamber location",
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




                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 20),
                              alignment: Alignment.centerLeft,
                              child: Text("Chamber",
                                style: TextStyle(
                                    fontSize: 15
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10, top: 8),
                            child: Center(
                              child: Container(
                                child: TextField(
                                  controller: _chember,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.black),
//scrollPadding: EdgeInsets.all(10),
                                  decoration: InputDecoration(
//contentPadding: EdgeInsets.all(20),
                                      hintText: "Enter chamber",
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
                              child: Text("Address")),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                            child: Center(
                              child: Container(
                                child: TextField(
                                  controller: _address,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.black),
//scrollPadding: EdgeInsets.all(10),
                                  decoration: InputDecoration(
//contentPadding: EdgeInsets.all(20),
                                      hintText: "Enter your address",
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
                       child: TextField(
                         controller: _introduction,
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


                // RaisedButton(
                //   onPressed: (){
                //     print(checkbox);
                //     if(checkbox==true){
                //       gender='Male';
                //     }else{
                //       gender='Female';
                //     }
                //     print(gender);
                //   },
                //   child: Text('tsr'),
                // ),

                Container(
                  child: ElevatedButton(
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () async {
                      // EasyLoading.show(status: 'loading...');
                      print(checkbox);
                      if (checkbox == true) {
                        gender = 'Male';
                      } else {
                        gender = 'Female';
                      }
                      print(gender);
                      // SetUpProfileModel setup = SetUpProfileModel(
                      //     hospital_name: _hospital.text,
                      //     introduction: _introduction.text,
                      //     designation: _designation.text,
                      //     chambers: _chember.text,
                      //     gender: gender
                      //     );

                      if(_hospital.text.length==0){
                        SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter hospital name", Colors.red);
                      }else if(_designation.text.length==0){
                        SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter designation", Colors.red);
                      }else if(_introduction.text.length==0){
                        SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter introduction", Colors.red);
                      }else if(_chember.text.length==0){
                        SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter chamber", Colors.red);
                      }else if(gender.length==0){
                        SnackbarDialogueHelper().showSnackbarDialog(context, "Please select gender", Colors.red);
                      }
                      else {

                        Map data1 = {
                          "hospital_name": _hospital.text,
                          "designation": _designation.text,
                          'department': "${_department.text}",
                          'degree': "${_degree.text}",
                          "introduction": _introduction.text,
                          "chambers": _chember.text,
                          "gender": gender,
                          "bmdc_reg": bmdc,
                          'address': "${_address.text}",
                        };
                        print(data1);
                        await DoctorSetupProfileController.requestThenResponsePrint(USERTOKEN, data1).then((value) async {
                          print(value.statusCode);
                          print(value.body);

                          print('setup');
                          if (value.statusCode == 200) {
                            SnackbarDialogueHelper().showSnackbarDialog(
                                context, 'profile successfully updated', Colors.green);



                            DoctorSignInModel myInfo = new DoctorSignInModel(
                                mobile: PHONE_NUMBER, password: PASSWORD);
                            await DoctorSigninController.requestThenResponsePrint(myInfo)
                                .then((value) async {

                                  print('signingg');
                              print(value.statusCode);
                              print(value.body);

                              //EasyLoading.dismiss();
                              if (value.statusCode == 200) {
                                final Map parsed = json.decode(value.body);
                                var jsonData = null;
                                SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                                final loginobject = DoctorLoginResponse.fromJson(parsed);
                                DOCTOR_INITIAL = loginobject.data.user;
                                USERTOKEN = loginobject.data.token;
                                print(loginobject.data.token);
                                sharedPreferences.setString("token", loginobject.data.token);
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                    BottomNevigation()), (Route<dynamic> route) => false);

                              } else {
                                // return LoginController.requestThenResponsePrint(jsonData);
                              }

                            });



                          } else {
                            SnackbarDialogueHelper().showSnackbarDialog(
                                context,
                                value.body
                                    .replaceAll('"', ' ')
                                    .replaceAll('{', ' ')
                                    .replaceAll('}', ' ')
                                    .replaceAll('[', ' ')
                                    .replaceAll(']', ' '),
                                Colors.red);
                          }
                        });
                      }
                      //EasyLoading.show(status: 'loading...');

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
      ),
    );
  }


}
