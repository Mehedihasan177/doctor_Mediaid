import 'package:care_plus_doctor/constents/prescription_constants.dart';
import 'package:care_plus_doctor/helper/snackbarDialouge.dart';
import 'package:care_plus_doctor/model/ui_model/patient_profile_details_model/patient_profile_details_model.dart';
import 'package:care_plus_doctor/view/screen/medicine_page/medicine_page.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/patient_profile_details/patient_profile_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProblemPage extends StatefulWidget {
  const ProblemPage({Key? key}) : super(key: key);

  @override
  _ProblemPageState createState() => _ProblemPageState();
}

class _ProblemPageState extends State<ProblemPage> {
  final List<String> problem = <String>[];
  TextEditingController _textProblem = TextEditingController();
  void addItemToList() {
    setState(() {
      if(_textProblem.text.length<1){
        SnackbarDialogueHelper().showSnackbarDialog(context, 'Please describe problems properly', Colors.red);
      }else if(_textProblem.text==''){
        SnackbarDialogueHelper().showSnackbarDialog(context, 'Please describe problems properly', Colors.red);
      }else{
        problem.insert(0, _textProblem.text);
        _textProblem.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        // Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
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

                if(problem.isNotEmpty){
                  String problemToGo='';
                  for (var element in problem) {
                    setState(() {
                      problemToGo+=element+',';
                    });
                  }

                  if (problemToGo != null && problemToGo.length > 0) {
                    cc = appointmentFor+' | '+problemToGo.substring(0, problemToGo.length - 1);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MedicinePage()));
                  }

                  // cc = appointmentFor+' | '+problemToGo;
                  // cc =problemToGo;

                  SnackbarDialogueHelper().showSnackbarDialog(context, cc, Colors.green);


                }else{
                  cc='';
                  SnackbarDialogueHelper().showSnackbarDialog(context, 'Please describe problems properly', Colors.red);
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
                      Navigator.pop(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => BottomNevigation()));
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Text(
                        "Problem",
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
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Problem",
                style: TextStyle(fontSize: 17),
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
                      controller: _textProblem,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(color: Colors.black),
                      //scrollPadding: EdgeInsets.all(10),
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.all(20),
                        hintText: "Enter problems",
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () {
                          addItemToList();

                        },
                        child: Text('+'),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(14),
                          primary: Color(0xFF1CBFA8),
                        )),
                  ),
                ],
              ),
            ),
            Container(
              height: 660,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: problem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.all(2),
                        child:  Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${problem[index]}'),
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
                                      problem.remove(problem[index]);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

