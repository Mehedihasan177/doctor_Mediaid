import 'package:care_plus_doctor/model/ui_model/my_profile_model/my_profile_dropdown.dart';
import 'package:flutter/material.dart';

class AddServicesPage extends StatefulWidget {
  const AddServicesPage({Key? key}) : super(key: key);

  @override
  _AddServicesPageState createState() => _AddServicesPageState();
}

class _AddServicesPageState extends State<AddServicesPage> {


  final checkboxany = [
    CheckBoxAny(title: 'Hypertension Treatment'),
    CheckBoxAny(title: 'COPD Treatment'),
    CheckBoxAny(title: 'Diabetes Management'),
    CheckBoxAny(title: 'ECG'),
    CheckBoxAny(title: 'Obesity Treatment'),
    CheckBoxAny(title: 'Health Checkup (General)'),
    CheckBoxAny(title: 'Hypertension Treatment'),
    CheckBoxAny(title: 'COPD Treatment'),
    CheckBoxAny(title: 'Diabetes Management'),
    CheckBoxAny(title: 'ECG'),
    CheckBoxAny(title: 'Obesity Treatment'),
    CheckBoxAny(title: 'Health Checkup (General)'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
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
                    //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: Text(
                      "Add Services",
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
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Container(
                // height: 55,
                margin: EdgeInsets.only(left: 10,right: 10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 14),
                    border: InputBorder.none,
                    hintText: "Search Services",
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 15),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25,
                      color: Color(0xFF1CBFA8),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
            child: Text("Select Services to add",
            style: TextStyle(
              fontSize: 18,
            ),
            ),
          ),


          Divider(),
          ...checkboxany.map(buildSingleCheckbox).toList(),


        ],
      ),
    );
  }



  Widget buildSingleCheckbox(CheckBoxAny checkboxany) => buildCheckbox(
    checkboxany: checkboxany,
    onClicked: () {
      setState(() {
        final newValue = !checkboxany.value;
        checkboxany.value = newValue;

      });
    },
  );

  Widget buildCheckbox({
    required CheckBoxAny checkboxany,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        onTap: onClicked,
        leading: Checkbox(
          value: checkboxany.value,
          onChanged: (value) => onClicked(),
        ),
        title: Text(
          checkboxany.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );


}
