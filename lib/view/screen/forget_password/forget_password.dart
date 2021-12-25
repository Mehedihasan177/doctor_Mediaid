import 'dart:convert';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/constents/global_appbar.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_reset_password_controller.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_signIn_controller.dart';
import 'package:care_plus_doctor/helper/alertDialogue.dart';
import 'package:care_plus_doctor/helper/snackbarDialouge.dart';
import 'package:care_plus_doctor/model/doctor/doctor_reset_password_model.dart';
import 'package:care_plus_doctor/model/doctor/doctor_sinIn_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_login_responses.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/otp/otp_two.dart';
import 'package:care_plus_doctor/view/screen/signInPage/sign_in_page.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _textMobile = TextEditingController();
  TextEditingController _textPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        // Navigator.push(context,MaterialPageRoute(builder: (context) => SingInPage()));
        return true;
      },
      child: Scaffold(
        appBar: myAppBar("Forget Password", null),

        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Center(
              child: Image(
                height: 250,
                width: 250,
                image: AssetImage("images/care_plus_doctor_logo.png",),
                fit: BoxFit.fill,
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
                        Icons.mobile_screen_share_sharp,
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
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.black),
                    //scrollPadding: EdgeInsets.all(10),
                    decoration: InputDecoration(
                      //contentPadding: EdgeInsets.all(20),
                      hintText: "Enter your phone number",
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
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    print("token of user\n");
                    print("token at call mehedi hasan who are you: " + USERTOKEN);
                    DoctorResetPasswordModel passChange = DoctorResetPasswordModel(mobile: _textMobile.text);

                    DoctorResetPasswordController.requestThenResponsePrint(passChange ).then((value) {
                      print('dddddddd');
                      print(value.statusCode);
                      if (value.statusCode == 200) {
                        print("successfully done");
                        SnackbarDialogueHelper().showSnackbarDialog(context, value.body, Colors.green);
                        return  Navigator.push(context,MaterialPageRoute(builder: (context) => SingInPage()),);
                      }else{
                        SnackbarDialogueHelper().showSnackbarDialog(context, value.body, Colors.red);

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
            // SizedBox(
            //   height: 20,
            // ),

          ],
        ),
      ),
    );
  }

}
