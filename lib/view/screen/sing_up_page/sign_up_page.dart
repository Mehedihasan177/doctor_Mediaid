import 'dart:convert';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_registration_controller.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_signIn_controller.dart';
import 'package:care_plus_doctor/helper/alertDialogue.dart';
import 'package:care_plus_doctor/helper/snackbarDialouge.dart';
import 'package:care_plus_doctor/model/doctor/doctor_registration_model.dart';
import 'package:care_plus_doctor/model/doctor/doctor_sinIn_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_login_responses.dart' as login;
import 'package:care_plus_doctor/responses/doctor/doctor_registration_responses.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/otp/otp.dart';
import 'package:care_plus_doctor/view/screen/setUp_Profile/setUp_Profile.dart';
import 'package:care_plus_doctor/view/screen/signInPage/sign_in_page.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  TextEditingController _textEmail = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _AHPRANo = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  bool _passwordVisible = false;
  bool _passwordVisible1 = false;
  String countryCode = '+880';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        //Navigator.push(context,MaterialPageRoute(builder: (context) => SingInPage()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),

          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image(
                    image: AssetImage("images/care_plus_doctor_logo.png"),
                    fit: BoxFit.fill,
                    height: 250,
                    width: 250,
                  ),
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
                            Icons.email,
                            size: 18,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Email",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      TextField(
                        controller: _textEmail,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.black),
                        //scrollPadding: EdgeInsets.all(10),
                        decoration: InputDecoration(
                          //contentPadding: EdgeInsets.all(20),
                          hintText: "Enter your email address",
                        ),
                      ),
                    ],
                  ),
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
                            Icons.people_outline,
                            size: 18,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Name",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      TextField(
                        controller: _name,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Enter your name",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),


                //bmdc_reg number


                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.people_outline,
                            size: 18,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "AHPRA No.",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      TextField(
                        controller: _AHPRANo,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Enter your AHPRA No.",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 20),
                  child: Column(
                    children: [

                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.phone,
                              size: 18,
                              color: Colors.black.withOpacity(0.6),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Phone Number",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
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
                              initialSelection: 'AU',
                              favorite: ['+880', 'BD'],
                              showCountryOnly: false,
                              // optional. Shows only country name and flag when popup is closed.
                              showOnlyCountryWhenClosed: false,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: TextField(
                                controller: _phoneNumber,
                                keyboardType: TextInputType.number,
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

                    ],
                  ),
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
                        controller: _password,
                        keyboardType: TextInputType.text,
                        obscureText: !_passwordVisible,
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
                            "Confirm Password",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      TextField(
                        controller: _confirmPassword,
                        obscureText: !_passwordVisible1,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black),
                        //scrollPadding: EdgeInsets.all(10),
                        decoration: InputDecoration(
                          //contentPadding: EdgeInsets.all(20),
                          hintText: "Confirm your password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible1
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color(0xFF1CBFA8),
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible1 = !_passwordVisible1;
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


                SizedBox(
                  height: 30,
                ),
                Container(
                  child: ElevatedButton(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () async{

                      //EasyLoading.show(status: 'loading...');
                      DoctorRegReqModel myInfo = new DoctorRegReqModel(
                          name: _name.text,
                          //username: "",
                          email: _textEmail.text,
                        bmdc_reg: _AHPRANo.text,
                          mobile: countryCode+_phoneNumber.text,
                          password: _password.text,
                          password_confirmation: _confirmPassword.text,
                          //image: "assets/download.jpg",
                          );
                     //EasyLoading.show(status: 'loading...');
                      if(_textEmail == null){
                        SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter email", Colors.red);
                      }else if(!(RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(_textEmail.text))){
                        SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter a valid email", Colors.red);
                      }else if(_name == null){
                        SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter name", Colors.red);
                      }else if(_AHPRANo == null){
                        SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter AHPRA No.", Colors.red);
                      }else if(_phoneNumber == null){
                        SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter phone number", Colors.red);
                      }else if(_password.text.length < 8){
                        SnackbarDialogueHelper().showSnackbarDialog(context, "password is less than 6 digit or enter password", Colors.red);
                      }else if(_confirmPassword.text.length != _password.text.length){
                        SnackbarDialogueHelper().showSnackbarDialog(context, "Given password is not matched", Colors.red);
                      } else {
                        await DoctorRegistrationController.requestThenResponsePrint(myInfo).then((value) async {
                          print(value.statusCode);
                          print(value.body);
                          //EasyLoading.dismiss();
                          if(value.statusCode==200){

                            PHONEONLY = _phoneNumber.text;
                            COUNTRYCODE = countryCode;

                            bmdc = _AHPRANo.text;

                            print("successfull");
                            //EasyLoading.showSuccess('logging in...');
                            DoctorSignInModel myInfo = new DoctorSignInModel(
                                mobile: countryCode+_phoneNumber.text, password: _password.text);
                            await DoctorSigninController.requestThenResponsePrint(myInfo)
                                .then((value) async {
                              print(value.statusCode);
                              print(value.body);

                              //EasyLoading.dismiss();
                              if (value.statusCode == 200) {
                                final Map parsed = json.decode(value.body);
                                PHONE_NUMBER = countryCode + _phoneNumber.text;
                                PASSWORD = _password.text;
                                var jsonData = null;
                                SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                                final loginobject = login.DoctorLoginResponse.fromJson(parsed);
                                DOCTOR_INITIAL = loginobject.data.user;
                                USERTOKEN = loginobject.data.token;
                                print(loginobject.data.token);
                                sharedPreferences.setString("token", loginobject.data.token);

                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                    SetupProfile()), (Route<dynamic> route) => false);
                              } else {
                                // return LoginController.requestThenResponsePrint(jsonData);
                                SnackbarDialogueHelper().showSnackbarDialog(context, 'Warning', 'Please recheck email and password');
                              }

                            });

                          }else{
                            SnackbarDialogueHelper().showSnackbarDialog(context, value.body.replaceAll("{", "").replaceAll("}", "")
                                .replaceAll("[", "").replaceAll("]", ""), Colors.red

                            );
                            print(value.body);
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
                // SizedBox(
                //   height: 20,
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize: 16, color: Colors.black.withOpacity(0.5)),
                      ),
                      FlatButton(
                        minWidth: 10,
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => SingInPage()));
                        },
                        child: Text(
                          "Sign in",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF1CBFA8)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
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
              ],
            ),
          ],
        ),
      ),
    );
  }

}
