import 'package:care_plus_doctor/view/screen/manage_schedule/manage_schedule_model.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:flutter/material.dart';

import 'model/manage_schedule_model/manage_schedule_model.dart';


class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  TextEditingController _from = TextEditingController();
  TextEditingController _to = TextEditingController();

  List<ManageScheduleModel> manageSchedule = [];
  // TimeOfDay selectedTime = TimeOfDay.now();
  // TimeOfDay selectedTimeone = TimeOfDay.now();
// Default Drop Down Item.
  String dropdownValue = 'Sunday';
  String myCurrentPos = '';
  // To show Selected Item in Text.
  String holder = '' ;

  DayModel position = dayModel.first;


  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();




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
  void addItemToListone() {
    setState(() {
      //valuetwo = [] as NewObject2;
      manageSchedule.add(ManageScheduleModel(_from.text,_to.text,));
      // holder = dropdownValue ;
    });
  }


  @override
  void initState() {

    addItemToList();
    addItemToListone();
    // TODO: implement initState
    super.initState();
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
                        child: DropdownButton<DayModel>(
                          isExpanded: true,
                          value: position, // currently selected item
                          items: dayModel
                              .map((item) =>
                              DropdownMenuItem<DayModel>(
                                child: Row(
                                  children: [
                                    const SizedBox(width: 8),
                                    Text(
                                      item.title,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                value: item,
                              ))
                              .toList(),
                          onChanged: (value) => setState(() {
                            this.position = value!;
                            print(this.position.title);
                            print(this.position.posID);

                            myCurrentPos = this.position.title;
                          }),
                        ),



                        // DropdownButton<String>(
                        //     isExpanded: true,
                        //     value: dropdownValue,
                        //     onChanged: (data) {
                        //       setState(() {
                        //         dropdownValue = data!;
                        //       });
                        //     },
                        //     items: actorsName.map<DropdownMenuItem<String>>((String value) {
                        //       return DropdownMenuItem<String>(
                        //         value: value,
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(left: 10),
                        //           child: Text(value),
                        //         ),
                        //       );
                        //     }).toList(),
                        //   ),
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
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  _buildTimePick("Start", true, startTime, (x) {
                    setState(() {
                      startTime = x;
                      print("The picked time is: $x");
                    });
                  }),
                  const SizedBox(width: 20),
                  _buildTimePick("End", true, endTime, (x) {
                    setState(() {
                      endTime = x;
                      print("The picked time is: $x");
                    });
                  }),
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
                                                  Text('$myCurrentPos',),
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
                                                          child: Text("${startTime.hour}:${startTime.minute}",
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
                                                          child: Text("${endTime.hour}:${endTime.minute}",
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
  Future selectedTime(BuildContext context, bool ifPickedTime,
      TimeOfDay initialTime, Function(TimeOfDay) onTimePicked) async {
    var _pickedTime =
    await showTimePicker(context: context, initialTime: initialTime);
    if (_pickedTime != null) {
      onTimePicked(_pickedTime);
    }
  }

  Widget _buildTimePick(String title, bool ifPickedTime, TimeOfDay currentTime,
      Function(TimeOfDay) onTimePicked) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: Text(
            title,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(20),
          ),
          child: GestureDetector(
            child: Text(
              currentTime.format(context),
            ),
            onTap: () {
              selectedTime(context, ifPickedTime, currentTime, onTimePicked);

            },
              //print(selectedTime(context, ifPickedTime, currentTime, onTimePicked));
          ),
        ),
      ],
    );
  }
}

