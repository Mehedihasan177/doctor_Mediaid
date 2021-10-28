import 'package:care_plus_doctor/data/my_profile_data/my_profile_data.dart';
import 'package:care_plus_doctor/model/ui_model/my_profile_model/my_profile_dropdown.dart';
import 'package:care_plus_doctor/model/ui_model/my_profile_model/my_profile_model.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/widget/my_profile_widget/my_profile_widget.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  List<MyProfileModel> myProfile = List.of(myProfileData);
  bool _checkbox = false;
  NewObject value = myProfileDropdown.first;
  NewObject1 valueone = myProfileDropdown1.first;
  final notifications = [
    CheckBoxAny(title: 'Show Message'),
    CheckBoxAny(title: 'Show Group'),
    CheckBoxAny(title: 'Show Calling'),
  ];

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
                        "Wallet",
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


            Row(
              children: [
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    // height: 750,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
                        shrinkWrap: true,
                        //controller: PageController(viewportFraction: 0.3),
                        scrollDirection: Axis.vertical,
                        itemCount: myProfile.length,
                        itemBuilder: (context,index) {
                          return MyProfileWidget(myProfile[index], context);
                        }
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20,),

            Flexible(
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: Color(0xFF1CBFA8),
                        value: _checkbox,
                        onChanged: (value) {
                          setState(() {
                            _checkbox = !_checkbox;
                          });
                        },
                      ),
                      Text("Mon", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)
                      ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.054,
                          width: MediaQuery.of(context).size.width * 0.27,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<NewObject>(
                              isExpanded: true,
                              value: value, // currently selected item
                              items: myProfileDropdown
                                  .map((item) => DropdownMenuItem<NewObject>(
                                child: Row(
                                  children: [
                                    const SizedBox(width: 8),
                                    Text(
                                      item.title,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ],
                                ),
                                value: item,
                              ))
                                  .toList(),
                              onChanged: (value) => setState(() {
                                this.value = value!;
                              }),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text("to", style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.5)
                        ),
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.054,
                          width: MediaQuery.of(context).size.width * 0.27,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<NewObject1>(
                              isExpanded: true,
                              value: valueone, // currently selected item
                              items: myProfileDropdown1
                                  .map((myProfileDropdown1) => DropdownMenuItem<NewObject1>(
                                child: Row(
                                  children: [
                                    const SizedBox(width: 8),
                                    Text(
                                      myProfileDropdown1.title1,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ],
                                ),
                                value: myProfileDropdown1,
                              ))
                                  .toList(),
                              onChanged: (valueone) => setState(() {
                                this.valueone = valueone!;
                              }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            SizedBox(height: 10,),
            Flexible(
              child: Row(
                children: [
                  Checkbox(
                    activeColor: Color(0xFF1CBFA8),
                    value: _checkbox,
                    onChanged: (value) {
                      setState(() {
                        _checkbox = !_checkbox;
                      });
                    },
                  ),
                  Text("Tue", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5)
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.054,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<NewObject>(
                          isExpanded: true,
                          value: value, // currently selected item
                          items: myProfileDropdown
                              .map((item) => DropdownMenuItem<NewObject>(
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Text(
                                  item.title,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            ),
                            value: item,
                          ))
                              .toList(),
                          onChanged: (value) => setState(() {
                            this.value = value!;
                          }),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text("to", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)
                    ),
                    ),

                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.054,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<NewObject1>(
                          isExpanded: true,
                          value: valueone, // currently selected item
                          items: myProfileDropdown1
                              .map((myProfileDropdown1) => DropdownMenuItem<NewObject1>(
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Text(
                                  myProfileDropdown1.title1,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            ),
                            value: myProfileDropdown1,
                          ))
                              .toList(),
                          onChanged: (valueone) => setState(() {
                            this.valueone = valueone!;
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Flexible(
              child: Row(
                children: [
                  Checkbox(
                    activeColor: Color(0xFF1CBFA8),
                    value: _checkbox,
                    onChanged: (value) {
                      setState(() {
                        _checkbox = !_checkbox;
                      });
                    },
                  ),
                  Text("Wed", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5)
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.054,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<NewObject>(
                          isExpanded: true,
                          value: value, // currently selected item
                          items: myProfileDropdown
                              .map((item) => DropdownMenuItem<NewObject>(
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Text(
                                  item.title,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            ),
                            value: item,
                          ))
                              .toList(),
                          onChanged: (value) => setState(() {
                            this.value = value!;
                          }),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text("to", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)
                    ),
                    ),

                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.054,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<NewObject1>(
                          isExpanded: true,
                          value: valueone, // currently selected item
                          items: myProfileDropdown1
                              .map((myProfileDropdown1) => DropdownMenuItem<NewObject1>(
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Text(
                                  myProfileDropdown1.title1,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            ),
                            value: myProfileDropdown1,
                          ))
                              .toList(),
                          onChanged: (valueone) => setState(() {
                            this.valueone = valueone!;
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Flexible(
              child: Row(
                children: [
                  Checkbox(
                    activeColor: Color(0xFF1CBFA8),
                    value: _checkbox,
                    onChanged: (value) {
                      setState(() {
                        _checkbox = !_checkbox;
                      });
                    },
                  ),
                  Text("Thu", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5)
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.054,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<NewObject>(
                          isExpanded: true,
                          value: value, // currently selected item
                          items: myProfileDropdown
                              .map((item) => DropdownMenuItem<NewObject>(
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Text(
                                  item.title,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            ),
                            value: item,
                          ))
                              .toList(),
                          onChanged: (value) => setState(() {
                            this.value = value!;
                          }),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text("to", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)
                    ),
                    ),

                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.054,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<NewObject1>(
                          isExpanded: true,
                          value: valueone, // currently selected item
                          items: myProfileDropdown1
                              .map((myProfileDropdown1) => DropdownMenuItem<NewObject1>(
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Text(
                                  myProfileDropdown1.title1,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            ),
                            value: myProfileDropdown1,
                          ))
                              .toList(),
                          onChanged: (valueone) => setState(() {
                            this.valueone = valueone!;
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Flexible(
              child: Row(
                children: [
                  Checkbox(
                    activeColor: Color(0xFF1CBFA8),
                    value: _checkbox,
                    onChanged: (value) {
                      setState(() {
                        _checkbox = !_checkbox;
                      });
                    },
                  ),
                  Text("Fri", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5)
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.054,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<NewObject>(
                          isExpanded: true,
                          value: value, // currently selected item
                          items: myProfileDropdown
                              .map((item) => DropdownMenuItem<NewObject>(
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Text(
                                  item.title,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            ),
                            value: item,
                          ))
                              .toList(),
                          onChanged: (value) => setState(() {
                            this.value = value!;
                          }),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text("to", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)
                    ),
                    ),

                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.054,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<NewObject1>(
                          isExpanded: true,
                          value: valueone, // currently selected item
                          items: myProfileDropdown1
                              .map((myProfileDropdown1) => DropdownMenuItem<NewObject1>(
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Text(
                                  myProfileDropdown1.title1,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            ),
                            value: myProfileDropdown1,
                          ))
                              .toList(),
                          onChanged: (valueone) => setState(() {
                            this.valueone = valueone!;
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Flexible(
              child: Row(
                children: [
                  Checkbox(
                    activeColor: Color(0xFF1CBFA8),
                    value: _checkbox,
                    onChanged: (value) {
                      setState(() {
                        _checkbox = !_checkbox;
                      });
                    },
                  ),
                  Text("Sat", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5)
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 17),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.054,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<NewObject>(
                          isExpanded: true,
                          value: value, // currently selected item
                          items: myProfileDropdown
                              .map((item) => DropdownMenuItem<NewObject>(
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Text(
                                  item.title,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            ),
                            value: item,
                          ))
                              .toList(),
                          onChanged: (value) => setState(() {
                            this.value = value!;
                          }),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text("to", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)
                    ),
                    ),

                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.054,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<NewObject1>(
                          isExpanded: true,
                          value: valueone, // currently selected item
                          items: myProfileDropdown1
                              .map((myProfileDropdown1) => DropdownMenuItem<NewObject1>(
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Text(
                                  myProfileDropdown1.title1,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            ),
                            value: myProfileDropdown1,
                          ))
                              .toList(),
                          onChanged: (valueone) => setState(() {
                            this.valueone = valueone!;
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Flexible(
              child: Row(
                children: [
                  Checkbox(
                    activeColor: Color(0xFF1CBFA8),
                    value: _checkbox,
                    onChanged: (value) {
                      setState(() {
                        _checkbox = !_checkbox;
                      });
                    },
                  ),
                  Text("Sun", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5)
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.054,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<NewObject>(
                          isExpanded: true,
                          value: value, // currently selected item
                          items: myProfileDropdown
                              .map((item) => DropdownMenuItem<NewObject>(
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Text(
                                  item.title,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            ),
                            value: item,
                          ))
                              .toList(),
                          onChanged: (value) => setState(() {
                            this.value = value!;
                          }),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text("to", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)
                    ),
                    ),

                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.054,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<NewObject1>(
                          isExpanded: true,
                          value: valueone, // currently selected item
                          items: myProfileDropdown1
                              .map((myProfileDropdown1) => DropdownMenuItem<NewObject1>(
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Text(
                                  myProfileDropdown1.title1,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            ),
                            value: myProfileDropdown1,
                          ))
                              .toList(),
                          onChanged: (valueone) => setState(() {
                            this.valueone = valueone!;
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            SizedBox(height: 30,),

            Center(
              child: Container(
                child: ElevatedButton(
                  child: Text(
                    "Update",
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

            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}


