import 'dart:convert';
import 'dart:math';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/constents/no_data_found.dart';
import 'package:care_plus_doctor/constents/shimmer.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_signIn_controller.dart';
import 'package:care_plus_doctor/controller/doctor/review_controller.dart';
import 'package:care_plus_doctor/data/review_data/review_data.dart';
import 'package:care_plus_doctor/data/review_data/review_patient_data.dart';
import 'package:care_plus_doctor/model/ui_model/review_model/review_model.dart';
import 'package:care_plus_doctor/model/ui_model/review_model/review_patient_list_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_review_resposes.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/notificaitonUi/notificaitonUi.dart';
import 'package:care_plus_doctor/view/screen/review_page_list/review_page_list.dart';
import 'package:care_plus_doctor/widget/review_widget/rating_ui_widget.dart';
import 'package:care_plus_doctor/widget/review_widget/review_patient_widget.dart';
import 'package:care_plus_doctor/widget/review_widget/review_rating_widget.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ReviewUiPage extends StatefulWidget {
  const ReviewUiPage({Key? key}) : super(key: key);

  @override
  _ReviewUiPageState createState() => _ReviewUiPageState();
}

class _ReviewUiPageState extends State<ReviewUiPage> {

  List<ReviewModel> rivewlist = [];
  List<ReviewPatientModel> petientreviewlist = [];
  int val = 0;
  int fiveC = 0;
  int fourC = 0;
  int threeC = 0;
  int twoC = 0;
  int oneC = 0;
  int totalRated = 0;
  int totalRatings = 0;
  double myRating = 0;


  _getReview() async {
    DoctorReviewController.requestThenResponsePrint( USERTOKEN).then((value) {
      setState(() {
        val = 1;
        print(value.body);
        // Map<String, dynamic> decoded = json.decode("${value.body}");
        // Iterable listReview = decoded['data'];
        // print(decoded['data']);
        // rivewlist =
        //     listReview.map((model) => Doctornotification.fromJson(model)).toList();
        print(rivewlist);

        var review = DoctorReviewResponses.fromJson(json.decode(value.body));
        print(review.data);

        petientreviewlist.clear();
        for(var each in review.data){
          petientreviewlist.add(ReviewPatientModel(image: each.user.image, details: each.comment, date: DateFormat("dd MMM yyyy").format(each.createdAt), reason: "Fiver", rating_person_name: each.user.name, rating_other_person: each.rating.toString()));
          setState(() {
            if(each.rating=='1'){
              oneC++;
            }else if(each.rating=='2'){
              twoC++;
            }else if(each.rating=='3'){
              threeC++;
            }else if(each.rating=='4'){
              fourC++;
            }else if(each.rating=='5'){
              fiveC++;
            }

            totalRated++;
            totalRatings+=int.parse(each.rating);
            myRating=totalRatings/totalRated;
            quick = QuickRateClass(fiveC, fourC, threeC, twoC, oneC, totalRated, totalRatings, myRating);


          });
        }


      });
    });
  }


  @override
  void initState() {
    quick = QuickRateClass(fiveC, fourC, threeC, twoC, oneC, totalRated, totalRatings, myRating);
    _getReview();
    // TODO: implement initState
    
    print('from review');
    print(jsonEncode(DOCTOR_INITIAL));
    
    super.initState();
  }

  late QuickRateClass quick;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        // Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tap back again to leave'),
          ),
          child: ListView(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children:[
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 68,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                          child: Image.network(
                            DOCTOR_INITIAL.image.toString()=='null'?
                            avatarLink:'$apiDomainRoot/images/${DOCTOR_INITIAL.image}',
                            fit: BoxFit.fill,
                            width: 140,
                            height: 150,
                          )),
                    ),

                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        //alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text("Welcome",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),

                                      Container(
                                        //alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(bottom: 3),
                                        child: Text(DOCTOR_INITIAL.name,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: Row(
                                    children: [

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
                                              Navigator.push(context,MaterialPageRoute(builder: (context) => NotificationPage()));
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(DOCTOR_INITIAL.designation,
                                  style: TextStyle(
                                    fontSize: 17,
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(DOCTOR_INITIAL.specialization.replaceAll("null", "Set specializations"),
                                  style: TextStyle(
                                    fontSize: 17,
                                    // fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(DOCTOR_INITIAL.chambers,
                                  style: TextStyle(
                                    fontSize: 15,
                                    // fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            // Padding(
                            //   padding: const EdgeInsets.only(bottom: 50),
                            //   child: Row(
                            //     children: [
                            //       Text(quick.myRating.toString(),
                            //       style: TextStyle(
                            //         fontSize: 20,
                            //         fontWeight: FontWeight.bold
                            //       ),
                            //       ),
                            //       Icon(Icons.star, color: Colors.yellow,),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
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


              Center(
                child: Container(
                  height: 200,
                  //color: Colors.red,
                  //width: MediaQuery.of(context).size.width ,
                  child: ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {

                      quick = QuickRateClass(fiveC, fourC, threeC, twoC, oneC, totalRated, totalRatings, myRating);
                      return progressBar(context, index,quick);
                    },
                  ),
                ),
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
                        Navigator.push(context,MaterialPageRoute(builder: (context) => ReviewPageList()));
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

              val == 0 ? shimmer(context): Row(
                children: [
                  Flexible(
                    child: Container(
                      //padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      // height: 600,
                      child: petientreviewlist.isEmpty ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("images/review_image.png", height: 80,width: 80,),
                            Text("No Review found", style: TextStyle(
                              fontSize: 17,
                              color: Color(0xFF1CBFA8)
                            ),)
                          ],
                        )
                      ) : ListView.builder(
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



      ]
          ),
        ),
      ),
    );
  }
}

class QuickRateClass{
  int fiveC = 0;
  int fourC = 0;
  int threeC = 0;
  int twoC = 0;
  int oneC = 0;
  int totalRated = 0;
  int totalRatings = 0;
  double myRating = 0;

  QuickRateClass(this.fiveC, this.fourC, this.threeC, this.twoC, this.oneC,
      this.totalRated, this.totalRatings, this.myRating);
}






