import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';






class DropDown extends StatefulWidget {
  @override
  DropDownWidget createState() => DropDownWidget();
}

class DropDownWidget extends State {

  // Default Drop Down Item.
  String dropdownValue = 'Tom Cruise';

  // To show Selected Item in Text.
  String holder = '' ;

  List <String> actorsName = [
    'Robert Downey, Jr.',
    'Tom Cruise',
    'Leonardo DiCaprio',
    'Will Smith',
    'Tom Hanks'
  ] ;

  void getDropDownItem(){

    setState(() {
      holder = dropdownValue ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Center(
          child :
          Column(children: <Widget>[

            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.red, fontSize: 18),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (data) {
                setState(() {
                  dropdownValue = data!;
                });
              },
              items: actorsName.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child :
                //Printing Item on Text Widget
                Text('Selected Item = ' + '$holder',
                    style: TextStyle
                      (fontSize: 22,
                        color: Colors.black))),

            RaisedButton(
              child: Text('Click Here To Get Selected Item From Drop Down'),
              onPressed: getDropDownItem,
              color: Colors.green,
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
            ),

          ]),
        ),
      ),
    );
  }
}









// class TestingStar extends StatefulWidget {
//   const TestingStar({Key? key}) : super(key: key);
//
//   @override
//   _TestingStarState createState() => _TestingStarState();
// }
//
// class _TestingStarState extends State<TestingStar> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Flutter Rating'),),
//       body: Container(
//         // return from here
//         child: Card(
//           child: Container(
//             child: ListView.builder(
//               reverse: true,
//               shrinkWrap: true,
//               itemCount: 5,
//               itemBuilder: (BuildContext context, int index) {
//                 return progressBar(context, index);
//             },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// List<int> ratings = [23,12,56,77,89];
// Widget progressBar(BuildContext context, index) => Padding(
//   padding: EdgeInsets.only(right: 15,top: 5,bottom: 5),
//   child: LinearPercentIndicator(
//     width: MediaQuery.of(context).size.width - 100,
//     animation: true,
//     lineHeight: 15.0,
//     animationDuration: 2500,
//     percent: ratings[index]/100,
//     leading: Row(children: [Icon(Icons.star,size: 20,color: Colors.yellow,),Text(" ${index+1} ",style: TextStyle(fontWeight: FontWeight.bold),)],),
//     trailing: Text(" ${ratings[index]} ",style: TextStyle(fontWeight: FontWeight.bold),),
//     linearStrokeCap: LinearStrokeCap.roundAll,
//     progressColor: index==4?Colors.green:index==3?Colors.lightGreen:index==2?Colors.yellow:index==1?Colors.orange:index==0?Colors.red:Colors.green,
//   ),
// );
