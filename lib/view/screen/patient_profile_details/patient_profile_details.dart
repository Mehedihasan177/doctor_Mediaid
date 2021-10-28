import 'package:care_plus_doctor/data/patient_profile_details_data/patient_profile_details_data.dart';
import 'package:care_plus_doctor/model/ui_model/patient_profile_details_model/patient_profile_details_model.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/widget/patient_profile_widget/patient_profile_widget.dart';
import 'package:flutter/material.dart';

class PatientProfileDetailsPage extends StatefulWidget {
  const PatientProfileDetailsPage({Key? key}) : super(key: key);

  @override
  _PatientProfileDetailsPageState createState() => _PatientProfileDetailsPageState();
}

class _PatientProfileDetailsPageState extends State<PatientProfileDetailsPage> {
  List<PatientProfileDetailsModel> patientProfileDetails = List.of(patient_profile_details_data);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
          shrinkWrap: true,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 20),
            //   child: Row(
            //     children: [
            //       FlatButton(
            //         child: Icon(
            //           Icons.arrow_back_ios,
            //           size: 30,
            //           color: Colors.black.withOpacity(0.5),
            //         ),
            //         splashColor: Colors.transparent,
            //         onPressed: () {},
            //       ),
            //       Text("About Doctor",
            //         style: TextStyle(
            //           fontSize: 23,
            //           color: Colors.black.withOpacity(0.5),
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    height: 750,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        //controller: PageController(viewportFraction: 0.3),
                        scrollDirection: Axis.vertical,
                        itemCount: patientProfileDetails.length,
                        itemBuilder: (context,index) {
                          //var information = carePlushPrescriptionList[index];
                          return PatientProfileWidget(
                              patientProfileDetails[index],
                              context);

                        }
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




designPortion() => Row(
  children: [
    Flexible(
      child: Container(
        height: 550,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff1CBFA8),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(63),
            topRight: Radius.circular(63),
          ),
        ),
      ),
    ),
  ],
);

designPortion1() => Row(
  children: [
    Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 120),
        child: Container(
          height: 550,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(63),
              topRight: Radius.circular(63),
            ),
          ),
        ),
      ),
    ),
  ],
);
