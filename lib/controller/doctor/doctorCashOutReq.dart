import 'dart:convert';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/model/transfer_money_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


class DocCashOut{
  //this class is for make understand how it works actually
  static Future<http.Response> requestThenResponsePrint(BuildContext context, token, TransferMoney transferMoney) async {
    // It starts showing the progressbar


    // This string will contain the ResponseResult
    String printedRes = "";
    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/doctor/cashout';
    // This is the structure how we are posting data
    Map data1 = {
      'amount': '${transferMoney.amount}',
      'note': '${transferMoney.note}',
      'mobile': '${transferMoney.mobile}',
    };
    //var body = json.encode(dataMap);
    // print(data1);
    // Here we are getting the response
    var response = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${token}"
        }, body: data1);

    // await pr.hide();
    //
    // currentState.push(MaterialPageRoute(
    //     builder: (context) =>
    //         PointsTransactionSuccessPage()));

    // await pr.hide();
    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }

}