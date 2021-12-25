import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class ChangePasswordSuccessfully extends StatefulWidget {
  const ChangePasswordSuccessfully({Key? key}) : super(key: key);

  @override
  _ChangePasswordSuccessfullyState createState() => _ChangePasswordSuccessfullyState();
}

class _ChangePasswordSuccessfullyState extends State<ChangePasswordSuccessfully> {


  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM   kk:mm:ss').format(now);
    return WillPopScope(

      onWillPop: () async {
        //Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/success.png"),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text("Congratulations",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("You have changed your password\n                 successfully",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1CBFA8)
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 5),
              //   child: Text("S.K Abir has been booked successfully",
              //     style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.bold,
              //         color: Color(0xFF1CBFA8)
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 5),
              //   child: Text("On  "  + formattedDate,
              //     style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.bold,
              //         color: Color(0xFF1CBFA8)
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
