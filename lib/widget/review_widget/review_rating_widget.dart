import 'package:care_plus_doctor/view/screen/reviewUI/reviewUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


Widget progressBar(BuildContext context, index, QuickRateClass quick){
  List<int> ratings = [quick.oneC, quick.twoC, quick.threeC, quick.fourC, quick.fiveC];
  print(ratings);
  return Padding(
    padding: EdgeInsets.only(left: 30, top: 5, bottom: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 130,
            animation: true,
            lineHeight: 15.0,
            animationDuration: 2500,
            percent: ratings[index] / 100,
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.orange,
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
        ),
      ],
    ),
  );
}