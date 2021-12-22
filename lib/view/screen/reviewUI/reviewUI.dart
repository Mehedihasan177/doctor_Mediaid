import 'package:care_plus_doctor/data/review_data/review_data.dart';
import 'package:care_plus_doctor/data/review_data/review_patient_data.dart';
import 'package:care_plus_doctor/model/ui_model/review_model/review_model.dart';
import 'package:care_plus_doctor/model/ui_model/review_model/review_patient_list_model.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/review_page_list/review_page_list.dart';
import 'package:care_plus_doctor/widget/review_widget/rating_ui_widget.dart';
import 'package:care_plus_doctor/widget/review_widget/review_patient_widget.dart';
import 'package:care_plus_doctor/widget/review_widget/review_rating_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ReviewUiPage extends StatefulWidget {
  const ReviewUiPage({Key? key}) : super(key: key);

  @override
  _ReviewUiPageState createState() => _ReviewUiPageState();
}

class _ReviewUiPageState extends State<ReviewUiPage> {

  List<ReviewModel> rivewlist = List.of(Reviewdata);
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
          // return from here
          children:[
            // Padding(
            //   padding: const EdgeInsets.only(top: 20),
            //   child: Row(
            //     children: [
            //       FlatButton(
            //         child: Icon(
            //           Icons.arrow_back_ios,
            //           size: 20,
            //           color: Colors.black.withOpacity(0.5),
            //         ),
            //         splashColor: Colors.transparent,
            //         onPressed: () {
            //           Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
            //         },
            //       ),
            //       Expanded(
            //         child: Padding(
            //           padding: const EdgeInsets.only(right: 60),
            //           child: Text(
            //             "Review",
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //               fontSize: 20,
            //               color: Colors.black.withOpacity(0.5),
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    height: 510,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      //controller: PageController(viewportFraction: 0.3),
                        scrollDirection: Axis.vertical,
                        itemCount: rivewlist.length,
                        itemBuilder: (context,index) {
                          //var information = carePlushPrescriptionList[index];
                          return ReviewUIWidget(rivewlist[index], context);

                        }
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: Text("Recent",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.5)
                  )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 35, right: 10),
                  child: FlatButton(
                    //minWidth: 10,
                    onPressed: () {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ReviewPageList()));
                    },
                    child: Text(
                        "See All",
                        style:
                        TextStyle(color: Colors.black.withOpacity(0.5))
                    ),
                  ),
                ),
              ],
            ),

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
                        itemCount: 5,
                        itemBuilder: (context,index) {
                          //var information = carePlushPrescriptionList[index];
                          return PatientReviewList(petientreviewlist[index], context);

                        }
                    ),
                  ),
                ),
              ],
            ),



      ]
        ),
      ),
    );
  }
}






