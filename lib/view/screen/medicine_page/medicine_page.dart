import 'package:care_plus_doctor/constents/global_appbar.dart';
import 'package:care_plus_doctor/constents/prescription_constants.dart';
import 'package:care_plus_doctor/helper/snackbarDialouge.dart';
import 'package:care_plus_doctor/model/pres_model/medicine_create.dart';
import 'package:care_plus_doctor/view/screen/advice_page/advice_page.dart';
import 'package:care_plus_doctor/view/screen/care_plus_lab_report_list/care_plus_lab_report_list.dart';
import 'package:care_plus_doctor/view/screen/problem_page/problem_page.dart';
import 'package:flutter/material.dart';

class MedicinePage extends StatefulWidget {
  const MedicinePage({Key? key}) : super(key: key);

  @override
  _MedicinePageState createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  List<CreateMedicine> medicine = [];
  TextEditingController _medicine = TextEditingController();
  TextEditingController _note = TextEditingController();
  TextEditingController _dose = TextEditingController();
  TextEditingController _day = TextEditingController();
  TextEditingController _quantity = TextEditingController();





  void addItemToList() {
    setState(() {

      if(_medicine.text.isEmpty){
        SnackbarDialogueHelper().showSnackbarDialog(context, 'Please describe medicine name properly', Colors.red);
      }else if(_note.text.isEmpty){
        SnackbarDialogueHelper().showSnackbarDialog(context, 'Please describe note properly', Colors.red);
      }else if(_dose.text.isEmpty){
        SnackbarDialogueHelper().showSnackbarDialog(context, 'Please describe dose properly', Colors.red);
      }else if(_day.text.isEmpty){
        SnackbarDialogueHelper().showSnackbarDialog(context, 'Please describe days properly', Colors.red);
      }else if(_quantity.text.isEmpty){
        SnackbarDialogueHelper().showSnackbarDialog(context, 'Please describe quantity properly', Colors.red);
      }else if((_medicine.text.contains('+'))||(_note.text.contains('+'))||(_dose.text.contains('+'))||(_day.text.contains('+'))||(_quantity.text.contains('+'))){
        SnackbarDialogueHelper().showSnackbarDialog(context, 'Please avoid + symbol', Colors.red);
      }else{
        medicine.add(CreateMedicine(_medicine.text,_dose.text,_note.text,_day.text,_quantity.text));
        _medicine.clear();
        _note.clear();
        _dose.clear();
        _day.clear();
        _quantity.clear();
      }



      //
      // medicine.insert(0, 'Medicine: ${_medicine.text} \nNote: ${_note.text} \nDose: ${_dose.text} \nDay: ${_day.text} \nQuantity: ${_quantity.text}');
      // medicine.insert(0, _medicine.text);
      // medicine.insert(1, _note.text);
      // medicine.insert(2, _dose.text);
      // medicine.insert(3, _day.text);
      // medicine.insert(4, _quantity.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        // Navigator.push(context,MaterialPageRoute(builder: (context) => ProblemPage()));
        return true;
      },
      child: Scaffold(
        appBar: myAppBar("Medicine", null),
        floatingActionButton: Container(
          height: 50,
          width: 50,
          child: FloatingActionButton(
              elevation: 0.0,
              child: new Icon(Icons.check),
              backgroundColor: new Color(0xFF1CBFA8),
              onPressed: () {

                String medicineToGo='';
                if(medicine.isNotEmpty){
                  for (var med in medicine) {
                    setState(() {
                      medicineToGo += med.medName + ',' + med.dose + ',' + med.day.toString() + ',' + med.note.toString();
                      medicineToGo += '+';
                    });
                  }
                  if (medicineToGo.isNotEmpty) {
                    rx = medicineToGo.substring(0, medicineToGo.length - 1);
                    // SnackbarDialogueHelper().showSnackbarDialog(context, rx, Colors.red);
                    Navigator.push(context,MaterialPageRoute(builder: (context) => CarePlusLabReportList()));
                  }

                }else{
                  rx='';
                  SnackbarDialogueHelper().showSnackbarDialog(context, 'Please describe medicines properly', Colors.red);
                }

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => AdvicePage()));

              }),
        ),
        body: ListView(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 20, bottom: 20),
            //   child: Row(
            //     children: [
            //       FlatButton(
            //         child: Icon(
            //           Icons.arrow_back_ios,
            //           size: 25,
            //           color: Colors.black.withOpacity(0.5),
            //         ),
            //         splashColor: Colors.transparent,
            //         onPressed: () {
            //           Navigator.push(context,
            //               MaterialPageRoute(builder: (context) => ProblemPage()));
            //         },
            //       ),
            //       Expanded(
            //         child: Padding(
            //           padding: const EdgeInsets.only(right: 60),
            //           child: Text(
            //             "Medicine",
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //               fontSize: 23,
            //               color: Colors.black.withOpacity(0.5),
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "Medicine",
                style: TextStyle(fontSize: 17),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    // flex: 4,
                    child: TextField(
                      maxLines: null,
                      controller: _medicine,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(color: Colors.black),
                      //scrollPadding: EdgeInsets.all(10),
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.all(20),
                        hintText: "Enter medicine name",
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
                    // flex: 4,
                    child: TextField(
                      controller: _note,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(color: Colors.black),
                      //scrollPadding: EdgeInsets.all(10),
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.all(20),
                        hintText: "Enter note",
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
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: TextField(
                        controller: _dose,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(color: Colors.black),
                        //scrollPadding: EdgeInsets.all(10),
                        decoration: InputDecoration(
                          //contentPadding: EdgeInsets.all(20),
                          hintText: "Dose",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: TextField(
                        controller: _day,
                        // maxLines: null,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        //scrollPadding: EdgeInsets.all(10),
                        decoration: InputDecoration(
                          //contentPadding: EdgeInsets.all(20),
                          hintText: "Day",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: _quantity,
                      maxLines: null,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black),
                      //scrollPadding: EdgeInsets.all(10),
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.all(20),
                        hintText: "Quantity",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      addItemToList();

                    },
                    child: Text('ADD',
                    style: TextStyle(
                      fontSize: 17
                    ),
                    ),
                    style: ElevatedButton.styleFrom(
                      //shape: CircleBorder(),
                      padding: EdgeInsets.all(14),
                      primary: Color(0xFF1CBFA8),
                    )),
              ),
            ),
            Container(
              height: 420,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),

                  padding: const EdgeInsets.all(8),
                  itemCount: medicine.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Card(
                          child: Container(

                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.only(right: 10),
                                            alignment:Alignment.centerLeft,
                                            child: Text("Medicine:  " + '${medicine[index].medName}',)),
                                        SizedBox(
                                          height: 15
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(right: 10),
                                            alignment:Alignment.centerLeft,
                                            child: Text("Note:  " + '${medicine[index].note}',)),
                                        SizedBox(
                                            height: 15
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text("Dose"),
                                                  SizedBox(
                                                      height: 5
                                                  ),
                                                  Text('${medicine[index].dose}',),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text("Day"),
                                                  SizedBox(
                                                      height: 5
                                                  ),
                                                  Text('${medicine[index].day}',),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text("Quantity"),
                                                  SizedBox(
                                                      height: 5
                                                  ),
                                                  Text('${medicine[index].qty}',),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                                medicine.remove(medicine[index]);
                              });
                            },
                          ),
                        ),
                    ]
                    );

                  }),
            )
          ],
        ),
      ),
    );
  }
}
// Expanded(
// flex: 1,
// child: ElevatedButton(
// onPressed: () {
// addItemToList();
// _textEmail.clear();
// },
// child: Text('+'),
// style: ElevatedButton.styleFrom(
// shape: CircleBorder(),
// padding: EdgeInsets.all(14),
// primary: Color(0xFF1CBFA8),
// )),
// ),
