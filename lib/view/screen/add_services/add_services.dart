import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_signIn_controller.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_specialization_controller.dart';
import 'package:care_plus_doctor/controller/doctor/setup_profile_controller.dart';
import 'package:care_plus_doctor/helper/alertDialogue.dart';
import 'package:care_plus_doctor/helper/snackbarDialouge.dart';
import 'package:care_plus_doctor/model/doctor/doctor_sinIn_model.dart';
import 'package:care_plus_doctor/model/setup_profile_model.dart';
import 'package:care_plus_doctor/model/ui_model/my_profile_model/checkboxany.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_specialization_responses.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/setUp_Profile/setup_profile_controller.dart';
import 'package:flutter/material.dart';




class AddServicesPage extends StatefulWidget {
  const AddServicesPage({Key? key}) : super(key: key);

  @override
  _AddServicesPageState createState() => _AddServicesPageState();
}

class _AddServicesPageState extends State<AddServicesPage> {


  List<DoctorSpecializationResponse> doctorSpecializationlist = [];
  List<bool> specialityStatusList = [];
  List<String> specialityCurrentList = [];
  List<int> specialityToUpdateList = [];
  _getSpecialization() async {

    DoctorSpecializationController.requestThenResponsePrint().then((value){
      print(value.statusCode);
      print(value.body);


      setState(() {
        Iterable list = json.decode("${value.body}");
        doctorSpecializationlist = list.map((model) => DoctorSpecializationResponse.fromJson(model)).toList();
        print(doctorSpecializationlist);

        specialityStatusList.clear();
        // specialityCurrentList.clear();
        for(var item in doctorSpecializationlist){
          if(specialityCurrentList.contains(item.name)){
            specialityStatusList.add(true);
          }else{
            specialityStatusList.add(false);
          }
        }
      });
    });
  }

  @override
  void initState() {
    getCurrentSpecialization();
    _getSpecialization();
    super.initState();
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
              onPressed: () {
                specialityToUpdateList.clear();
                String toGO = "";
                for(int i=0; i<specialityStatusList.length;i++){
                  if(specialityStatusList[i]==true){
                    specialityToUpdateList.add(doctorSpecializationlist[i].id);
                    toGO+=doctorSpecializationlist[i].name+',';
                  }
                }

                if(specialityToUpdateList.length !=0){
                  Map dataMap = {
                    'specializations': specialityToUpdateList,
                  };
                  // SetUpProfile setup = new SetUpProfile(
                  //     gender: "",
                  //     chambers: "",
                  //     specialization: "",
                  //     introduction: "",
                  //     designation: "",
                  //     hospitalName: "",
                  //     fee: '',
                  //     address: '',
                  //     department: '',
                  //     degree: '',
                  //     experience: ''
                  //
                  // );


                  print('sessssss');

                  SetupSpecializationController.requestThenResponsePrint(
                    USERTOKEN,
                    dataMap,
                  ).then((value) async {
                    print(value.statusCode);
                    print(value.body);

                    //EasyLoading.dismiss();
                    if(value.statusCode==200){
                      //return Navigator.push(context,MaterialPageRoute(builder: (context) => SetupProfile()),);
                      // SnackbarDialogueHelper().showSnackbarDialog(context, 'successfully updated specializations', Colors.green);

                      DoctorSignInModel myInfo = new DoctorSignInModel(
                          mobile: PHONE_NUMBER, password: PASSWORD);
                      // EasyLoading.show(status: 'loading...');
                      await DoctorSigninController.requestThenResponsePrint(myInfo).then((value){
                        setState(() {
                          // SnackbarDialogueHelper().showSnackbarDialog(context, 'successfully signed in', Colors.green);
                          SnackbarDialogueHelper().showSnackbarDialog(context, 'successfully updated specializations', Colors.green);

                        });
                      });

                    }else{
                      SnackbarDialogueHelper().showSnackbarDialog(context, value.body.replaceAll('"', ' ')
                          .replaceAll('{', ' ')
                          .replaceAll('}', ' ')
                          .replaceAll('[', ' ')
                          .replaceAll(']', ' '), Colors.red);
                    }
                  });

                }


                else{
                  SnackbarDialogueHelper().showSnackbarDialog(context, "Please Select items", Colors.blue);
                }

              },
            ),
          ),
        appBar: AppBar(
          title: Text("Doctor Specialization"),
          backgroundColor: Color(0xFF1CBFA8),
        ),
          body: SafeArea(
            child: ListView(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),

              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: doctorSpecializationlist.length,
                    itemBuilder: (context,index){
                      return Container(
                        child: ListTile(
                          title:AutoSizeText(doctorSpecializationlist[index].name,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),

                          ),

                          leading: Checkbox(
                              activeColor: Colors.green,
                              checkColor: Colors.white,
                              /*side: MaterialStateBorderSide.resolveWith(
                                                    (states) => BorderSide(width: 1.0, color: Colors.green,style:BorderStyle.solid, weight ),

                                              ),*/

                              value: specialityStatusList[index], onChanged: (newValue){
                            setState(() {
                              specialityStatusList[index] = newValue!;
                            });
                          }


                          ),
                          trailing: Container(
                            height: 30,
                            width: 30,
                            child: Image.network(
                                //doctorSpecializationlist[index].icon
                              "$apiDomainRoot/${doctorSpecializationlist[index].icon}",
                              //"$apiDomainRoot/images/${doctorAppointmentHistory.user.image}",
                            ),
                          )
                          // subtitle: Text('From ${manageSchedule[index].from} To ${manageSchedule[index].to}'),

                        ),
                      );
                    },
                  ),
                ),







                // Padding(
                //   padding: const EdgeInsets.only(bottom: 0),
                //   child: Center(
                //     child: Container(
                //       child: ElevatedButton(
                //         child: Text(
                //           "Submit",
                //           style: TextStyle(color: Colors.white, fontSize: 20),
                //         ),
                //         onPressed: () {
                //           specialityToUpdateList.clear();
                //           String toGO = "";
                //           for(int i=0; i<specialityStatusList.length;i++){
                //             if(specialityStatusList[i]==true){
                //               specialityToUpdateList.add(doctorSpecializationlist[i].id);
                //               toGO+=doctorSpecializationlist[i].name+',';
                //             }
                //           }
                //
                //           if(specialityToUpdateList.length !=0){
                //             Map dataMap = {
                //               'specializations': specialityToUpdateList,
                //             };
                //             // SetUpProfile setup = new SetUpProfile(
                //             //     gender: "",
                //             //     chambers: "",
                //             //     specialization: "",
                //             //     introduction: "",
                //             //     designation: "",
                //             //     hospitalName: "",
                //             //     fee: '',
                //             //     address: '',
                //             //     department: '',
                //             //     degree: '',
                //             //     experience: ''
                //             //
                //             // );
                //
                //
                //             print('sessssss');
                //
                //             DoctorSetupProfileController.requestThenResponsePrint(
                //               USERTOKEN,
                //               dataMap,
                //             ).then((value) async {
                //               print(value.statusCode);
                //               print(value.body);
                //
                //               //EasyLoading.dismiss();
                //               if(value.statusCode==200){
                //                 //return Navigator.push(context,MaterialPageRoute(builder: (context) => SetupProfile()),);
                //                 // SnackbarDialogueHelper().showSnackbarDialog(context, 'successfully updated specializations', Colors.green);
                //
                //                 DoctorSignInModel myInfo = new DoctorSignInModel(
                //                     mobile: PHONE_NUMBER, password: PASSWORD);
                //                 // EasyLoading.show(status: 'loading...');
                //                 await DoctorSigninController.requestThenResponsePrint(myInfo).then((value){
                //                   setState(() {
                //                     // SnackbarDialogueHelper().showSnackbarDialog(context, 'successfully signed in', Colors.green);
                //                     SnackbarDialogueHelper().showSnackbarDialog(context, 'successfully updated specializations', Colors.green);
                //
                //                   });
                //                 });
                //
                //               }else{
                //                 SnackbarDialogueHelper().showSnackbarDialog(context, value.body.replaceAll('"', ' ')
                //                     .replaceAll('{', ' ')
                //                     .replaceAll('}', ' ')
                //                     .replaceAll('[', ' ')
                //                     .replaceAll(']', ' '), Colors.red);
                //               }
                //             });
                //
                //           }
                //
                //
                //           else{
                //             SnackbarDialogueHelper().showSnackbarDialog(context, "Please Select items", Colors.blue);
                //           }
                //
                //         },
                //         style: ElevatedButton.styleFrom(
                //           minimumSize: const Size(390, 59),
                //           //maximumSize: const Size(350, 59),
                //           primary: Color(0xFF1CBFA8),
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(15)),
                //         ),
                //       ),
                //       decoration: BoxDecoration(
                //         //color: Color(0xF60D72),
                //           borderRadius: BorderRadius.circular(18)),
                //     ),
                //   ),
                // ),

              ],
            ),
          )
      ),
    );
  }

  void getCurrentSpecialization() {

    String spec = DOCTOR_INITIAL.specialization;
    if(spec != null) {
      specialityCurrentList.clear();
      specialityCurrentList = spec.split(',');
    }

  }

 }







