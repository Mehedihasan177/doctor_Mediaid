import 'package:care_plus_doctor/data/appointment_list_navbar/appointment_history_data.dart';
import 'package:care_plus_doctor/model/ui_model/appointment_list_navBar/appointment_history_navBar.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/widget/appointment_list_navBar_widget/appintment_List_navbar_widget.dart';
import 'package:flutter/material.dart';

class AppointmentListTomorrow extends StatefulWidget {
  const AppointmentListTomorrow({Key? key}) : super(key: key);

  @override
  _AppointmentListTomorrowState createState() => _AppointmentListTomorrowState();
}

class _AppointmentListTomorrowState extends State<AppointmentListTomorrow> {
  List<Appointment_History_navBar> appointmentHistoy =
  List.of(appointmentHistory);
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
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text(
                        "Tomorrow Appointments",
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
              child: ListView.builder(

                  // scrollDirection: Axis.vertical,
                  itemCount: appointmentHistoy.length,
                  itemBuilder: (context, index) {
                    return Appointment_List(
                        appointmentHistoy[index].image,
                        appointmentHistoy[index].name,
                        appointmentHistoy[index].reason,
                        appointmentHistoy[index].date,
                        appointmentHistoy[index].time,
                        context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
