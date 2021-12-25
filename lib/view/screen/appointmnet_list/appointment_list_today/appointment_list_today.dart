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
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  FlatButton(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    splashColor: Colors.transparent,
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Text(
                        "Today's Appointments",
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
              height: 760,
              // color: Colors.red,
              child: ListView.builder(

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
          ],
        ),
      ),
    );
  }
}
