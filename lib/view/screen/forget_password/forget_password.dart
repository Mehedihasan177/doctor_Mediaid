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
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _textMobile = TextEditingController();
  TextEditingController _textPassword = TextEditingController();
  String countryCode = '+880';
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
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [

            Center(
              child: Image(
                height: 250,
                width: 250,
                image: AssetImage("images/care_plus_doctor_logo.png",),
                fit: BoxFit.fill,
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
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TextField(
                      controller: _textMobile,
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
                    if(_textMobile == null){
                      SnackbarDialogueHelper().showSnackbarDialog(context, "please enter valid mobile number", Colors.red);
                    }else {
                      print("token of user\n");
                      print("token at call mehedi hasan who are you: " + USERTOKEN);
                      DoctorResetPasswordModel passChange = DoctorResetPasswordModel(mobile: countryCode + _textMobile.text);

                      DoctorResetPasswordController.requestThenResponsePrint(passChange ).then((value) {
                        print('dddddddd');
                        print(value.statusCode);
                        if (value.statusCode == 200) {
                          print("successfully done");
                          SnackbarDialogueHelper().showSnackbarDialog(context, value.body, Colors.green);
                          return  Navigator.push(context,MaterialPageRoute(builder: (context) => SingInPage()),);
                        }else{
                          SnackbarDialogueHelper().showSnackbarDialog(context, "please enter valid mobile number", Colors.red);

                          // BasicFunctions.showAlertDialogTOView(context,
                          //     AppLocalizations.of(context).translate("passwordRecheckTitle"),
                          //     AppLocalizations.of(context).translate("passwordRecheckMessage"));
                          // BasicFunctions.showAlertDialogTOView(context, "Warning", "Please recheck your passwords to change");
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

          ],
        ),
      ),
    );
  }

}
