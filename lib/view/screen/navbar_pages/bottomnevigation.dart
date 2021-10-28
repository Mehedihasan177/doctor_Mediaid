import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:care_plus_doctor/view/screen/appointmnet_list/appointment_list_ui.dart';
import 'package:care_plus_doctor/view/screen/case_study_ui/case_study_ui.dart';
import 'package:care_plus_doctor/view/screen/profile/profile.dart';
import 'package:care_plus_doctor/view/screen/reviewUI/reviewUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNevigation extends StatefulWidget {
  @override
  _BottomNevigationState createState() => _BottomNevigationState();
}

class _BottomNevigationState extends State<BottomNevigation> {
  int cindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: buildpages(),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: cindex,
          containerHeight: 50,
          onItemSelected: (index) => setState(() => cindex = index),
          items: [
            BottomNavyBarItem(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Review',
                    style: TextStyle(color: Color(0xFF1CBFA8)),
                  ),
                ),
                icon: Container(
                  height: 25,
                  width: 25,
                  child: Image.asset("images/rating.png"),
                ),
                textAlign: TextAlign.center,
                activeColor: Color(0xFF1CBFA8),
                inactiveColor: Color(0xFF1CBFA8)),
            BottomNavyBarItem(
                title: Text(
                  'Appointment',
                  style: TextStyle(color: Color(0xFF1CBFA8)),
                ),
                icon: Container(
                  height: 28,
                  width: 28,
                  child: Image.asset("images/appointment_nav_bar.png"),
                ),
                textAlign: TextAlign.center,
                activeColor: Color(0xFF1CBFA8),
                inactiveColor: Color(0xFF1CBFA8)),
            BottomNavyBarItem(
                title: Text(
                  'Doctors',
                  style: TextStyle(color: Color(0xFF1CBFA8)),
                ),
                icon: Container(
                  height: 28,
                  width: 28,
                  child: Image.asset("images/case-study.png"),
                ),
                textAlign: TextAlign.center,
                activeColor: Color(0xFF1CBFA8),
                inactiveColor: Color(0xFF1CBFA8),
            ),
            BottomNavyBarItem(
                title: Text(
                  'Profile',
                  style: TextStyle(color: Color(0xFF1CBFA8)),
                ),
                icon: Container(
                  height: 28,
                  width: 28,
                  child: Icon(Icons.person),
                ),
                textAlign: TextAlign.center,
                activeColor: Color(0xFF1CBFA8),
                inactiveColor: Color(0xFF1CBFA8)),
          ],
        ));
  }

  buildpages() {
    switch (cindex) {
      case 0:
        return ReviewUiPage();
      case 1:
        return AppointmentList();
      case 2:
        return CaseStudyNavBar();
      case 3:
        return ProfilePage();
    }
  }

  // bottomNavigationBar() {
  //
  //   final inactiveColor = Colors.red;
  //   return
  // }
}
