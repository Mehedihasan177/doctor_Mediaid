import 'dart:convert';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/controller/doctor/setup_profile_controller.dart';
import 'package:care_plus_doctor/helper/snackbarDialouge.dart';
import 'package:care_plus_doctor/model/ui_model/my_profile_model/my_profile_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_specialization_responses.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_update_profile_responses.dart';
import 'package:care_plus_doctor/view/screen/add_services/add_services.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
TextEditingController _experience = TextEditingController();
TextEditingController _fee = TextEditingController();
Widget MyProfileWidget(MyProfileModel myProfile, BuildContext context) =>
    Column(
      children: [
        Card(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  width: 120.0,
                  height: 150.0,
                  child: Image.asset(
                    myProfile.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Column(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          color: Color(0xFF1CBFA8),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          iconSize: 20,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text("Change Profile Picture")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.07)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.person_pin,
                    color: Color(0xFF1CBFA8),
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    myProfile.name,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.07)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.phone_android_sharp,
                    color: Color(0xFF1CBFA8),
                    size: 20,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    myProfile.phone_number.toString(),
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.07)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Color(0xFF1CBFA8),
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    myProfile.email,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 20),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Experience & Fee",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.5)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.07)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextField(
              controller: _experience,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
//scrollPadding: EdgeInsets.all(10),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.assignment_turned_in_outlined,
                    color: Color(0xFF1CBFA8),
                    size: 20,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
//contentPadding: EdgeInsets.all(20),
                  hintText: "18 years",
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.07)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextField(
              controller: _fee,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
//scrollPadding: EdgeInsets.all(10),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.account_balance_wallet_rounded,
                    color: Color(0xFF1CBFA8),
                    size: 20,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
//contentPadding: EdgeInsets.all(20),
                  hintText: "\$28",
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Service at",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(

                  height: 25,
                  alignment: Alignment.centerLeft,
                  child: FlatButton(
                    minWidth: 10,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddServicesPage()));
                    },
                    child: Text(
                      "EDIT",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1CBFA8)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hypertension Treatment",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.9)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "COPD Treatment",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.9)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Diabates Management",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.9)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ECG",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.9)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Obesity Treatement",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.9)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "+5 more",
                  style: TextStyle(fontSize: 16, color: Color(0xFF1CBFA8)),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 40, top: 15),
          child: Divider(
            thickness: 3,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Specialization",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "EDIT",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1CBFA8)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 5),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "General Physician",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.9)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Family Physician",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.9)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Cardiologist",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.9)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Consultant",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.9)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Dialectology",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.9)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "+5 more",
                  style: TextStyle(fontSize: 16, color: Color(0xFF1CBFA8)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
            height: 20
        ),
        Center(
          child: Container(
            child: ElevatedButton(
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () async{

               // EasyLoading.show(status: 'loading...');


                Map data1 = {
                  'experience': "${_experience.text}",
                  'fee': "${_fee.text}",


                };
                //EasyLoading.show(status: 'loading...');
                await DoctorSetupProfileController.requestThenResponsePrint( USERTOKEN, data1).then((value) async {
                  print(value.statusCode);
                  print(value.body);
                  final Map parsed = json.decode(value.body);

                  final doctorProfile = DoctorUpdateProfile.fromJson(parsed);
                  DOCTORUPDATEPROFILERESPONSES = doctorProfile;

                  print(value.statusCode);
                  print(value.body);
                  EasyLoading.dismiss();
                  if(value.statusCode==200){
                    SnackbarDialogueHelper().showSnackbarDialog(context, 'successfully Added', Colors.green);
                    //return Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SetupProfile()),);

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
                minimumSize: const Size(350, 50),
                //minimumSize: const Size(350, 50),
                primary: Color(0xFF1CBFA8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            decoration: BoxDecoration(
              //color: Color(0xF60D72),
                borderRadius: BorderRadius.circular(18)),
          ),
        ),

      ],
    );
//Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
