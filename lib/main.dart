import 'package:care_plus_doctor/testing_star.dart';
import 'package:care_plus_doctor/view/screen/add_hospital/add_hospital.dart';
import 'package:care_plus_doctor/view/screen/add_services/add_services.dart';
import 'package:care_plus_doctor/view/screen/splash_screen/splash_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(),
        //body: AddHospitalPage(),
        //body: AddServicesPage(),
        // body: TestingStar(),
      ),
    );
  }
}
