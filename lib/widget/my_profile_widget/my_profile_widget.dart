import 'dart:convert';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/controller/doctor/setup_profile_controller.dart';
import 'package:care_plus_doctor/helper/snackbarDialouge.dart';
import 'package:care_plus_doctor/model/ui_model/my_profile_model/my_profile_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_specialization_responses.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_update_profile_responses.dart';
import 'package:care_plus_doctor/view/screen/add_services/add_services.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/setUp_Profile/image_upload_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
TextEditingController _experience = TextEditingController();
TextEditingController _fee = TextEditingController();
TextEditingController _serviceAt = TextEditingController();
TextEditingController _gender = TextEditingController();
TextEditingController _chember = TextEditingController();
TextEditingController _department = TextEditingController();
TextEditingController _degree = TextEditingController();
TextEditingController _designation = TextEditingController();
TextEditingController _address = TextEditingController();
TextEditingController _introduction = TextEditingController();

String split = '';
Widget MyProfileWidget(MyProfileModel myProfile, BuildContext context) =>
    Column(
      children: [
        Card(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  width: 100.0,
                  height: 130.0,
                  child: Image.network(
                    "$apiDomainRoot/images/${myProfile.image}",
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
                          onPressed: () {
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => NewImageUploadPage(page: 1)));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text("Change Profile Picture")),
                      ),
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




        ///designation
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10, bottom: 10),

                  child: Text("Designation",
                  style: TextStyle(
                    fontSize: 16
                  ),

                  )),
              TextFormField(
                // here is where you fill the TextFormField
                controller: _designation,
                decoration: InputDecoration(
                  labelText: DOCTOR_INITIAL.designation,
                  fillColor: Colors.black.withOpacity(0.07),
                  focusColor: Colors.black.withOpacity(0.07),
                  hoverColor: Colors.black.withOpacity(0.07),

                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                ),
                readOnly: false,
              ),
            ],
          ),
        ),










        ///department
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10, bottom: 10),

                  child: Text("Department",
                    style: TextStyle(
                        fontSize: 16
                    ),

                  )),
              TextFormField(
                // here is where you fill the TextFormField
                controller: _department,
                decoration: InputDecoration(
                  labelText: DOCTOR_INITIAL.department,
                  fillColor: Colors.black.withOpacity(0.07),
                  focusColor: Colors.black.withOpacity(0.07),
                  hoverColor: Colors.black.withOpacity(0.07),

                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                ),
                readOnly: false,
              ),
            ],
          ),
        ),
        ///degree
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10, bottom: 10),

                  child: Text("Degree",
                    style: TextStyle(
                        fontSize: 16
                    ),

                  )),
              TextFormField(
                // here is where you fill the TextFormField
                controller: _degree,
                decoration: InputDecoration(
                  labelText: DOCTOR_INITIAL.degree,
                  fillColor: Colors.black.withOpacity(0.07),
                  focusColor: Colors.black.withOpacity(0.07),
                  hoverColor: Colors.black.withOpacity(0.07),

                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                ),
                readOnly: false,
              ),
            ],
          ),
        ),


        // /// chamber
        // Padding(
        //   padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        //   child: TextFormField(
        //     // here is where you fill the TextFormField
        //     controller: _department,
        //     decoration: InputDecoration(
        //      // labelText: DOCTOR_INITIAL.chambers,
        //       fillColor: Colors.black.withOpacity(0.07),
        //       focusColor: Colors.black.withOpacity(0.07),
        //       hoverColor: Colors.black.withOpacity(0.07),
        //
        //       border: new OutlineInputBorder(
        //         borderRadius: new BorderRadius.circular(15.0),
        //       ),
        //     ),
        //     readOnly: false,
        //   ),
        // ),
        ///adress

        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10, bottom: 10),

                  child: Text("Address",
                    style: TextStyle(
                        fontSize: 16
                    ),

                  )),
              TextFormField(
                // here is where you fill the TextFormField
                controller: _address,
                decoration: InputDecoration(
                  labelText: DOCTOR_INITIAL.address,
                  fillColor: Colors.black.withOpacity(0.07),
                  focusColor: Colors.black.withOpacity(0.07),
                  hoverColor: Colors.black.withOpacity(0.07),

                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                ),
                readOnly: false,
              ),
            ],
          ),
        ),
        // ///introduction
        // Padding(
        //   padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        //   child: TextFormField(
        //     // here is where you fill the TextFormField
        //     controller: _introduction,
        //     decoration: InputDecoration(
        //       labelText: DOCTOR_INITIAL.i,
        //       fillColor: Colors.black.withOpacity(0.07),
        //       focusColor: Colors.black.withOpacity(0.07),
        //       hoverColor: Colors.black.withOpacity(0.07),
        //
        //       border: new OutlineInputBorder(
        //         borderRadius: new BorderRadius.circular(15.0),
        //       ),
        //     ),
        //     readOnly: false,
        //   ),
        // ),



        ///chember
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10, bottom: 10),

                  child: Text("Chember",
                    style: TextStyle(
                        fontSize: 16
                    ),

                  )),
              TextFormField(
                // here is where you fill the TextFormField
                controller: _chember,
                decoration: InputDecoration(
                  labelText: DOCTOR_INITIAL.chambers,
                  fillColor: Colors.black.withOpacity(0.07),
                  focusColor: Colors.black.withOpacity(0.07),
                  hoverColor: Colors.black.withOpacity(0.07),

                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                ),
                readOnly: false,
              ),
            ],
          ),
        ),
        ///gender
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10, bottom: 10),

                  child: Text("Gender",
                    style: TextStyle(
                        fontSize: 16
                    ),

                  )),
              TextFormField(
                // here is where you fill the TextFormField
                controller: _gender,
                decoration: InputDecoration(
                  labelText: DOCTOR_INITIAL.gender,
                  fillColor: Colors.black.withOpacity(0.07),
                  focusColor: Colors.black.withOpacity(0.07),
                  hoverColor: Colors.black.withOpacity(0.07),

                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                ),
                readOnly: false,
              ),
            ],
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
                keyboardType: TextInputType.text,
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
                keyboardType: TextInputType.number,
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

            ],
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
                controller: _serviceAt,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black),
//scrollPadding: EdgeInsets.all(10),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.account_balance_outlined,
                    color: Color(0xFF1CBFA8),
                    size: 20,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
//contentPadding: EdgeInsets.all(20),
                  hintText: "Hospital name",
                ),
              ),
            ),
          ),
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
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AddServicesPage()),);
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
              padding: const EdgeInsets.only(left: 30, top: 5),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(

                  myProfile.specialization.split(",").join("\n"),
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.9)),
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
                  'hospital_name': "${_serviceAt.text}",
                  'designation': "${_designation.text}",
                  'department': "${_department.text}",
                  'degree': "${_degree.text}",
                  'address': "${_address.text}",
                  //'introduction': "${_introduction.text}",
                 // 'chambers': "${_chember.text}",
                  'gender': "${_gender.text}",


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
