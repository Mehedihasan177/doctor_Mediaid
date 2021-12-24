import 'dart:convert';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_reset_password_controller.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_signIn_controller.dart';
import 'package:care_plus_doctor/helper/alertDialogue.dart';
import 'package:care_plus_doctor/helper/snackbarDialouge.dart';
import 'package:care_plus_doctor/model/doctor/doctor_reset_password_model.dart';
import 'package:care_plus_doctor/model/doctor/doctor_sinIn_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_login_responses.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _textMobile = TextEditingController();
  //TextEditingController _textPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        // Navigator.push(context,MaterialPageRoute(builder: (context) => ChangePassword()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text("Reset Password", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.5)
                ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Image(
                        height: 250,
                        width: 250,
                        image: AssetImage("images/care+_Logo.png",),
                        fit: BoxFit.fill,
                      ),
                    ),

                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
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
                              "Phone Number",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        TextField(
                          controller: _textMobile,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black),
                          //scrollPadding: EdgeInsets.all(10),
                          decoration: InputDecoration(
                            //contentPadding: EdgeInsets.all(20),
                            hintText: "Enter your email",
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/mobile_security.png",
                            height: 20,
                            width: 20,
                          ),
                          Text("OTP"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 90, right: 90),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _textFieldOTP(first: true, last: false),
                            _textFieldOTP(first: false, last: false),
                            _textFieldOTP(first: false, last: false),
                            // _textFieldOTP(first: false, last: false),
                            _textFieldOTP(first: false, last: true),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      child: ElevatedButton(
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          print("token of user\n");
                          print("token at call mehedi hasan who are you: " + USERTOKEN);
                          DoctorResetPasswordModel passChange = new DoctorResetPasswordModel(mobile: _textMobile.text);

                          DoctorResetPasswordController.requestThenResponsePrint(passChange ).then((value) {
                            print('dddddddd');
                            print(value.statusCode);
                            if (value.statusCode == 200) {
                              print("successfully done");
                              PHONE_NUMBER = _textMobile.text;
                              signInAgain(context);
                              SnackbarDialogueHelper().showSnackbarDialog(context, 'successfully reset password', Colors.green);
                            }else{
                              // BasicFunctions.showAlertDialogTOView(context,
                              //     AppLocalizations.of(context).translate("passwordRecheckTitle"),
                              //     AppLocalizations.of(context).translate("passwordRecheckMessage"));
                              // BasicFunctions.showAlertDialogTOView(context, "Warning", "Please recheck your passwords to change");
                            }
                          });
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
                ],
              ),
            ),

            // SizedBox(
            //   height: 20,
            // ),

          ],
        ),
      ),
    );
  }

  Future<void> signInAgain(BuildContext context) async {
    //EasyLoading.show(status: 'loading...');

    DoctorSignInModel myInfo = new DoctorSignInModel(mobile: PHONE_NUMBER, password: PASSWORD, );
    await DoctorSigninController.requestThenResponsePrint(myInfo).then((value) async {
      print(value.statusCode);
      print(value.body);
      final Map parsed = json.decode(value.body);

      final loginobject = SignInResponse.fromJson(parsed);
      DOCTOR_INITIAL = loginobject;
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
        // AlertDialogueHelper().showAlertDialog(
        //     context, 'Warning', 'Please recheck email and password');
      }
    });
  }



  Widget _textFieldOTP({required bool first, last}) {
    return Container(
      height: 35,
      //color: Colors.red,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },

          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
