import 'package:care_plus_doctor/data/health_history/health_history_data.dart';
import 'package:care_plus_doctor/model/health_histoy/health_history_model.dart';
import 'package:care_plus_doctor/view/screen/patient_profile_details/patient_profile_details.dart';
import 'package:care_plus_doctor/widget/health_history_ui_widget/health_history_widget_widget.dart';
import 'package:flutter/material.dart';

class HealthRecord extends StatefulWidget {
  const HealthRecord({Key? key}) : super(key: key);

  @override
  _HealthRecordState createState() => _HealthRecordState();
}

class _HealthRecordState extends State<HealthRecord> {
  List<Health_History> health_history = List.of(healthHistory);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => PatientProfileDetailsPage()));
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatientProfileDetailsPage()));
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
                    return Health_History_List(health_history[index]);


                  }
                  ),

            ),
          ],
        ),
      ),
    );
  }
}
