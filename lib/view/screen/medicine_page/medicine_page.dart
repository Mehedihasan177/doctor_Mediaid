import 'package:care_plus_doctor/view/screen/advice_page/advice_page.dart';
import 'package:care_plus_doctor/view/screen/problem_page/problem_page.dart';
import 'package:flutter/material.dart';

class MedicinePage extends StatefulWidget {
  const MedicinePage({Key? key}) : super(key: key);

  @override
  _MedicinePageState createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  var medicine = [];

  TextEditingController _medicine = TextEditingController();
  TextEditingController _note = TextEditingController();
  TextEditingController _dose = TextEditingController();
  TextEditingController _day = TextEditingController();
  TextEditingController _quantity = TextEditingController();
  void addItemToList() {
    setState(() {
      //
      medicine.insert(0,
          'Medicine: ${_medicine.text} \nNote: ${_note.text} \nDose: ${_dose.text} \nDay: ${_day.text} \nQuantity: ${_quantity.text}');
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
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProblemPage()));
        return true;
      },
      child: Scaffold(
        floatingActionButton: Container(
          height: 50,
          width: 50,
          child: new FloatingActionButton(
              elevation: 0.0,
              child: new Icon(Icons.check),
              backgroundColor: new Color(0xFF1CBFA8),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AdvicePage()));
              }),
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
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => ProblemPage()));
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Text(
                        "Medicine",
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
                        hintText: "Enter medicines name",
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
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
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
                      keyboardType: TextInputType.multiline,
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
            ElevatedButton(
                onPressed: () {
                  addItemToList();
                  _medicine.clear();
                  _note.clear();
                  _dose.clear();
                  _day.clear();
                  _quantity.clear();
                },
                child: Text('+'),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(14),
                  primary: Color(0xFF1CBFA8),
                )),
            Container(
              height: 660,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: medicine.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: Container(
                          // height: 50,
                          margin: EdgeInsets.all(2),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    '${medicine[index]}',
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
