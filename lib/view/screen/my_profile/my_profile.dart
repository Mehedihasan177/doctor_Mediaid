import 'package:care_plus_doctor/data/my_profile_data/my_profile_data.dart';
import 'package:care_plus_doctor/model/ui_model/my_profile_model/my_profile_dropdown.dart';
import 'package:care_plus_doctor/model/ui_model/my_profile_model/my_profile_model.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/widget/my_profile_widget/my_profile_widget.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  List<MyProfileModel> myProfile = List.of(myProfileData);


  final notifications = [
    CheckBoxAny(title: 'Show Message'),
    CheckBoxAny(title: 'Show Group'),
    CheckBoxAny(title: 'Show Calling'),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  FlatButton(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    splashColor: Colors.transparent,
                    onPressed: () {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Text(
                        "My Profile",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Row(
              children: [
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    // height: 750,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
                        shrinkWrap: true,
                        //controller: PageController(viewportFraction: 0.3),
                        scrollDirection: Axis.vertical,
                        itemCount: myProfile.length,
                        itemBuilder: (context,index) {
                          return MyProfileWidget(myProfile[index], context);
                        }
                    ),
                  ),
                ),
              ],
            ),




            // SizedBox(height: 30,),

            // Center(
            //   child: Container(
            //     child: ElevatedButton(
            //       child: Text(
            //         "Update",
            //         style: TextStyle(color: Colors.white, fontSize: 20),
            //       ),
            //       onPressed: () async {
            //         Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
            //       },
            //       style: ElevatedButton.styleFrom(
            //         minimumSize: const Size(350, 59),
            //         maximumSize: const Size(350, 59),
            //         primary: Color(0xFF1CBFA8),
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(15)),
            //       ),
            //     ),
            //     decoration: BoxDecoration(
            //       //color: Color(0xF60D72),
            //         borderRadius: BorderRadius.circular(18)),
            //   ),
            // ),

            // SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}


