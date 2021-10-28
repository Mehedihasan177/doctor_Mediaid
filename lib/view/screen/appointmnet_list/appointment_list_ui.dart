import 'package:care_plus_doctor/data/appointment_list_navbar/appointment_history_data.dart';
import 'package:care_plus_doctor/data/appointment_list_navbar/appointment_list_navbar_data.dart';
import 'package:care_plus_doctor/model/ui_model/appointment_list_navBar/appointment_history_navBar.dart';
import 'package:care_plus_doctor/model/ui_model/appointment_list_navBar/appointment_list_navBar.dart';
import 'package:care_plus_doctor/view/screen/notificaitonUi/notificaitonUi.dart';
import 'package:care_plus_doctor/widget/appointment_list_navBar_widget/appintment_List_navbar_widget.dart';
import 'package:flutter/material.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({Key? key}) : super(key: key);

  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  List<Appointment_list_navBar> appointmentlist = List.of(appointmentList);
  List<Appointment_History_navBar> appointmentHistoy =
      List.of(appointmentHistory);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => NotificationPage()));
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
                    "Today",
                    style:
                        TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.5)),
                  ),

                FlatButton(
                  minWidth: 10,
                  onPressed: () {
                    //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => FeaturedDoctor()));
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
                itemCount: 2,
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
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              "Tomorrow",
              style:
                  TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.5)),
            ),
          ),
          Container(

            // color: Colors.red,
            child: ListView.builder(
                physics:
                    NeverScrollableScrollPhysics(), // <-- this will disable scroll
                shrinkWrap: true,
                // scrollDirection: Axis.vertical,
                itemCount: 5,
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
    );
  }
}
