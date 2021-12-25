import 'package:care_plus_doctor/view/screen/change_password/change_password.dart';
import 'package:care_plus_doctor/view/screen/change_password_successfully/change_password_successfully.dart';
import 'package:flutter/material.dart';

class OTPThree extends StatefulWidget {
  const OTPThree({Key? key}) : super(key: key);

  @override
  _OTPThreeState createState() => _OTPThreeState();
}

class _OTPThreeState extends State<OTPThree> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        //Navigator.push(context,MaterialPageRoute(builder: (context) => ChangePassword()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          children: [
            Column(
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
                Padding(
                  padding: const EdgeInsets.only(left: 90, right: 90, top: 150),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("images/mobile_security.png",
                        height: 20,
                        width: 20,
                      ),
                      Text("OTP"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Padding(
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
                      onPressed: () async {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => ChangePasswordSuccessfully()));
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
          ],
        ),
      ),
    );
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
