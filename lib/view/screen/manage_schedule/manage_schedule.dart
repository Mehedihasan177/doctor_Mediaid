import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_appointment_create_controller.dart';
import 'package:care_plus_doctor/helper/snackbarDialouge.dart';
import 'package:care_plus_doctor/model/doctor/doctor_appointment_create_slot_model.dart';
import 'package:care_plus_doctor/model/manage_schedule_model/manage_schedule_model.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';

import 'manage_schedule_model.dart';

class ManageSchedule extends StatefulWidget {
  const ManageSchedule({Key? key}) : super(key: key);

  @override
  _ManageScheduleState createState() => _ManageScheduleState();
}

class _ManageScheduleState extends State<ManageSchedule> {


  List<ManageScheduleModel> manageSchedule = [];
  // TimeOfDay selectedTime = TimeOfDay.now();
  // TimeOfDay selectedTimeone = TimeOfDay.now();
// Default Drop Down Item.
  String dropdownValue = 'Sunday';
  String myCurrentPos = 'Sunday';
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

      manageSchedule.add(ManageScheduleModel(myCurrentPos,startTime.format(context),endTime.format(context),));
      // holder = dropdownValue ;
    });
  }

  @override
  void initState() {

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
                // width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      // getDropDownItem();
                      addItemToList();
                      addVisitingTime(myCurrentPos.substring(0,3),startTime,endTime);
                    },
                    child: Text('Add Visiting Time',
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
              padding: EdgeInsets.all(10),

              child: Text('List of Visiting Times',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ),

            Container(
              // height: 420,
              child: ListView.builder(
                shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: manageSchedule.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: ListTile(
                        title: Text('${manageSchedule[index].day}'),
                        leading: Icon(Icons.access_time_filled),
                        trailing: GestureDetector(
                            child: Icon(Icons.delete),
                          onTap: (){
                              setState(() {
                                manageSchedule.remove(manageSchedule[index]);
                              });
                          },
                        ),
                        subtitle: Text('From ${manageSchedule[index].from} To ${manageSchedule[index].to}'),

                      ),
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
                  DateFormat.Hm().format(DateFormat.jm().parse(currentTime.format(context))),
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

  void addVisitingTime(String myCurrentPos, TimeOfDay startTime, TimeOfDay endTime) {

    DoctorAppointmentCreateSlotController
        .requestThenResponsePrint(DoctorAppointmentCreateSlotModel(
          day:myCurrentPos,
      start_time: DateFormat.Hms().format(DateFormat.jm().parse(startTime.format(context))),
      end_time: DateFormat.Hms().format(DateFormat.jm().parse(endTime.format(context))),
    ), USERTOKEN).then((value) {
       print(value.statusCode);
        if(value.statusCode==201){
          SnackbarDialogueHelper().showSnackbarDialog(context, 'TimeSlot Added Successfully', Colors.green);
       }else{
          SnackbarDialogueHelper().showSnackbarDialog(context, 'Could not added successfully', Colors.red);
          // SnackbarDialogueHelper().showSnackbarDialog(context, value.body, Colors.red);
       }
    });
  }
}
