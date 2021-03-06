import 'dart:convert';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/constents/global_appbar.dart';
import 'package:care_plus_doctor/constents/no_data_found.dart';
import 'package:care_plus_doctor/constents/shimmer.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_appointment_history_controller.dart';
import 'package:care_plus_doctor/data/case_study_data/case_study_data.dart';
import 'package:care_plus_doctor/model/ui_model/case_study_model/case_study_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_appointment_history_responses.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/widget/case_study_ui_widget/case_study_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CaseStudyNavBar extends StatefulWidget {
  const CaseStudyNavBar({Key? key}) : super(key: key);

  @override
  _CaseStudyNavBarState createState() => _CaseStudyNavBarState();
}

class _CaseStudyNavBarState extends State<CaseStudyNavBar> {
  List<CaseStudymodel> case_study = [];
  TextEditingController searchC = TextEditingController();
  int val = 0;
  @override
  void initState() {
    // TODO: implement initState
    getCompletedAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        appBar: myAppBar("Completed Appointment", null),
        body: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(left: 10,right: 10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: searchC,
                    onChanged: onSearch,
                    onSubmitted: onSearch,
                    style: TextStyle(color: Colors.black),
                    scrollPadding: EdgeInsets.all(10),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 14),
                      border: InputBorder.none,
                      hintText: "Search your patients",
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 15),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                        color: Color(0xFF1CBFA8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "List of Completed Appointments",
                style:
                TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.5)),
              ),
            ),
            SizedBox(height: 10,),
            // Container(
            //   height: 760,
            //   color: Colors.red,
            //   child: ListView.builder(
            //       //physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            //       shrinkWrap: true,
            //       scrollDirection: Axis.vertical,
            //       itemCount: case_study.length,
            //       itemBuilder: (context, index) {
            //         return Case_Study(case_study[index],context);
            //       }),
            //
            // ),

            val == 0 ? shimmer(context): Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                //height: 700,
                //color: Colors.red,
                child: case_study.isEmpty ? Center(
                  child: NoDataFound("images/appointment_history.png", "No Appointment History"),
                ):ListView.builder(
                    physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: case_study.length,
                    itemBuilder: (context, index) {

                      if(searchKey.length==0){
                        return Case_Study(case_study[index], context);
                      }else{
                        if(case_study[index].name.toLowerCase().contains(searchKey)){
                          return Case_Study(case_study[index], context);
                        }else if(case_study[index].image.toLowerCase().contains(searchKey)){
                          return Case_Study(case_study[index], context);
                        }else if(case_study[index].id.toLowerCase().contains(searchKey)){
                          return Case_Study(case_study[index], context);
                        }else if(case_study[index].lab_report_type.toLowerCase().contains(searchKey)){
                          return Case_Study(case_study[index], context);
                        }else if(case_study[index].time.toLowerCase().contains(searchKey)){
                          return Case_Study(case_study[index], context);
                        }else if(case_study[index].date.toLowerCase().contains(searchKey)){
                          return Case_Study(case_study[index], context);
                        }else{
                          return Container();
                        }
                      }


                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
  String searchKey = '';
  void onSearch(String value) {
    setState(() {
      searchKey=value;
    });
  }

  List<DoctorAppointmentHistoryResponseElement> doctorAppointmentHistory= [];

  void getCompletedAppointments() {
    DoctorAppointmentHistoryController.requestThenResponsePrint(USERTOKEN).then((value) {
      setState(() {
        val = 1;
        print(value.statusCode);
        print(value.body);
        if(value.statusCode==200){
          print(value.body);
          Map<String, dynamic> decoded = json.decode("${value.body}");
          Iterable AppointmentHistory = decoded['data'];
          print(decoded['data']);
          doctorAppointmentHistory =
              AppointmentHistory.map((model) => DoctorAppointmentHistoryResponseElement.fromJson(model)).toList();
          print(doctorAppointmentHistory);

          case_study.clear();
          for(var each in doctorAppointmentHistory){
            if((each.active.toString()!='0')&&(each.consult=='1'))
              case_study.add(CaseStudymodel(id: each.user.id.toString(),date: DateFormat('dd MMM yyyy').format(each.date),time: DateFormat('hh:mm a').format(each.date),image: "$apiDomainRoot/images/${each.user.image}",name: each.user.name,lab_report_type: each.appointmentFor,));
          }

        }
      });
    });
  }
}




