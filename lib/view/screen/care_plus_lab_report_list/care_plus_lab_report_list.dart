

import 'package:care_plus_doctor/constents/prescription_constants.dart';
import 'package:care_plus_doctor/data/care_plus_lab_report_list_data/care_plus_lab_report_list_data.dart';
import 'package:care_plus_doctor/helper/snackbarDialouge.dart';
import 'package:care_plus_doctor/model/care_plus_lab_report_list_model/care_plus_lab_report_list_model.dart';
import 'package:care_plus_doctor/model/lab_report/lab_report.dart';
import 'package:care_plus_doctor/view/screen/advice_page/advice_page.dart';
import 'package:care_plus_doctor/view/screen/medicine_page/medicine_page.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/patient_profile_details/patient_profile_details.dart';
import 'package:care_plus_doctor/widget/care_plus_lab_report_list_Widget/care_plus_lab_report_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarePlusLabReportList extends StatefulWidget {
  const CarePlusLabReportList({Key? key}) : super(key: key);

  @override
  _CarePlusLabReportListState createState() => _CarePlusLabReportListState();
}

class _CarePlusLabReportListState extends State<CarePlusLabReportList> {
  List<LabReport> lab_report = [];
  TextEditingController _lab = TextEditingController();
  TextEditingController _note = TextEditingController();
  void addItemToList() {
    setState(() {
      if(_lab.text.isEmpty){
        SnackbarDialogueHelper().showSnackbarDialog(context, 'Please describe lab test name properly', Colors.red);
      }else if(_note.text.isEmpty){
        SnackbarDialogueHelper().showSnackbarDialog(context, 'Please describe lab test note properly', Colors.red);
      }else{
        lab_report.add(LabReport(_lab.text, _note.text));
        _lab.clear();
        _note.clear();
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        // Navigator.push(context,MaterialPageRoute(builder: (context) => MedicinePage()));
        return true;
      },
      child: Scaffold(
        floatingActionButton: Container(
          height: 50,
          width: 50,
          child: FloatingActionButton(
              elevation: 0.0,
              child: new Icon(Icons.check),
              backgroundColor: new Color(0xFF1CBFA8),
              onPressed: (){

                String labtestToGo = '';
                if(lab_report.isNotEmpty){
                  for (var lb in lab_report) {
                    setState(() {
                      labtestToGo += lb.lab_details + ' - ' + lb.notes;
                      labtestToGo += ',';
                    });
                  }
                  if (labtestToGo.isNotEmpty) {
                    oe = labtestToGo.substring(0, labtestToGo.length - 1);
                    // SnackbarDialogueHelper().showSnackbarDialog(context, oe, Colors.red);
                    Navigator.push(context,MaterialPageRoute(builder: (context) => AdvicePage()));

                  }

                }else{
                  oe='';
                  SnackbarDialogueHelper().showSnackbarDialog(context, 'Please describe lab tests properly', Colors.red);
                }


              }
          ),
        ),
        body: ListView(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  FlatButton(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    splashColor: Colors.transparent,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNevigation()));
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Text(
                        "Lab Test Details",
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
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: TextField(
                      controller: _lab,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(color: Colors.black),
                      //scrollPadding: EdgeInsets.all(10),
                      decoration: const InputDecoration(
                        //contentPadding: EdgeInsets.all(20),
                        hintText: "Enter lab tests",
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: TextField(
                      controller: _note,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(color: Colors.black),
                      //scrollPadding: EdgeInsets.all(10),
                      decoration: const InputDecoration(
                        //contentPadding: EdgeInsets.all(20),
                        hintText: "Enter notes",
                      ),
                    ),
                  ),

                ],
              ),
            ),
             Center(
               child: Container(
                 width: 90,
                 child: ElevatedButton(
                      onPressed: () {
                        addItemToList();

                      },
                      child: Text('ADD',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(14),
                        primary: Color(0xFF1CBFA8),
                      )),
               ),
             ),

            Container(
              height: 660,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: lab_report.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Card(
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(2),
                            child:  Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(top: 5),
                                      alignment:Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text("Lab Details:  ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                          ),
                                          ),
                                          Text('${lab_report[index].lab_details}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                //fontWeight: FontWeight.bold
                                            ),),
                                        ],
                                      )),
                                  SizedBox(height: 10,),
                                  Container(
                                      padding: EdgeInsets.only(bottom: 5),
                                      alignment:Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text("Notes:  ",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          Text('${lab_report[index].notes}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                //fontWeight: FontWeight.bold
                                            ),),
                                        ],
                                      )),
                                ],
                              ),
                            ),

                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(
                              Icons.cancel,
                            ),

                            iconSize: 25,
                            color: Colors.red,
                            // splashColor: Colors.purple,
                            onPressed: () {
                              setState(() {
                                lab_report.remove(lab_report[index]);
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
  }



