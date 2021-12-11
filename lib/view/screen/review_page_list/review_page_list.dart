import 'package:care_plus_doctor/data/review_data/review_data.dart';
import 'package:care_plus_doctor/data/review_data/review_patient_data.dart';
import 'package:care_plus_doctor/model/ui_model/review_model/review_model.dart';
import 'package:care_plus_doctor/model/ui_model/review_model/review_patient_list_model.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/widget/review_widget/review_patient_widget.dart';
import 'package:flutter/material.dart';

class ReviewPageList extends StatefulWidget {
  const ReviewPageList({Key? key}) : super(key: key);

  @override
  _ReviewPageListState createState() => _ReviewPageListState();
}

class _ReviewPageListState extends State<ReviewPageList> {

  List<ReviewPatientModel> petientreviewlist = List.of(ReviewPatientdata);

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
                      size: 23,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    splashColor: Colors.transparent,
                    onPressed: () {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Text(
                        "Reviews",
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



            Row(
              children: [
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                     height: 760,
                    child: ListView.builder(

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
