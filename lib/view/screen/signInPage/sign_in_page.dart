import 'package:care_plus_doctor/view/screen/appointmnet_list/appointment_list_ui.dart';
import 'package:care_plus_doctor/view/screen/change_password/change_password.dart';
import 'package:care_plus_doctor/view/screen/forget_password/forget_password.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/sing_up_page/sign_up_page.dart';
import 'package:flutter/material.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({Key? key}) : super(key: key);

  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  TextEditingController _textEmail = TextEditingController();
  TextEditingController _textPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 200,
              width: 200,
              child: Image(
                image: AssetImage("images/care_plus_doctor_logo.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.email,
                      size: 18,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                TextField(
                  controller: _textEmail,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  //scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.all(20),
                    hintText: "Enter your email address",
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.lock,
                      size: 18,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                TextField(
                  controller: _textEmail,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  //scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.all(20),
                    hintText: "Enter your password",
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              child: ElevatedButton(
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 59),
                  maximumSize: const Size(350, 59),
                  primary: Color(0xFF1CBFA8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              decoration: BoxDecoration(
                  //color: Color(0xF60D72),
                  borderRadius: BorderRadius.circular(18)),
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: FlatButton(
              minWidth: 10,
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => ForgetPassword()));
              },
              child: Text(
                "Forget Password?",
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(0.5)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Text("Or Sign in with"),
                Expanded(
                    child: Divider(
                  color: Colors.black,
                ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  minWidth: 5,
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //     context, MaterialPageRoute(builder: (context) => DoctorCatagory()));
                  },
                  child: Image.asset(
                    "images/google.png",
                    height: 30,
                    width: 30,
                  ),
                ),


                FlatButton(
                  minWidth: 5,
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //     context, MaterialPageRoute(builder: (context) => DoctorCatagory()));
                  },
                  child: Image.asset(
                    "images/facebook.png",
                    height: 30,
                    width: 30,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Haven't any?",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.5)),
                ),
               FlatButton(
                    minWidth: 10,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => SingUpPage()));
                    },
                    child: Text(
                      "Create an account",
                      style: TextStyle(
                          fontSize: 16, color: Color(0xFF1CBFA8)),
                    ),
                  ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
