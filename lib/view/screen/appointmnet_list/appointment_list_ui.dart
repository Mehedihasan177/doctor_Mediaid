import 'dart:convert';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/constents/prescription_constants.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_appointment_cencel_controller.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_appointment_done_controller.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_appointment_history_controller.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_appointment_schedule_index_controller.dart';
import 'package:care_plus_doctor/data/appointment_list_navbar/appointment_history_data.dart';
import 'package:care_plus_doctor/data/appointment_list_navbar/appointment_list_navbar_data.dart';
import 'package:care_plus_doctor/helper/snackbarDialouge.dart';
import 'package:care_plus_doctor/model/ui_model/appointment_list_navBar/appointment_history_navBar.dart';
import 'package:care_plus_doctor/model/ui_model/appointment_list_navBar/appointment_list_navBar.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_appointment_history_responses.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_appointment_schedule_index_responses.dart';
import 'package:care_plus_doctor/services/firebase_services.dart';
import 'package:care_plus_doctor/view/screen/appointmnet_list/appointment_list_today/appointment_list_today.dart';
import 'package:care_plus_doctor/view/screen/appointmnet_list/appointment_ui_tomorrow/appointment_ui_tomorrow.dart';
import 'package:care_plus_doctor/view/screen/care_plus_lab_report_list/care_plus_lab_report_list.dart';
import 'package:care_plus_doctor/view/screen/health_record/health_record.dart';
import 'package:care_plus_doctor/view/screen/lib/pages/call_page.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/notificaitonUi/notificaitonUi.dart';
import 'package:care_plus_doctor/view/screen/patient_profile_details/patient_profile_details.dart';
import 'package:care_plus_doctor/view/screen/problem_page/problem_page.dart';

import 'package:care_plus_doctor/widget/appointment_list_navBar_widget/appintment_List_navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({Key? key}) : super(key: key);

  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  List<Appointment_list_navBar> appointmentlist = List.of(appointmentList);
  List<Appointment_History_navBar> appointmentHistoy =
      List.of(appointmentHistory);


  late DateTime date;
  final initialDate = DateTime.now();
  Future pickDate(BuildContext context) async {

    final newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(221),
      lastDate: DateTime(2050),
    );

    if (newDate == null) return;
    // else setState(() =>
    //     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AppointmentListToday())),
    // );

  }



  List<DoctorAppointmentHistoryResponseElement> doctorAppointmentHistory= [];


  _getAppointmentHistory() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();


    DoctorAppointmentHistoryController.requestThenResponsePrint(USERTOKEN).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable AppointmentHistory = decoded['data'];
        print(decoded['data']);
        doctorAppointmentHistory =
            AppointmentHistory.map((model) => DoctorAppointmentHistoryResponseElement.fromJson(model)).toList();
        print(doctorAppointmentHistory);

      });
    });
  }
  @override
  void initState() {
    _getAppointmentHistory();
    super.initState();
  }




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

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 50, top: 20),
                    child: Text(
                      "Appointments",
                      style:
                      TextStyle(fontSize: 25, color: Colors.black.withOpacity(0.5)),
                    ),
                  ),

                Container(
                  height: 30,
                  width: 30,
                  child: IconButton(
                    icon: Icon(
                      Icons.watch_later_outlined,
                    ),
                    iconSize: 25,
                    color: Color(0xFF1CBFA8),
                    splashColor: Color(0xFF1CBFA8),
                    onPressed: () {
                      pickDate(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 10),
                  child: Container(

                    height: 30,
                    width: 30,
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications_on_outlined,
                      ),
                      iconSize: 25,
                      color: Color(0xFF1CBFA8),
                      splashColor: Color(0xFF1CBFA8),
                      onPressed: () {
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => NotificationPage()));
                      },
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Next",
                      style:
                          TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.5)),
                    ),

                  FlatButton(
                    minWidth: 10,
                    onPressed: () {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AppointmentListToday()));
                    },
                    child: Text(
                      "See All",
                        style:
                        TextStyle(color: Colors.black.withOpacity(0.5))
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // height: 400,
              // color: Colors.red,
              child: ListView.builder(
                  physics:
                      NeverScrollableScrollPhysics(), // <-- this will disable scroll
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: doctorAppointmentHistory.length,
                  itemBuilder: (BuildContext context, int index) {
                    // return buildDoctorAppointmentHistoryTile(doctorAppointmentHistory[index],index);

                    if((doctorAppointmentHistory[index].active.toString()!='0')&&(doctorAppointmentHistory[index].consult=='0')){
                      return buildDoctorAppointmentHistoryTile(doctorAppointmentHistory[index],index);
                    }else{
                      return Container();
                    }



                    // return index<3 ? buildDoctorAppointmentHistoryTile(
                    //     doctorAppointmentHistory[index]):Container();
                  }
                  ),
            ),
            SizedBox(
              height: 10,
            ),

          ],
        ),
      ),
    );
  }
  // $apiDomainRoot/images/${doctorAppointmentHistory.user.image}
  Widget buildDoctorAppointmentHistoryTile(DoctorAppointmentHistoryResponseElement doctorAppointmentHistory,int index) =>
      GestureDetector(
        child: Card(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    width: 90.0,
                    height: 90.0,
                    child: Image.network(
                      "$apiDomainRoot/images/${doctorAppointmentHistory.user.image}",
                    ),
                  ),
                ),),
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(doctorAppointmentHistory.user.name),
                            ),
                        ),
                        Row(
                          children: [

                            PopupMenuButton(
                              offset: Offset(-2.5, 0),
                              onSelected: (result) {
                                if (result == 0) {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => CarePlusPrescriptionsList()),
                                  // );
                                }
                                else if(result == 1) {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => CarePlusLabReportList()),
                                  // );
                                }
                                else{
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => UploadedReports()),
                                  // );
                                }
                              },
                              itemBuilder: (_) => <PopupMenuEntry>[
                                PopupMenuItem(
                                  child: ListTile(
                                    leading: Icon(Icons.cancel),
                                    title:  const Align(
                                      child: Text("Cancel"),
                                      alignment: Alignment(-1.4, 0),
                                    ),
                                    onTap: (){
                                      print(doctorAppointmentHistory.id.toString());
                                      print(doctorAppointmentHistory.user.id.toString());
                                      print(doctorAppointmentHistory.doctorId.toString());
                                      print(doctorAppointmentHistory.appointmentSlotId.toString());
                                      cancelThisAppointment(doctorAppointmentHistory.id.toString(),index);
                                    },
                                  ),
                                  value: 0,
                                ),
                                // const PopupMenuItem(
                                //   child: ListTile(
                                //     leading: Icon(Icons.note_add_outlined),
                                //     title:  Align(
                                //       child: Text("Lab Suggestions"),
                                //       alignment: Alignment(-2.5, 0),
                                //     ),
                                //   ),
                                //   value: 1,
                                // ),
                                PopupMenuItem(
                                  child: ListTile(
                                    leading: Icon(Icons.done),
                                    title:  Align(
                                      child: Text("Complete"),
                                      alignment: Alignment(-1.5, 0),
                                    ),
                                    onTap: (){
                                      print(doctorAppointmentHistory.id.toString());
                                      print(doctorAppointmentHistory.user.id.toString());
                                      print(doctorAppointmentHistory.doctorId.toString());
                                      print(doctorAppointmentHistory.appointmentSlotId.toString());
                                      completeThisAppointment(doctorAppointmentHistory.id.toString(),index);
                                    },
                                  ),
                                  value: 2,
                                ),
                              ],

                            )
                          ],
                        ),
                      ],
                    ),

                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 10, bottom: 10),
                        child: Text(DateFormat('dd MMM yyyy || hh:mm a').format(doctorAppointmentHistory.date))
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 10, bottom: 20),
                              child: Text('male'),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 6),
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

                                appointmentSheduleId = '';
                                currentPatientID = '';
                                appointmentFor = '';
                                advicef = '';
                                cc = '';
                                oe = '';
                                rx = '';
                                appointmentSheduleId = doctorAppointmentHistory.id.toString();
                                currentPatientID = doctorAppointmentHistory.user.id.toString();
                                appointmentFor = doctorAppointmentHistory.appointmentFor.toString();

                                Navigator.push(context,MaterialPageRoute(builder: (context) => ProblemPage()));
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Container(
                            height: 30,
                            width: 30,
                            child: IconButton(
                              icon: Icon(
                                Icons.call,
                              ),
                              iconSize: 20,
                              color: Color(0xFF1CBFA8),
                              splashColor: Color(0xFF1CBFA8),
                              onPressed: () async {

                                setCallData(doctorAppointmentHistory);


                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Container(
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

                                appointmentSheduleId = '';
                                currentPatientID = '';
                                appointmentFor = '';
                                advicef = '';
                                cc = '';
                                oe = '';
                                rx = '';
                                appointmentSheduleId = doctorAppointmentHistory.id.toString();
                                currentPatientID = doctorAppointmentHistory.user.id.toString();
                                appointmentFor = doctorAppointmentHistory.appointmentFor.toString();
                                Navigator.push(context,MaterialPageRoute(builder: (context) => HealthRecord()));
                              },
                            ),
                          ),
                        ),


                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

        ),
        onTap: () {


          appointmentSheduleId = '';
          currentPatientID = '';
          appointmentFor = '';
          advicef = '';
          cc = '';
          oe = '';
          rx = '';
          appointmentSheduleId = doctorAppointmentHistory.id.toString();
          currentPatientID = doctorAppointmentHistory.user.id.toString();
          appointmentFor = doctorAppointmentHistory.appointmentFor.toString();

          Navigator.push(context,MaterialPageRoute(builder: (context) => PatientProfileDetailsPage(
            image: doctorAppointmentHistory.user.image,
              name: doctorAppointmentHistory.user.name,
            gender: doctorAppointmentHistory.user.gender,
            email: doctorAppointmentHistory.user.email,
            height: doctorAppointmentHistory.user.height,
            weight: doctorAppointmentHistory.user.weight,
            mobile: doctorAppointmentHistory.user.mobile,
            medicare_no: doctorAppointmentHistory.user.medicareNo,
            address: doctorAppointmentHistory.user.address,
            status: doctorAppointmentHistory.user.status,
            district: doctorAppointmentHistory.user.district,
            appointment_for: doctorAppointmentHistory.appointmentFor,
            id: doctorAppointmentHistory.id.toString(),
            rescheduleDate: DateFormat('dd MMM yyyy || hh:mm a').format(doctorAppointmentHistory.date),
            //district: doctorAppointmentHistory.user.,

          )));
        },
      );



  void completeThisAppointment(String appointmentID,index) {
    DoctorAppointmentDoneController.requestThenResponsePrint(USERTOKEN, appointmentID).then((value) {
      setState(() {
        print(value.statusCode);
        print(value.body);
        if(value.statusCode==200){

          setState(() {
            Navigator.pop(context);
            doctorAppointmentHistory.removeAt(index);
          });
          // SnackbarDialogueHelper.showSnackbarDialog(context,'Appointment Completed Successful', Colors.green);
        }
      });
    });
  }


  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }


  void cancelThisAppointment(String appointmentID, int index) {
    AppointmentCencelController.requestThenResponsePrint(USERTOKEN, appointmentID).then((value) {
      setState(() {
        print(value.statusCode);
        print(value.body);
        if(value.statusCode==200){
          setState(() {
            Navigator.pop(context);
            doctorAppointmentHistory.removeAt(index);
          });
        }
      });
    });
  }

  void setCallData(DoctorAppointmentHistoryResponseElement doctorAppointmentHistory) {
    setState(() {
      String pID = doctorAppointmentHistory.user.id.toString();
      String aID = doctorAppointmentHistory.id.toString();
      String doctorName = DOCTOR_INITIAL.name;

      print("pID");
      print(pID);

      database.createData(pID, aID, doctorName,'$apiDomainRoot/images/${DOCTOR_INITIAL.image}'.toString());
      database.createStatusData(pID, aID, doctorName,'$apiDomainRoot/images/${DOCTOR_INITIAL.image}'.toString(),'called');

      callNow(aID);

    });
  }

  void callNow(channelName) {
    setState(() async {
      // String channelName = "abcdefg";
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
    });
  }
}
