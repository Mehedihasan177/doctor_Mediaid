import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/model/ui_model/my_profile_model/my_profile_model.dart';
import 'package:care_plus_doctor/model/ui_model/profile_model/profile_model.dart';
import 'package:care_plus_doctor/view/screen/my_profile/my_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Profile_Page(MyProfileModel myProfile, BuildContext context) => Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    child: ClipRRect(
                      child: Image.network(
                        '$apiDomainRoot/images/${DOCTOR_INITIAL.image}',
                        height: 70,
                        width: 70,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 49),
                              alignment: Alignment.centerLeft,
                              child: Text(myProfile.name)),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text("AHPRA_ID: "),
                              SizedBox(width: 5),
                              Text(myProfile.bmdcReg.toString()),
                            ],
                          ),
                        ],
                      ),
                  ),

                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Image.asset('images/edit_icon.png'),
                iconSize: 30,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MyProfile()));
                },
              ),
            ),
          ],
        ),
      ),
    );

//     Card(
//       child: Row(
//   children: [
//       Padding(
//         padding: const EdgeInsets.only(left: 30),
//         child: Expanded(
//           child: CircleAvatar(
//             radius: 40.0,
//             foregroundImage: AssetImage(profile_model.image,
//             ),
//           )
//         ),
//       ),
//       Expanded(
//         child: Column(
//           children: [
//
//             Padding(
//               padding: const EdgeInsets.only(left: 30),
//               child: Container(
//                 alignment: Alignment.centerLeft,
//                 child: Text(profile_model.name),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 30),
//                   child: Image.asset("images/emergency_number.png"),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Container(
//                     alignment: Alignment.topLeft,
//                     child: Text("6959 14235 9"),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       // FlatButton(
//       //     onPressed: (){},
//       //   Image(
//       //   AssetImage("images/emergency_number.png"),
//       //   // color: Color(0xFF3A5A98),
//       // ),
//       // )
//       Container(
//         alignment: Alignment.topRight,
//         child: IconButton(
//           icon: Image.asset('images/edit_icon.png'),
//           iconSize: 30,
//           onPressed: () {
//             Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => UpdateProfile()));
//           },
//         ),
//       )
//   ],
// ),
//     );
