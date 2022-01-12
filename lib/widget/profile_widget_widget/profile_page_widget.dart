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
                  ///circle image
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            DOCTOR_INITIAL.image.toString()=='null'?
                            avatarLink:'$apiDomainRoot/images/${DOCTOR_INITIAL.image}',                     ),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  // Container(
                  //   height: 80,
                  //   width: 80,
                  //   child: ClipRRect(
                  //     child: Image.network(
                  //       '$apiDomainRoot/images/${DOCTOR_INITIAL.image}',
                  //       height: 70,
                  //       width: 70,
                  //     ),
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 49),
                              alignment: Alignment.centerLeft,
                              child: Text(DOCTOR_INITIAL.name)),
                          SizedBox(
                            height: 5,
                          ),

                            Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("AHPRA_ID: ")),
                                //SizedBox(width: 5),
                                Text(DOCTOR_INITIAL.bmdcReg.toString()),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyProfile()));
                },
              ),
            ),
          ],
        ),
      ),
    );
