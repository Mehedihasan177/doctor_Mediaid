
import 'package:care_plus_doctor/view/screen/signInPage/sign_in_page.dart';
import 'package:flutter/material.dart';
// import 'package:havartye/screen/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getValidationData();
    super.initState();
  }

  Future getValidationData() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SingInPage()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          // new Center(
          //   child: new Text("Hello background", style: TextStyle(color: Colors.white,fontSize: 20),),
          // ),
          Center(
            child: Container(
              child: Image(image: AssetImage("images/care_plus_doctor_logo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
