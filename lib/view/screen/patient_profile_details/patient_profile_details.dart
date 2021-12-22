import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/constents/prescription_constants.dart';
import 'package:care_plus_doctor/data/patient_profile_details_data/patient_profile_details_data.dart';
import 'package:care_plus_doctor/model/ui_model/patient_profile_details_model/patient_profile_details_model.dart';
import 'package:care_plus_doctor/view/screen/care_plus_lab_report_list/care_plus_lab_report_list.dart';
import 'package:care_plus_doctor/view/screen/health_record/health_record.dart';
import 'package:care_plus_doctor/view/screen/lib/pages/call_page.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/problem_page/problem_page.dart';
import 'package:care_plus_doctor/widget/patient_profile_widget/patient_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PatientProfileDetailsPage extends StatefulWidget {
  final String name, gender, email, mobile, address, status, image, id, appointment_for, rescheduleDate, district, height,
  weight, medicare_no;

  const PatientProfileDetailsPage({Key? key,
    required this.image, required this.name, required this.gender, required this.email, required this.height,
    required this.weight, required this.mobile, required this.medicare_no, required this.address,
    required this.status, required this.district, required this.appointment_for, required this.rescheduleDate, required this.id}) : super(key: key);

  @override
  _PatientProfileDetailsPageState createState() => _PatientProfileDetailsPageState();
}

class _PatientProfileDetailsPageState extends State<PatientProfileDetailsPage> {
  List<PatientProfileDetailsModel> patientProfileDetails = List.of(patient_profile_details_data);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
          //shrinkWrap: true,
          children: [
            SizedBox(
              height: 40,
            ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("Patient Profile",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.5)
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
            Card(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        width: 130.0,
                        height: 130.0,
                        child: Image.network(
                          "$apiDomainRoot/images/${widget.image}",
                          fit: BoxFit.fill,


                        ),
                      ),
                    ),),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(

                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text("${widget.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text("${"Gender: "+widget.gender}",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Height: "+"${widget.height}",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14),)),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text("${"Weight: "+widget.weight}",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14),)),
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ],
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
                                                widget.rescheduleDate.replaceAll("null", "0"),
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



                          ///appointment for
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
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.appointment_for.replaceAll("null", "Haven't any details"),
                                      textAlign: TextAlign.justify,
                                      style:
                                      TextStyle(color: Colors.black.withOpacity(0.5)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),



                          ///medicare no
                          Padding(
                            padding: EdgeInsets.only(top: 20, left: 30),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Medicare No: ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.medicare_no.replaceAll("null", "Haven't any medicare no."),
                                      textAlign: TextAlign.justify,
                                      style:
                                      TextStyle(color: Colors.black.withOpacity(0.5)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ///address
                          Padding(
                            padding: EdgeInsets.only(top: 20, left: 30),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Address",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.address.replaceAll("null", "Haven't any address"),
                                      textAlign: TextAlign.justify,
                                      style:
                                      TextStyle(color: Colors.black.withOpacity(0.5)),
                                    ),
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
                                Column(
                                  children: [
                                    Text("Appointment Status",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black.withOpacity(0.5),
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(widget.status.replaceAll('1', 'Active').replaceAll('7', 'Emergency'),
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.orange.withOpacity(0.9),
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
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
                                      onPressed: () async {
                                        String channelName = "abcdefg";
                                        if (channelName.isNotEmpty) {
                                          // await for camera and mic permissions before pushing video page
                                          //await _handleCameraAndMic();
                                          await _handleCameraAndMic(Permission.camera);
                                          await _handleCameraAndMic(Permission.microphone);
                                          // push video page with given channel name
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => CallPage(channelName),//testing
                                            ),
                                          );
                                        }
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
                                    // width: 120,
                                    child: FlatButton(
                                      //minWidth: 10,
                                      onPressed: () {
                                        Navigator.push(context,MaterialPageRoute(builder: (context) => HealthRecord()));
                                      },
                                      child: Column(
                                        children: [
                                          ImageIcon(
                                            AssetImage("images/test_results.png"),
                                            color: Color(0xFF1CBFA8),
                                          ),

                                          Text(
                                              "Health Records",
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

                                        appointmentSheduleId = '';
                                        appointmentFor = '';
                                        advicef = '';
                                        cc = '';
                                        oe = '';
                                        rx = '';

                                        appointmentSheduleId = widget.id.toString();
                                        appointmentFor = widget.appointment_for.toString();

                                        Navigator.push(context,MaterialPageRoute(builder: (context) => ProblemPage()));
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




                        ],
                      ),
                    ],
                  ),

          ],
        ),
      ),
    );
  }
  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
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
