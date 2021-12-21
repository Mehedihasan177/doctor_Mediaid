import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/constents/prescription_constants.dart';
import 'package:care_plus_doctor/controller/doctor/create_e_prescription_doctor.dart';
import 'package:care_plus_doctor/helper/snackbarDialouge.dart';
import 'package:care_plus_doctor/responses/doctor/create_E_prescription_response.dart';
import 'package:care_plus_doctor/view/screen/medicine_page/medicine_page.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:flutter/material.dart';

class AdvicePage extends StatefulWidget {
  const AdvicePage({Key? key}) : super(key: key);

  @override
  _AdvicePageState createState() => _AdvicePageState();
}

class _AdvicePageState extends State<AdvicePage> {
  final List<String> advice = <String>[];
  TextEditingController _textAdvice = TextEditingController(text: 'Visit again after 30 days');
  void addItemToList() {
    setState(() {
      if(_textAdvice.text.isEmpty){
        SnackbarDialogueHelper().showSnackbarDialog(context, 'Please describe advices properly', Colors.red);
      }else{
        advice.insert(0, _textAdvice.text);
        _textAdvice.clear();
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MedicinePage()));
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


                if(advice.isNotEmpty){
                  String adviceToGo='';
                  for (var element in advice) {
                    setState(() {
                      adviceToGo+=element+',';
                    });
                  }

                  if (adviceToGo != null && adviceToGo.length > 0) {
                    advicef = adviceToGo.substring(0, adviceToGo.length - 1);


                    submitThePrescription();


                  }

                  // cc = appointmentFor+' | '+problemToGo;
                  // cc =problemToGo;

                  // SnackbarDialogueHelper().showSnackbarDialog(context, advicef, Colors.green);


                }else{
                  advicef='';
                  SnackbarDialogueHelper().showSnackbarDialog(context, 'Please describe advices properly', Colors.red);
                }


                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => BottomNevigation()));
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
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => MedicinePage()));
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Text(
                        "Advice",
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
                "Advice",
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
                      controller: _textAdvice,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(color: Colors.black),
                      //scrollPadding: EdgeInsets.all(10),
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.all(20),
                        hintText: "Enter your advices",
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
                  itemCount: advice.length,
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
                              Flexible(child: Text("Advice:  " + '${advice[index]}')),
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
                                      advice.remove(advice[index]);
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

  void submitThePrescription() {
    CreateEPrescriptionModel ePrescription = CreateEPrescriptionModel(
        appointmentSheduleId,advicef,cc,oe,rx
    );
    CreateEPrescriptionController.requestThenResponsePrint(USERTOKEN, ePrescription).then((value){
      print(value.statusCode);
      print(value.body);
      if(value.statusCode==200){
        appointmentSheduleId = '';
        currentPatientID = '';
        appointmentFor = '';
        advicef = '';
        cc = '';
        oe = '';
        rx = '';

        SnackbarDialogueHelper().showSnackbarDialog(context,'Prescription successfully created',Colors.green);

      }else{
        SnackbarDialogueHelper().showSnackbarDialog(context,'Prescription creation failed',Colors.red);

      }
    });
  }
}
