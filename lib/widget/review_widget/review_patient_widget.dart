import 'package:care_plus_doctor/model/ui_model/review_model/review_patient_list_model.dart';
import 'package:flutter/material.dart';


Widget PatientReviewList(ReviewPatientModel petientreviewlist, BuildContext context) =>

    Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(petientreviewlist.image),
                  backgroundColor: Colors.transparent,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(petientreviewlist.rating_person_name)),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text("For  ",
                              style: TextStyle(color: Colors.black.withOpacity(0.5)),
                              ),
                              Text(petientreviewlist.reason),
                            ],
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Text(petientreviewlist.rating_other_person.toString()),
                                Icon(Icons.star, size: 15,color: Colors.yellow,),
                                Icon(Icons.star, size: 15,color: Colors.yellow,),
                                Icon(Icons.star, size: 15,color: Colors.yellow,),
                                Icon(Icons.star, size: 15,color: Colors.yellow,),


                              ],
                            )),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Text(petientreviewlist.date),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(petientreviewlist.details,
              textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );