import 'dart:convert';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/constents/global_appbar.dart';
import 'package:care_plus_doctor/controller/doctor/review_controller.dart';
import 'package:care_plus_doctor/data/review_data/review_data.dart';
import 'package:care_plus_doctor/data/review_data/review_patient_data.dart';
import 'package:care_plus_doctor/model/ui_model/review_model/review_model.dart';
import 'package:care_plus_doctor/model/ui_model/review_model/review_patient_list_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_review_resposes.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/widget/review_widget/review_patient_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReviewPageList extends StatefulWidget {
  const ReviewPageList({Key? key}) : super(key: key);

  @override
  _ReviewPageListState createState() => _ReviewPageListState();
}

class _ReviewPageListState extends State<ReviewPageList> {

  List<ReviewPatientModel> petientreviewlist = [];

  _getReview() async {


    DoctorReviewController.requestThenResponsePrint( USERTOKEN).then((value) {
      setState(() {
        print(value.body);
        // Map<String, dynamic> decoded = json.decode("${value.body}");
        // Iterable listReview = decoded['data'];
        // print(decoded['data']);
        // rivewlist =
        //     listReview.map((model) => Doctornotification.fromJson(model)).toList();
        //print(rivewlist);

        var review = DoctorReviewResponses.fromJson(json.decode(value.body));
        print(review.data);

        petientreviewlist.clear();
        for(var each in review.data){
          petientreviewlist.add(ReviewPatientModel(image: each.user.image, details: each.comment, date: DateFormat("dd MMM yyyy").format(each.createdAt), reason: "Fiver", rating_person_name: each.user.name, rating_other_person: each.rating.toString()));
          setState(() {

          });
        }


      });
    });
  }


  @override
  void initState() {
    _getReview();
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
        appBar: myAppBar("Reviews", null),
        body: ListView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [




            Row(
              children: [
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    // height: 600,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        //controller: PageController(viewportFraction: 0.3),
                        scrollDirection: Axis.vertical,
                        itemCount: petientreviewlist.length,
                        itemBuilder: (context,index) {
                          //var information = carePlushPrescriptionList[index];
                          return PatientReviewList(petientreviewlist[index], context);

                        }
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
