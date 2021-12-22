import 'package:care_plus_doctor/testing_star.dart';
import 'package:care_plus_doctor/view/screen/add_hospital/add_hospital.dart';
import 'package:care_plus_doctor/view/screen/add_services/add_services.dart';
import 'package:care_plus_doctor/view/screen/lib/index.dart';
import 'package:care_plus_doctor/view/screen/splash_screen/splash_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        // body: DropDown(),
        //body: AddHospitalPage(),
        //body: AddServicesPage(),
        // body: TestingStar(),
      ),
    );
  }
}
