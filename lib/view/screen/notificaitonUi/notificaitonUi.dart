import 'dart:convert';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/constents/global_appbar.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_appointment_cencel_controller.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_notification_controller.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_notification_delete_controller.dart';
import 'package:care_plus_doctor/data/notification_data/notification_data.dart';
import 'package:care_plus_doctor/helper/snackbarDialouge.dart';
import 'package:care_plus_doctor/model/ui_model/notification_model/notification_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_notification_responses.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/profile/profile.dart';
import 'package:care_plus_doctor/widget/notification_widget/notification_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:intl/intl.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Doctornotification> notification = [];



  _getNotification() async {


    DoctorNotificationController.requestThenResponsePrint( USERTOKEN).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listNotification = decoded['data'];
        print(decoded['data']);
        notification =
            listNotification.map((model) => Doctornotification.fromJson(model)).toList();
        print(notification);

      });
    });
  }


  @override
  void initState() {
    _getNotification();
    // TODO: implement initState
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
        appBar: myAppBar("Notification", null),
        body: ListView(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 20),
            //   child: Center(
            //     child: Text(
            //       "Notification",
            //       style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.black.withOpacity(0.5),
            //       ),
            //     ),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      //padding: EdgeInsets.only(left: 20),

                      alignment: Alignment.centerLeft,
                      height: 780,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        //controller: PageController(viewportFraction: 0.3),
                          scrollDirection: Axis.vertical,
                          itemCount: notification.length,
                          itemBuilder: (context,index) {
                            return NotificationWidget(notification[index], index);
                          }
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget NotificationWidget(Doctornotification notification, int index) => Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Column(
      children: [
        // Card(
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 15, bottom: 10, left: 10),
        //     child: Row(
        //       children: [
        //         Expanded(
        //           flex: 1,
        //           child: Container(
        //             height: 45,
        //             width: 45,
        //             decoration: BoxDecoration(
        //               borderRadius: const BorderRadius.all(Radius.circular(10)),
        //               color: Colors.blue.withOpacity(0.2),
        //             ),
        //             child: Icon(
        //               Icons.notification_important_rounded,
        //               color: Colors.blue.withOpacity(0.9),
        //               size: 30,
        //             ),
        //           ),
        //         ),
        //         Expanded(
        //           flex: 6,
        //           child: Padding(
        //             padding: const EdgeInsets.only(left: 15),
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Container(
        //                     alignment: Alignment.centerLeft,
        //                     child: Text(
        //                       notification.title,
        //                       style: const TextStyle(
        //                           fontSize: 15, fontWeight: FontWeight.bold),
        //                     )),
        //                 const SizedBox(
        //                   height: 10,
        //                 ),
        //                 Container(
        //                     alignment: Alignment.centerLeft,
        //                     child: Text(
        //                       notification.body,
        //                       style: const TextStyle(
        //                         fontSize: 9,
        //                         //fontWeight: FontWeight.bold
        //                       ),
        //                     )),
        //                 const SizedBox(
        //                   height: 10,
        //                 ),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Container(
        //                         alignment: Alignment.bottomLeft,
        //                         child: Text(DateFormat("dd-MMM-yyyy")
        //                             .format(notification.createdAt))),
        //                     const Text(" || "),
        //                     Container(
        //                         alignment: Alignment.bottomLeft,
        //                         child: Text(DateFormat.jms().format(
        //                             DateTime.parse(
        //                                 notification.createdAt.toString())))),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),


        Slidable(
          key: ValueKey(0),
            startActionPane: ActionPane(
              // A motion is a widget used to control how the pane animates.
              motion: const ScrollMotion(),

              // A pane can dismiss the Slidable.
              // dismissible: DismissiblePane(onDismissed: () {}),

              // All actions are defined in the children parameter.
              children:  [
                // A SlidableAction can have an icon and/or a label.
                SlidableAction(
                  onPressed: (v){
                    cancelThisAppointment(context,notification.id.toString(),index);
                  },
                  backgroundColor: Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),

              ],
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10, left: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          color: Colors.blue.withOpacity(0.2),
                        ),
                        child: Icon(
                          Icons.notification_important_rounded,
                          color: Colors.blue.withOpacity(0.9),
                          size: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  notification.title,
                                  style: const TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  notification.body,
                                  style: const TextStyle(
                                    fontSize: 9,
                                    //fontWeight: FontWeight.bold
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(DateFormat("dd-MMM-yyyy")
                                        .format(notification.createdAt))),
                                const Text(" || "),
                                Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(DateFormat.jms().format(
                                        DateTime.parse(
                                            notification.createdAt.toString())))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          endActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),
            //key: ValueKey(1),
            // A pane can dismiss the Slidable.
            // dismissible: DismissiblePane(onDismissed: () {}),

            // All actions are defined in the children parameter.
            children:  [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: (v){
                  cancelThisAppointment(context,notification.id.toString(),index);
                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),

            ],
          ),

        )





      ],

    ),
  );
   cancelThisAppointment(BuildContext context, String appointmentID, int index) {
    DoctorNotificationDeleteController.requestThenResponsePrint(USERTOKEN, notification[index].id).then((value) {
      setState(() {
        print(value.statusCode);
        print(value.body);
        if(value.statusCode==200){
          SnackbarDialogueHelper().showSnackbarDialog(context, "Successfully delete", Colors.red);
          setState(() {
            notification.removeAt(index);
          });
        }
      });
    });
  }
  //  cancelThisAppointment(String appointmentID, int index) {
  //
  // }
}




