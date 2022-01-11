
import 'dart:async';

import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/signInPage/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../intro_screens.dart';
// import 'package:havartye/screen/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   late String finalMobile = '';
  late String finalPassword = '';
var obtainedMobile;
   var obtainedPassword;
  @override
  void initState() {
    // TODO: implement initState
    getValidationData().whenComplete(() async {
      Timer(
          Duration(seconds: 3),
              () =>Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => finalMobile == null && finalPassword == null
                  ? OnBoardingPage()
                  : SingInPage())));


    });
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    obtainedMobile = sharedPreferences.getString("mobile");
    obtainedPassword = sharedPreferences.getString("password");

    setState(() {
      finalMobile = obtainedMobile;
      finalPassword = obtainedPassword;
    });
    print(finalMobile);
    print(finalPassword);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        children: <Widget>[
          // new Center(
          //   child: new Text("Hello background", style: TextStyle(color: Colors.white,fontSize: 20),),
          // ),
          Center(
            child: Container(
              child: Image(image: AssetImage("images/doctor_gif.gif"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
