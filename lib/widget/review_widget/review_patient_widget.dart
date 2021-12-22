import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/model/ui_model/review_model/review_patient_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget PatientReviewList(ReviewPatientModel petientreviewlist, BuildContext context) =>

    Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage("$apiDomainRoot/images/${petientreviewlist.image}"),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text(petientreviewlist.rating_person_name)),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Text(petientreviewlist.date),
                              ],
                            )),


                        Padding(
                          padding: const EdgeInsets.only(left: 0, right: 20, top: 15),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(petientreviewlist.details,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(petientreviewlist.rating_other_person.toString()),
                // Icon(Icons.star, size: 15,color: Colors.yellow,),
                // Icon(Icons.star, size: 15,color: Colors.yellow,),
                // Icon(Icons.star, size: 15,color: Colors.yellow,),
                // Icon(Icons.star, size: 15,color: Colors.yellow,),

                RatingBar.builder(
                  initialRating: double.parse(petientreviewlist.rating_other_person),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,itemSize: 15,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )

              ],
            )

            ],
          ),
        ),
      ),
    );