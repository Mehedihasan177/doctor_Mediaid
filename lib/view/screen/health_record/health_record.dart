import 'dart:convert';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/constents/prescription_constants.dart';
import 'package:care_plus_doctor/controller/others/viewUserHealthHistory.dart';
import 'package:care_plus_doctor/data/health_history/health_history_data.dart';
import 'package:care_plus_doctor/model/health_histoy/health_history_model.dart';
import 'package:care_plus_doctor/responses/others/userHealthHistory.dart';
import 'package:care_plus_doctor/view/screen/patient_profile_details/patient_profile_details.dart';
import 'package:care_plus_doctor/widget/health_history_ui_widget/health_history_widget_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HealthRecord extends StatefulWidget {
  const HealthRecord({Key? key}) : super(key: key);

  @override
  _HealthRecordState createState() => _HealthRecordState();
}

class _HealthRecordState extends State<HealthRecord> {
  List<Health_History> health_history = [];

  @override
  void initState() {
    // TODO: implement initState
    getPatientHealthHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        // Navigator.push(context,MaterialPageRoute(builder: (context) => PatientProfileDetailsPage(mobile: '', gender: '', name: '', email: '', status: '', address: '',
        //   image: '', height: '', district: '', medicare_no: '', weight: '', reschedule: '', appointment_for: '', rescheduleDate: '',)));
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
                      size: 25,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    splashColor: Colors.transparent,
                    onPressed: () {
                      // Navigator.push(context,MaterialPageRoute(builder: (context) => PatientProfileDetailsPage(mobile: '', gender: '', name: '', email: '', status: '', address: '',
                      //   image: '', height: '', district: '', medicare_no: '', weight: '', reschedule: '', appointment_for: '', rescheduleDate: '',)));
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Text(
                        "Health Record",
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

            Container(
              height: 750,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: health_history.length,
                  itemBuilder: (context, index) {
                    return Health_History_List(health_history[index],context);


                  }
                  ),

            ),
          ],
        ),
      ),
    );
  }

  void getPatientHealthHistory() {
    health_history.clear();
    DocViewUserHistory.requestThenResponsePrint(currentPatientID).then((value){
      print(value.statusCode);
      print(value.body);

      var myvar = UserHealthHistory.fromJson(jsonDecode(value.body));
      print(myvar);

      myvar.epres.forEach((element) {
        setState(() {
          print(element.doctor.name);
          health_history.add(Health_History(
              name: element.doctor.name,lab_report_type: 'Care+ Prescription',time: DateFormat('hh:mm a').format(element.createdAt),date: DateFormat('dd MMM yyyy').format(element.createdAt), image: '$apiDomainRoot/images/${element.doctor.image.toString()}',id: element.id.toString()
          ));


        });
      });

      myvar.report.forEach((element) {
        setState(() {
          print(element.name);
          health_history.add(Health_History(
            name: element.name,lab_report_type: element.type,time: DateFormat('hh:mm a').format(element.createdAt),date: DateFormat('dd MMM yyyy').format(element.createdAt), image: '$apiDomainRoot/files/${element.file.toString()}', id: element.id.toString()
          ));


        });
      });


    });

  }
}

