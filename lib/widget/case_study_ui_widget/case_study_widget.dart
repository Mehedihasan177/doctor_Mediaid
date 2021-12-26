import 'package:care_plus_doctor/constents/prescription_constants.dart';
import 'package:care_plus_doctor/model/ui_model/case_study_model/case_study_model.dart';
import 'package:care_plus_doctor/view/screen/health_record/health_record.dart';
import 'package:flutter/material.dart';

Widget Case_Study(CaseStudymodel case_study, BuildContext context) => Card(
  child: Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: Container(
          height: 70,width: 70,
            child: Image.network(case_study.image,

              height: 70,
              width: 70,
            ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                    case_study.name
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                    case_study.lab_report_type
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_rounded,
                    color: Colors.black.withOpacity(0.5),
                    size: 15,
                  ),
                  SizedBox(width: 5,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                        case_study.date
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                        case_study.time
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          // height: MediaQuery.of(context).size.height * 0.07,
          // width: MediaQuery.of(context).size.width * 0.9,
          //color: Color(0xF60D72),
          child: GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             CardDemo(Health_History[index])));
            },
            child: ElevatedButton(

              child: Text(
                "View",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: () async {
                // Navigator.push(context,MaterialPageRoute(builder: (context) => Otp()));

                currentPatientID = '';
                currentPatientID = case_study.id.toString();
                Navigator.push(context,MaterialPageRoute(builder: (context) => HealthRecord()));

              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(0, 25),
                // maximumSize: const Size(50, 25),
                primary: Color(0xFF1CBFA8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
            ),
          ),
          // decoration: BoxDecoration(
          //   //color: Color(0xF60D72),
          //     borderRadius: BorderRadius.circular(18)),
        ),
      ),
    ],
  ),
);