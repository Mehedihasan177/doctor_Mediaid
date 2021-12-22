import 'package:care_plus_doctor/model/ui_model/notification_model/notification_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_notification_responses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget NotificationWidget(Doctornotification notification) =>
    Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child:   Card(
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
                    borderRadius:
                    BorderRadius.all(Radius.circular(10)),
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
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(notification.title,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          )
                      ),

                      SizedBox(height: 10,),

                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(notification.body,
                            style: TextStyle(
                              fontSize: 9,
                              //fontWeight: FontWeight.bold
                            ),
                          )
                      ),


                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(DateFormat("dd-MMMM-yyyy").format(notification.createdAt))
                          ),


                          Text("    ||    "),


                          Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(DateFormat.jm().format(DateTime.parse(notification.createdAt.toString())))
                          ),

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
    );
