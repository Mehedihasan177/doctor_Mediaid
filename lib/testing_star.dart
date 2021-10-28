import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TestingStar extends StatefulWidget {
  const TestingStar({Key? key}) : super(key: key);

  @override
  _TestingStarState createState() => _TestingStarState();
}

class _TestingStarState extends State<TestingStar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Rating'),),
      body: Container(
        // return from here
        child: Card(
          child: Container(
            child: ListView.builder(
              reverse: true,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return progressBar(context, index);
            },
            ),
          ),
        ),
      ),
    );
  }
}
List<int> ratings = [23,12,56,77,89];
Widget progressBar(BuildContext context, index) => Padding(
  padding: EdgeInsets.only(right: 15,top: 5,bottom: 5),
  child: LinearPercentIndicator(
    width: MediaQuery.of(context).size.width - 100,
    animation: true,
    lineHeight: 15.0,
    animationDuration: 2500,
    percent: ratings[index]/100,
    leading: Row(children: [Icon(Icons.star,size: 20,color: Colors.yellow,),Text(" ${index+1} ",style: TextStyle(fontWeight: FontWeight.bold),)],),
    trailing: Text(" ${ratings[index]} ",style: TextStyle(fontWeight: FontWeight.bold),),
    linearStrokeCap: LinearStrokeCap.roundAll,
    progressColor: index==4?Colors.green:index==3?Colors.lightGreen:index==2?Colors.yellow:index==1?Colors.orange:index==0?Colors.red:Colors.green,
  ),
);
