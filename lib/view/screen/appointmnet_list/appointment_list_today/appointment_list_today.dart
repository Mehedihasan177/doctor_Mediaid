import 'package:care_plus_doctor/constents/global_appbar.dart';
import 'package:care_plus_doctor/data/appointment_list_navbar/appointment_list_navbar_data.dart';
import 'package:care_plus_doctor/model/ui_model/appointment_list_navBar/appointment_list_navBar.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/widget/appointment_list_navBar_widget/appintment_List_navbar_widget.dart';
import 'package:flutter/material.dart';

class AppointmentListToday extends StatefulWidget {
  const AppointmentListToday({Key? key}) : super(key: key);

  @override
  _AppointmentListTodayState createState() => _AppointmentListTodayState();
}

class _AppointmentListTodayState extends State<AppointmentListToday> {
  List<Appointment_list_navBar> appointmentlist = List.of(appointmentList);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        //Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        appBar: myAppBar("Today's Appointments", null),
        body: ListView(
          children: [


            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 760,
                // color: Colors.red,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.vertical,
                    itemCount: appointmentlist.length,
                    itemBuilder: (context, index) {
                      return Appointment_List(
                          appointmentlist[index].image,
                          appointmentlist[index].name,
                          appointmentlist[index].reason,
                          appointmentlist[index].date,
                          appointmentlist[index].time,
                          context);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
