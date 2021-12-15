import 'package:care_plus_doctor/view/screen/care_plus_lab_report_list/care_plus_lab_report_list.dart';
import 'package:care_plus_doctor/view/screen/patient_profile_details/patient_profile_details.dart';
import 'package:care_plus_doctor/view/screen/problem_page/problem_page.dart';
import 'package:flutter/material.dart';

Widget Appointment_List(
        String image, String name, String reason, String date, String time , context) =>
    GestureDetector(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  image,
                  height: 90,
                  width: 90,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(name),
                        ),
                        Row(
                          children: [
                            PopupMenuButton(
                              itemBuilder: (_) => <PopupMenuEntry>[
                                const PopupMenuItem(
                                  child: Text('Reshedule'),
                                  value: 'hot',
                                ),
                                const PopupMenuItem(
                                  child: Text('Set Reminder'),
                                ),
                                const PopupMenuItem(
                                  child: Text('Health History'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 20,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(reason),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(date)),
                          Text(" | "),
                          Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(time)),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              height: 35,
                              width: 35,
                              child: IconButton(
                                icon: ImageIcon(
                                  AssetImage("images/prescription.png"),
                                ),
                                iconSize: 30,
                                color: Color(0xFF1CBFA8),
                                splashColor: Color(0xFF1CBFA8),
                                onPressed: () {
                                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProblemPage()));
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            child: IconButton(
                              icon: Icon(
                                Icons.call,
                              ),
                              iconSize: 20,
                              color: Color(0xFF1CBFA8),
                              splashColor: Color(0xFF1CBFA8),
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 35,
                            child: IconButton(
                              icon: ImageIcon(
                                AssetImage("images/test_results.png"),
                              ),
                              iconSize: 18,
                              color: Color(0xFF1CBFA8),
                              splashColor: Color(0xFF1CBFA8),
                              onPressed: () {
                                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => CarePlusLabReportList()));

                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => PatientProfileDetailsPage(mobile: '', gender: '', name: '', email: '', status: '', address: '',
          image: '', height: '', district: '', medicare_no: '', weight: '', reschedule: '', appointment_for: '', rescheduleDate: '',)));      },
    );
