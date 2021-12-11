import 'package:care_plus_doctor/model/manage_schedule_model/manage_schedule_model.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ManageSchedule extends StatefulWidget {
  const ManageSchedule({Key? key}) : super(key: key);

  @override
  _ManageScheduleState createState() => _ManageScheduleState();
}

class _ManageScheduleState extends State<ManageSchedule> {

  TextEditingController _from = TextEditingController();
  TextEditingController _to = TextEditingController();

  List<ManageScheduleModel> manageSchedule = [];
  TimeOfDay selectedTime = TimeOfDay.now();
// Default Drop Down Item.
  String dropdownValue = 'Sunday';

  // To show Selected Item in Text.
  String holder = '' ;

  List <String> actorsName = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',

  ] ;

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,

    );
    if(timeOfDay != null && timeOfDay != selectedTime)
    {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
  _Time(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,

    );
    if(timeOfDay != null && timeOfDay != selectedTime)
    {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  void getDropDownItem(){

    setState(() {
      holder = dropdownValue ;
    });
  }

  void addItemToList() {
    setState(() {
      //valuetwo = [] as NewObject2;
      manageSchedule.add(ManageScheduleModel(_from.text,_to.text,));
      // holder = dropdownValue ;
    });
  }


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
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  FlatButton(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
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
                        "Manage Schedule",
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              isExpanded: true,
                              value: dropdownValue,
                              onChanged: (data) {
                                setState(() {
                                  dropdownValue = data!;
                                });
                              },
                              items: actorsName.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(value),
                                  ),
                                );
                              }).toList(),
                            ),
                        ),

                      ),

                  ),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30, bottom: 5),
              child: Text("Select time",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _selectTime(context);
                        },
                        child: Text("From: "),
                      ),
                      SizedBox(
                        width: 20
                      ),
                      Container(
                        height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(
                            child: Text("${selectedTime.hour}:${selectedTime.minute}",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _Time(context);
                        },
                        child: Text("To: "),
                      ),
                      SizedBox(
                          width: 20
                      ),
                      Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(
                            child: Text("${selectedTime.hour}:${selectedTime.minute}",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                          ),

                      ),
                    ],
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
                      getDropDownItem();
                      addItemToList();
                      _from.clear();
                      _to.clear();
                      // _dose.clear();
                      // _day.clear();
                      // _quantity.clear();
                    },
                    child: Text('SUBMIT',
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
                  padding: const EdgeInsets.all(8),
                  itemCount: manageSchedule.length,
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
                                              child: Row(
                                                children: [
                                                  Text("Day:  ",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                  ),
                                                  Text('$holder',),
                                                ],
                                              )),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  padding: EdgeInsets.only(right: 10, top: 20),
                                                  alignment:Alignment.centerLeft,
                                                  child: Row(
                                                    children: [
                                                      Text("From: ",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                      Container(
                                                          height: 30,
                                                          width: 50,
                                                          padding: EdgeInsets.only(top: 5),
                                                          child: Text("${selectedTime.hour}:${selectedTime.minute}",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight: FontWeight.bold
                                                            ),
                                                          )),
                                                    ],
                                                  )),

                                              Container(
                                                  padding: EdgeInsets.only(right: 10, top: 20),
                                                  alignment:Alignment.centerLeft,
                                                  child: Row(
                                                    children: [
                                                      Text("To: ",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                      Container(
                                                          height: 30,
                                                          width: 50,
                                                          padding: EdgeInsets.only(top: 5),
                                                          child: Text("${selectedTime.hour}:${selectedTime.minute}",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight: FontWeight.bold
                                                            ),
                                                          )),
                                                    ],
                                                  )),
                                            ],
                                          ),


                                          SizedBox(
                                              height: 15
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
                                  manageSchedule.remove(manageSchedule[index]);
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
