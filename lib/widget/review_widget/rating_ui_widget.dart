import 'package:care_plus_doctor/model/ui_model/review_model/review_model.dart';
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
                Image.asset(rivewlist.image),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text(rivewlist.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                        ),
                        SizedBox(height: 20,),
                        Row(
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
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.5)
                        ),
                      ),
                      Text("Appointment Booked",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.5)
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
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.account_box_rounded, size: 20, color: Color(0xFF1CBFA8),),
                          SizedBox(width: 5,),
                          Text(rivewlist.total_people_rated.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.5)
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 100),
                        child: Row(
                          children: [
                            Icon(Icons.check_box, size: 20, color: Color(0xFF1CBFA8),),
                            SizedBox(width: 5,),
                            Text(rivewlist.appointment_booked.toString(),
                              style: TextStyle(
                                  fontSize: 16,
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
