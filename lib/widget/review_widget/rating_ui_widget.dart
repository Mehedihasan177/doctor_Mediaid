import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/model/ui_model/review_model/review_model.dart';
import 'package:care_plus_doctor/view/screen/notificaitonUi/notificaitonUi.dart';
import 'package:care_plus_doctor/view/screen/reviewUI/reviewUI.dart';
import 'package:care_plus_doctor/widget/review_widget/review_rating_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Widget ReviewUIWidget(ReviewModel rivewlist, context,QuickRateClass quick) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [







          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, top: 40, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Total People Rated",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.5)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Text("Average Rating",
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
                  padding: const EdgeInsets.only(left: 0, top: 20, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Text(quick.totalRated.toString(),
                      //   style: TextStyle(
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.bold
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Row(
                          children: [
                            // Icon(Icons.add_reaction, color: Colors.orange,),
                            Text(quick.totalRated.toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(' Person',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Row(
                          children: [
                            Text(quick.myRating.toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Icon(Icons.star, color: Colors.orange,),
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
      );

