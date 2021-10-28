import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdvicePage extends StatefulWidget {
  const AdvicePage({Key? key}) : super(key: key);

  @override
  _AdvicePageState createState() => _AdvicePageState();
}

class _AdvicePageState extends State<AdvicePage> {
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: WillPopScope(

        onWillPop: () async {
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
          return true;
        },
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: (){},
            child: Icon(Icons.arrow_forward_ios),
            backgroundColor: const Color(0xFF1CBFA8),
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
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
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
                child: Text("Advice",
                  style: TextStyle(
                      fontSize: 17
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 4,
                      child: TextField(
                        //controller: _textEmail,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.black),
                        //scrollPadding: EdgeInsets.all(10),
                        decoration: InputDecoration(
                          //contentPadding: EdgeInsets.all(20),
                          hintText: "Enter your password",
                        ),
                      ),

                    ),
                    Expanded(
                      flex: 1,
                      child:ElevatedButton(
                        onPressed: () {},
                        child: Text('+'),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(14),
                         primary: Color(0xFF1CBFA8),
                        )
                      ),
                    ),

                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
