import 'package:care_plus_doctor/model/ui_model/patient_profile_details_model/patient_profile_details_model.dart';
import 'package:care_plus_doctor/view/screen/care_plus_lab_report_list/care_plus_lab_report_list.dart';
import 'package:care_plus_doctor/view/screen/health_record/health_record.dart';
import 'package:care_plus_doctor/view/screen/patient_profile_details/patient_profile_details.dart';
import 'package:care_plus_doctor/view/screen/problem_page/problem_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Widget PatientProfileWidget(PatientProfileDetailsModel patientProfileDetail, BuildContext context) =>
    Container(
      child: Column(
        children: [
          Text("Patient Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black.withOpacity(0.5)
          ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 20),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      patientProfileDetail.image,
                      height: 80,
                      width: 80,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  patientProfileDetail.name,
                                  style: TextStyle(
                                      color: Color(0xff1CBFA8),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 140),
                                child: Text(
                                  patientProfileDetail.fee,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 17,
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              height: 22,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            patientProfileDetail
                                                .gender,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child:
                                      Text("Height: " +patientProfileDetail.height)),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child:
                                    Text("Weight: "+patientProfileDetail.weight.toString())),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Stack(
            children: [
              designPortion(),
              designPortion1(),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40, left: 20),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                ),
                                child: Center(
                                    child:
                                        Icon(Icons.calendar_today_rounded, color: Colors.black.withOpacity(0.3),)
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 40),
                                  child: Text(
                                    "Appointment date and time",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        patientProfileDetail
                                            .date,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        patientProfileDetail
                                            .time,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 90, left: 30),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Appointment Purpose",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            patientProfileDetail.about_appointment_purpose,
                            textAlign: TextAlign.justify,
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                        ),
                      ],
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 30, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Appointment Status",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        Text("Investigating",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.orange.withOpacity(0.9),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),




                  //icon gula ekbare niche namate hobe.
                 Padding(
                   padding: const EdgeInsets.only(top: 60, right: 20),
                   child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                height: 45,
                                width: 120,
                                child: FlatButton(
                                  //minWidth: 10,
                                  onPressed: () {
                                    // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AppointmentListToday()));
                                  },
                                  child: Column(
                                    children: [
                                      Icon(Icons.call, color: Color(0xFF1CBFA8),size: 25,),

                                      Text(
                                          "Call",
                                          style:
                                          TextStyle(color: Colors.black.withOpacity(0.5))
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                    height: 45,
                                    width: 120,
                                    child: FlatButton(
                                      //minWidth: 10,
                                      onPressed: () {
                                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => CarePlusLabReportList()));
                                      },
                                      child: Column(
                                        children: [
                                      ImageIcon(
                                          AssetImage("images/test_results.png"),
                                        color: Color(0xFF1CBFA8),
                                        ),

                                          Text(
                                              "Lab Report",
                                              style:
                                              TextStyle(color: Colors.black.withOpacity(0.5))
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                height: 45,
                                width: 120,
                                child: FlatButton(
                                  //minWidth: 10,
                                  onPressed: () {
                                     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProblemPage()));
                                  },
                                  child: Column(
                                    children: [
                                      ImageIcon(
                                        AssetImage("images/prescription.png"),
                                        color: Color(0xFF1CBFA8),
                                      ),

                                      Text(
                                          "Prescription",
                                          style:
                                          TextStyle(color: Colors.black.withOpacity(0.5))
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                 ),



                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: ElevatedButton(
                      child: Text(
                        "Health Records",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () async {
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HealthRecord()));
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

                ],
              ),
            ],
          ),
        ],
      ),
    );
