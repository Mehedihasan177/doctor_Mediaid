import 'package:care_plus_doctor/view/screen/reviewUI/reviewUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


Widget progressBar(BuildContext context, index, QuickRateClass quick){
  List<int> ratings = [quick.oneC, quick.twoC, quick.threeC, quick.fourC, quick.fiveC];
  print(ratings);
  return Padding(
    padding: EdgeInsets.only(right: 15, top: 5, bottom: 5),
    child: LinearPercentIndicator(
      width: MediaQuery.of(context).size.width - 140,
      animation: true,
      lineHeight: 15.0,
      animationDuration: 2500,
      percent: ratings[index] / 100,
      leading: Row(
        children: [
          Icon(
            Icons.star,
            size: 20,
            color: Colors.yellow,
          ),
          Text(
            " ${index + 1} ",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
      trailing: Text(
        " ${ratings[index]} ",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: index == 4
          ? Colors.green
          : index == 3
          ? Colors.lightGreen
          : index == 2
          ? Colors.yellow
          : index == 1
          ? Colors.orange
          : index == 0
          ? Colors.red
          : Colors.green,
    ),
  );
}