import 'dart:convert';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/constents/global_appbar.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_signIn_controller.dart';
import 'package:care_plus_doctor/controller/doctor/setup_profile_controller.dart';
import 'package:care_plus_doctor/data/my_profile_data/my_profile_data.dart';
import 'package:care_plus_doctor/helper/snackbarDialouge.dart';
import 'package:care_plus_doctor/model/doctor/doctor_sinIn_model.dart';
import 'package:care_plus_doctor/model/ui_model/my_profile_model/checkboxany.dart';
import 'package:care_plus_doctor/model/ui_model/my_profile_model/my_profile_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_login_responses.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_specialization_responses.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_update_profile_responses.dart';
import 'package:care_plus_doctor/view/screen/add_services/add_services.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/profile/profile.dart';
import 'package:care_plus_doctor/view/screen/setUp_Profile/image_upload_page.dart';
import 'package:care_plus_doctor/widget/my_profile_widget/my_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  TextEditingController _experience = TextEditingController(text: DOCTOR_INITIAL.experience.replaceAll("null", "0"));
  TextEditingController _fee = TextEditingController(text: DOCTOR_INITIAL.fee.replaceAll("null", "0"));
  TextEditingController _serviceAt = TextEditingController(text: DOCTOR_INITIAL.hospitalName);
  TextEditingController _gender = TextEditingController();
  TextEditingController _chember = TextEditingController(text: DOCTOR_INITIAL.chambers);
  TextEditingController _department = TextEditingController(text: DOCTOR_INITIAL.department);
  TextEditingController _degree = TextEditingController(text: DOCTOR_INITIAL.degree);
  TextEditingController _designation = TextEditingController(text: DOCTOR_INITIAL.designation);
  TextEditingController _address = TextEditingController(text: DOCTOR_INITIAL.address);
  TextEditingController _introduction = TextEditingController(text: DOCTOR_INITIAL.introduction);


  bool checkbox = true;
  String gender = 'Male';

  List<MyProfileModel> myProfile = List.of(myProfileData);




  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        //Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ProfilePage()),
        // );

        //Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        appBar: myAppBar("My Profile", null),
        body: ListView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [

            // Padding(
            //   padding: const EdgeInsets.only(top: 20, bottom: 20),
            //   child: Row(
            //     children: [
            //       FlatButton(
            //         child: Icon(
            //           Icons.arrow_back_ios,
            //           size: 30,
            //           color: Colors.black.withOpacity(0.5),
            //         ),
            //         splashColor: Colors.transparent,
            //         onPressed: () {
            //           // Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
            //         },
            //       ),
            //       Expanded(
            //         child: Padding(
            //           padding: const EdgeInsets.only(right: 60),
            //           child: Text(
            //             "My Profile",
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //               fontSize: 23,
            //               color: Colors.black.withOpacity(0.5),
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),


      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Card(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        width: 130.0,
                        height: 130.0,
                        child: Image.network(
                          DOCTOR_INITIAL.image.toString()=='null'?
                          avatarLink:'$apiDomainRoot/images/${DOCTOR_INITIAL.image}',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          // Container(
                          //   height: 35,
                          //   width: 35,
                          //   alignment: Alignment.topLeft,
                          //   decoration: BoxDecoration(
                          //     color: Color(0xFF1CBFA8),
                          //     borderRadius: BorderRadius.circular(30),
                          //   ),
                          //   child: IconButton(
                          //     icon: Icon(
                          //       Icons.camera_alt,
                          //       color: Colors.white,
                          //     ),
                          //     iconSize: 20,
                          //     onPressed: () {
                          //       Navigator.push(context,MaterialPageRoute(builder: (context) => NewImageUploadPage(page: 1)));
                          //     },
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${DOCTOR_INITIAL.name}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${DOCTOR_INITIAL.gender}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 12),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${DOCTOR_INITIAL.email}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 14),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${DOCTOR_INITIAL.mobile}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 14),
                                )),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NewImageUploadPage(page: 1)));
                                },
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Change Profile Picture",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                    )),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///designation
            Padding(
              padding: const EdgeInsets.only(left: 13, right: 10),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(bottom: 10, left: 10, top: 20),
                      alignment: Alignment.centerLeft,
                      child: Text("Designation",

                        style: TextStyle(
                            fontSize: 17
                        ),
                      )),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black.withOpacity(0.04)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: _designation,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black),
//scrollPadding: EdgeInsets.all(10),
                        decoration: InputDecoration(
                          hintText: "Enter your designation",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
//contentPadding: EdgeInsets.all(20),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///department
            Padding(
              padding: const EdgeInsets.only(left: 13, right: 10),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(bottom: 10, left: 10, top: 20),
                      alignment: Alignment.centerLeft,
                      child: Text("Department",

                        style: TextStyle(
                            fontSize: 17
                        ),
                      )),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black.withOpacity(0.04)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: _department,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black),
//scrollPadding: EdgeInsets.all(10),
                        decoration: InputDecoration(
                          hintText: "Enter your department",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
//contentPadding: EdgeInsets.all(20),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///degree
            Padding(
              padding: const EdgeInsets.only(left: 13, right: 10),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(bottom: 10, left: 10, top: 20),
                      alignment: Alignment.centerLeft,
                      child: Text("Degree",

                        style: TextStyle(
                            fontSize: 17
                        ),
                      )),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black.withOpacity(0.04)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: _degree,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black),
//scrollPadding: EdgeInsets.all(10),
                        decoration: InputDecoration(
                          hintText: "Enter your degree",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
//contentPadding: EdgeInsets.all(20),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///adress

            Padding(
              padding: const EdgeInsets.only(left: 13, right: 10),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(bottom: 10, left: 10, top: 20),
                      alignment: Alignment.centerLeft,
                      child: Text("Address",

                        style: TextStyle(
                            fontSize: 17
                        ),
                      )),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black.withOpacity(0.04)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: _address,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black),
//scrollPadding: EdgeInsets.all(10),
                        decoration: InputDecoration(
                          hintText: "Enter your address",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
//contentPadding: EdgeInsets.all(20),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            ///chember
            Padding(
              padding: const EdgeInsets.only(left: 13, right: 10),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(bottom: 10, left: 10, top: 20),
                      alignment: Alignment.centerLeft,
                      child: Text("Chamber",

                        style: TextStyle(
                            fontSize: 17
                        ),
                      )),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black.withOpacity(0.04)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: _chember,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black),
//scrollPadding: EdgeInsets.all(10),
                        decoration: InputDecoration(
                          hintText: "Enter your chamber",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
//contentPadding: EdgeInsets.all(20),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///gender
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 33, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 17,
                        width: 17,
                        child: Image(
                          image: AssetImage("images/gender.png"),
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
                SizedBox(
                  height: 10,
                ),
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
                                if (checkbox == false) checkbox = !checkbox;
                              });
                            },
                          ),
// SizedBox(width: 20,),
                          Text(
                            "Male",
                            style: TextStyle(fontSize: 15),
                          ),
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
                                if (checkbox == true) checkbox = !checkbox;
                              });
                            },
                          ),
// SizedBox(width: 10,),
                          Text(
                            "Female",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
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
                      hintText: "Enter year of experience",
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
                      hintText: "Enter your fee",
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddServicesPage()),
                          );
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
                      DOCTOR_INITIAL.specialization.split(",").join("\n"),
                      style: TextStyle(
                          fontSize: 16, color: Colors.black.withOpacity(0.9)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                child: ElevatedButton(
                  child: Text(
                    "Submit",
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
                    Map data1 = {
                      'experience': "${_experience.text}",
                      'fee': "${_fee.text}",
                      'hospital_name': "${_serviceAt.text}",
                      'designation': "${_designation.text}",
                      'department': "${_department.text}",
                      'degree': "${_degree.text}",
                      'address': "${_address.text}",
                      //'introduction': "${_introduction.text}",
                       'chambers': "${_chember.text}",
                      'gender': "${gender}",
                    };
                    // if(_experience == null){
                    //   SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter experience", Colors.red);
                    // }else if(_fee == null){
                    //   SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter fee", Colors.red);
                    // }else if(_address == null){
                    //   SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter address", Colors.red);
                    // }else if(_serviceAt == null){
                    //   SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter service place", Colors.red);
                    // }else if(_fee == null){
                    //   SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter fee", Colors.red);
                    // }else if(_fee == null){
                    //   SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter fee", Colors.red);
                    // }
                    //EasyLoading.show(status: 'loading...');
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
        ),
      )

          ],
        ),
      ),
    );
  }
  Future<void> signInAgain(BuildContext context) async {
    //EasyLoading.show(status: 'loading...');

    DoctorSignInModel myInfo = new DoctorSignInModel(
      mobile: PHONE_NUMBER,
      password: PASSWORD,
    );
    await DoctorSigninController.requestThenResponsePrint(myInfo).then((value) async {
      print(value.statusCode);
      print(value.body);
      final Map parsed = json.decode(value.body);

      final loginobject = SignInResponse.fromJson(parsed);
      print(loginobject.token);
      print(loginobject.token);

      USERTOKEN = loginobject.token;
      // sharedPreferences.setString("token", loginobject.accessToken);
      //EasyLoading.dismiss();
      if (value.statusCode == 200) {
        PASSWORD = PASSWORD;
        PHONE_NUMBER = PHONE_NUMBER;
        return Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNevigation()),
        );
      } else {
        // return LoginController.requestThenResponsePrint(jsonData);

        SnackbarDialogueHelper().showSnackbarDialog(
            context, 'Please recheck email and password', Colors.red);

      }
    });
  }
}

// Widget MyProfileWidget(MyProfileModel myProfile, BuildContext context) {
// }

// Widget MyProfileWidget(DoctorUpdateProfile myProfile, BuildContext context) {
// }

// Widget MyProfileWidget(MyProfileModel myProfile, BuildContext context, DoctorUpdateProfile doctorupdateprofileresponses) {
// }
//




