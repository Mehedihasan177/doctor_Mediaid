import 'package:care_plus_doctor/view/screen/medicine_page/medicine_page.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:flutter/material.dart';

class AdvicePage extends StatefulWidget {
  const AdvicePage({Key? key}) : super(key: key);

  @override
  _AdvicePageState createState() => _AdvicePageState();
}

class _AdvicePageState extends State<AdvicePage> {
  final List<String> advice = <String>[];
  TextEditingController _textEmail = TextEditingController();
  void addItemToList() {
    setState(() {
      advice.insert(0, _textEmail.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MedicinePage()));
        return true;
      },
      child: Scaffold(
        floatingActionButton: Container(
          height: 50,
          width: 50,
          child: new FloatingActionButton(

              elevation: 0.0,
              child: new Icon(Icons.check),
              backgroundColor: new Color(0xFF1CBFA8),
              onPressed: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNevigation()));
              }
          ),
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MedicinePage()));
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
              child: Text(
                "Advice",
                style: TextStyle(fontSize: 17),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: TextField(
                      controller: _textEmail,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(color: Colors.black),
                      //scrollPadding: EdgeInsets.all(10),
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.all(20),
                        hintText: "Enter your advices",
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () {
                          addItemToList();
                          _textEmail.clear();
                        },
                        child: Text('+'),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(14),
                          primary: Color(0xFF1CBFA8),
                        )),
                  ),
                ],
              ),
            ),
            Container(
              height: 660,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: advice.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.all(2),
                        child:  Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(child: Text("Advice:  " + '${advice[index]}')),
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
                                      advice.remove(advice[index]);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
