import 'dart:convert';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_signIn_controller.dart';
import 'package:care_plus_doctor/helper/alertDialogue.dart';
import 'package:care_plus_doctor/helper/snackbarDialouge.dart';
import 'package:care_plus_doctor/model/doctor/doctor_sinIn_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_login_responses.dart';
import 'package:care_plus_doctor/services/firebase_services.dart';
import 'package:care_plus_doctor/view/screen/appointmnet_list/appointment_list_ui.dart';
import 'package:care_plus_doctor/view/screen/change_password/change_password.dart';
import 'package:care_plus_doctor/view/screen/forget_password/forget_password.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/sing_up_page/sign_up_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({Key? key,}) : super(key: key);

  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  // TextEditingController _textMobile = TextEditingController(text: "");
  // TextEditingController _textPassword = TextEditingController(text: "");
 late String mobile_number = '';
  TextEditingController _textMobile = TextEditingController();
  TextEditingController _textPassword = TextEditingController();
  bool _passwordVisible = false;
 String countryCode = '+880';
 late String finalMobile = '';
 late String finalCountry = '+880';

 Future getValidationData() async {
   final SharedPreferences sharedPreferences =
   await SharedPreferences.getInstance();
   String? obtainedMobile = sharedPreferences.getString("mobile");
   String? obtainedCountry = sharedPreferences.getString("country");

   setState(() {
     finalMobile = obtainedMobile!;
     _textMobile = TextEditingController(text: finalMobile);
     finalCountry = obtainedCountry!;
     countryCode = finalCountry;

   });
   print(finalMobile);
   print(finalCountry);
 }

  @override
  void initState() {

    getValidationData();

    // TODO: implement initState
    super.initState();
  }

  //String countryCode = '+880';
  @override
  Widget build(BuildContext context) {
    // final ref = fb.reference();
    return Scaffold(
      body: ListView(

        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          Center(
            child: Container(
              height: 200,
              width: 200,
              child: Image(
                image: AssetImage("images/care_plus_doctor_logo.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex:1,
                child: CountryCodePicker(

                  onChanged: (code){
                    setState(() {
                      countryCode = code.dialCode!;
                    });
                  },
                  showFlag: true,
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: finalCountry,
                  favorite: ['+880', 'BD'],
                  showCountryOnly: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TextField(
                    controller: _textMobile,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    //scrollPadding: EdgeInsets.all(10),
                    decoration: InputDecoration(
                      //contentPadding: EdgeInsets.all(20),
                      hintText: "Enter your phone number",
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.lock,
                      size: 18,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                TextField(
                  controller: _textPassword,
                  obscureText: !_passwordVisible,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  //scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.all(20),
                    hintText: "Enter your password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Color(0xFF1CBFA8),
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 30,
          ),


          Center(
            child: Container(
              child: ElevatedButton(
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {



                  // addData(_textMobile.text);
                  //EasyLoading.show(status: 'loading...');
                  // SharedPreferences sharedPreferences =
                  // await SharedPreferences.getInstance();
                  if(_textMobile == null){
                    SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter mobile number", Colors.red);
                  }
                  else if(_textPassword.text.length < 8){
                    SnackbarDialogueHelper().showSnackbarDialog(context, "Password is less than 6", Colors.red);
                  }
                  else {

                    PHONEONLY = _textMobile.text;
                    COUNTRYCODE = countryCode;

                    DoctorSignInModel myInfo = new DoctorSignInModel(
                        mobile: countryCode + _textMobile.text , password: _textPassword.text);
                    //EasyLoading.show(status: 'loading...');
                    await DoctorSigninController.requestThenResponsePrint(myInfo)
                        .then((value) async {
                      print(value.statusCode);
                      print(value.body);
                      PHONE_NUMBER = countryCode + _textMobile.text;
                      PASSWORD = _textPassword.text;

                      //EasyLoading.show(status: 'loading...');
                      if (value.statusCode == 200) {
                        //EasyLoading.dismiss();
                        return  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()),);
                      } else if(value.statusCode == 400){
                        SnackbarDialogueHelper().showSnackbarDialog(context, value.body, Colors.red);
                      }
                      else {
                        SnackbarDialogueHelper().showSnackbarDialog(context, "Please check mobile or password", Colors.red);
                      }

                    });
                  }
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
          ),
          // SizedBox(
          //   height: 20,
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: FlatButton(
              minWidth: 10,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ForgetPassword()));
              },
              child: Text(
                "Forget Password?",
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(0.5)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Text("Or Sign in with"),
                Expanded(
                    child: Divider(
                  color: Colors.black,
                ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  minWidth: 5,
                  onPressed: () {
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => DoctorCatagory()));
                  },
                  child: Image.asset(
                    "images/google.png",
                    height: 30,
                    width: 30,
                  ),
                ),


                FlatButton(
                  minWidth: 5,
                  onPressed: () {
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => DoctorCatagory()));
                  },
                  child: Image.asset(
                    "images/facebook.png",
                    height: 30,
                    width: 30,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Haven't any?",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.5)),
                ),
               FlatButton(
                    minWidth: 10,
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => SingUpPage()));
                    },
                    child: Text(
                      "Create an account",
                      style: TextStyle(
                          fontSize: 16, color: Color(0xFF1CBFA8)),
                    ),
                  ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
