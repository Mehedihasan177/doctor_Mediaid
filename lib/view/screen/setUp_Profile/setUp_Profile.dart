import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_registration_controller.dart';
import 'package:care_plus_doctor/controller/doctor/setup_profile_controller.dart';
import 'package:care_plus_doctor/data/doctor_appointment_data/doctor_about_and_appointment_data.dart';
import 'package:care_plus_doctor/helper/alertDialogue.dart';
import 'package:care_plus_doctor/model/setup_profile_model.dart';
import 'package:care_plus_doctor/model/ui_model/doctor_appointment_model/doctor_about_and_appointment_model.dart';
import 'package:care_plus_doctor/view/screen/otp/otp.dart';
import 'package:care_plus_doctor/widget/doctor_about_and_appointment_widget/doctor_about_and_appointment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({Key? key}) : super(key: key);

  @override
  _SetupProfileState createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  TextEditingController _name = TextEditingController();
  TextEditingController _specialization = TextEditingController();
  TextEditingController _ahpra = TextEditingController();
  TextEditingController _designation = TextEditingController();
  TextEditingController _fee = TextEditingController();
  TextEditingController _chember = TextEditingController();
  TextEditingController _introduction = TextEditingController();
  bool checkbox = false;
  final maxLines = 15;
  List<DoctorAppointmentModel> doctorAppointment = List.of(doctor_appointment_data);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => OTPpage()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          children:[
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Text("Set up your profile",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black.withOpacity(0.5),
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20),
              child: Text("Update your profile picture or renew informaton",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Stack(
                children:
                [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   GestureDetector(
                        onTap: (){},
                        child: Container(
                          height: 130,
                          width: 120,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black.withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black.withOpacity(0.07),
                          ), //BoxDecoration
                        ),
                      ), //Container

                  ],
                ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 115),
                      child: Image.asset("images/camera.png", height: 30,width: 30,),
                    ),
                  ),
              ]
              ),
            ),

            SizedBox(
              height: 40,
            ),

            Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text("Name",
                        style: TextStyle(
                          fontSize: 17
                        ),
                        ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 10),
                    child: TextField(
                      controller: _name,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      //scrollPadding: EdgeInsets.all(10),
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.all(20),
                        hintText: "Enter your name",
                      ),
                    ),
                  ),
                ],
              ),


            SizedBox(
              height: 40,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: Text("Specialization",
                          style: TextStyle(
                            fontSize: 15
                          ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 23, right: 10, top: 8),
                        child: Center(
                          child: Container(
                            child: TextField(
                              // controller: _textEmail,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black),
                              //scrollPadding: EdgeInsets.all(10),
                              decoration: InputDecoration(
                                //contentPadding: EdgeInsets.all(20),
                                hintText: "Enter Specialization",
                                hintStyle: TextStyle(
                                  fontSize: 10
                                )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: Text("AHPRA no.")),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                        child: Center(
                          child: Container(
                            child: TextField(
                              // controller: _textEmail,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black),
                              //scrollPadding: EdgeInsets.all(10),
                              decoration: InputDecoration(
                                //contentPadding: EdgeInsets.all(20),
                                hintText: "Enter AHPRA no.",
                                  hintStyle: TextStyle(
                                      fontSize: 10
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),


            SizedBox(
              height: 40,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: Text("Designation",
                            style: TextStyle(
                                fontSize: 15
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10, top: 8),
                        child: Center(
                          child: Container(
                            child: TextField(
                              // controller: _textEmail,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black),
                              //scrollPadding: EdgeInsets.all(10),
                              decoration: InputDecoration(
                                //contentPadding: EdgeInsets.all(20),
                                  hintText: "Enter your designation",
                                  hintStyle: TextStyle(
                                      fontSize: 10
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: Text("Fee")),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                        child: Center(
                          child: Container(
                            child: TextField(
                              // controller: _textEmail,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black),
                              //scrollPadding: EdgeInsets.all(10),
                              decoration: InputDecoration(
                                //contentPadding: EdgeInsets.all(20),
                                  hintText: "Enter your fee",
                                  hintStyle: TextStyle(
                                      fontSize: 10
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),


            SizedBox(height: 20,),

            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.black.withOpacity(0.5),),
                        Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            child: Text("Chamber")),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Center(
                      child: Container(
                        child: TextField(
                          // controller: _textEmail,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.black),
                          //scrollPadding: EdgeInsets.all(10),
                          decoration: InputDecoration(
                            //contentPadding: EdgeInsets.all(20),
                              hintText: "Enter your fee",
                              hintStyle: TextStyle(
                                  fontSize: 10
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Expanded(
              child: Column(
                children: [
                  Container(
                            padding: EdgeInsets.only(left: 35),
                            alignment: Alignment.centerLeft,
                            child: Text("Introduction")),


                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Center(
                      child: Container(
                        child:
                        Container(
                          margin: EdgeInsets.all(12),
                          height: maxLines * 6.0,
                          // decoration: BoxDecoration(
                          //     border: Border.all(),
                          //     borderRadius: BorderRadius.all(Radius.circular(10))
                          // ),
                          child: TextField(
                            maxLines: maxLines,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              //hintText: "Enter a message",
                              fillColor: Colors.white,
                              //filled: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Row(
            //   children: [
            //     Flexible(
            //       child: Container(
            //         //padding: EdgeInsets.only(left: 20),
            //         alignment: Alignment.centerLeft,
            //         child: ListView.builder(
            //           shrinkWrap: true,
            //           physics: NeverScrollableScrollPhysics(),
            //           //controller: PageController(viewportFraction: 0.3),
            //             scrollDirection: Axis.vertical,
            //             itemCount: doctorAppointment.length,
            //             itemBuilder: (context,index) {
            //               //var information = carePlushPrescriptionList[index];
            //               return DoctorAboutAppointmentWidget(
            //                   doctorAppointment[index], context);
            //
            //             }
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: ElevatedButton(
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async{

                  EasyLoading.show(status: 'loading...');
                  SetUpProfile myInfo = new SetUpProfile(
                      name: _name.text,
                      specialization: _specialization.text,
                      bmdcReg: _ahpra.text,
                      designation: _designation.text,
                      fee: _fee.text,
                      chambers: _chember.text,
                      introduction: _introduction.text,

                  );
                  //EasyLoading.show(status: 'loading...');
                  await DoctorSetupProfileController.requestThenResponsePrint(myInfo, USERTOKEN).then((value) async {
                    print(value.statusCode);
                    print(value.body);
                    EasyLoading.dismiss();
                    if(value.statusCode==200){
                      AlertDialogueHelper().showAlertDialog(context, 'Success', "successfully set up your profile");
                      //return Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SetupProfile()),);

                    }else{
                      AlertDialogueHelper().showAlertDialog(context, 'Warning', value.body.replaceAll('"', ' ')
                          .replaceAll('{', ' ')
                          .replaceAll('}', ' ')
                          .replaceAll('[', ' ')
                          .replaceAll(']', ' '));
                    }
                  });

                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 59),
                  //maximumSize: const Size(350, 59),
                  primary: Color(0xFF1CBFA8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              decoration: BoxDecoration(
                //color: Color(0xF60D72),
                  borderRadius: BorderRadius.circular(18)),
            ),
          ]
        ),
      ),
    );
  }


}
