import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/model/ui_model/review_model/review_model.dart';
import 'package:care_plus_doctor/view/screen/notificaitonUi/notificaitonUi.dart';
import 'package:care_plus_doctor/widget/review_widget/review_rating_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Widget ReviewUIWidget(ReviewModel rivewlist, context) => Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                Image.network("$apiDomainRoot/images/${DOCTOR_INITIAL.image}",
                height: 160,
                  width: 160,

                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(rivewlist.name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                  ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 70),
                              child: Row(
                                children: [
                                  // Container(
                                  //   height: 30,
                                  //   width: 30,
                                  //   child: IconButton(
                                  //     icon: Icon(
                                  //       Icons.watch_later_outlined,
                                  //     ),
                                  //     iconSize: 25,
                                  //     color: Color(0xFF1CBFA8),
                                  //     splashColor: Color(0xFF1CBFA8),
                                  //     onPressed: () {
                                  //       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => NotificationPage()));
                                  //     },
                                  //   ),
                                  // ),
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
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: Row(
                            children: [
                              Text(rivewlist.rating.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                              Icon(Icons.star, color: Colors.yellow,),
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

          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30, bottom: 10),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text("Average Reviews",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.5)
                ),
                ),
            ),
          ),

          Container(
              width: MediaQuery.of(context).size.width - 50,
              child: ListView.builder(
                reverse: true,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return progressBar(context, index);
                },
              ),
            ),


          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total People Rated",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.5)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Text("Appointment Booked",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.5)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.account_box_rounded, size: 23, color: Color(0xFF1CBFA8),),
                          SizedBox(width: 5,),
                          Text(rivewlist.total_people_rated.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black.withOpacity(0.5)
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 95),
                        child: Row(
                          children: [
                            Icon(Icons.check_box, size: 23, color: Color(0xFF1CBFA8),),
                            SizedBox(width: 5,),
                            Text(rivewlist.appointment_booked.toString(),
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black.withOpacity(0.5)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
