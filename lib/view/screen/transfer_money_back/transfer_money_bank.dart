import 'dart:convert';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_wallet_controller.dart';
import 'package:care_plus_doctor/data/transfer_money_bank_data/transfer_money_bank_data.dart';
import 'package:care_plus_doctor/model/ui_model/transfer_money_bank_model/transfer_money_bank_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_wallet_response.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/profile/profile.dart';
import 'package:care_plus_doctor/widget/transfer_money_bank_widget/transfer_money_bank_widget.dart';
import 'package:flutter/material.dart';

class TransferMoneyBank extends StatefulWidget {
  const TransferMoneyBank({Key? key}) : super(key: key);

  @override
  _TransferMoneyBankState createState() => _TransferMoneyBankState();
}

class _TransferMoneyBankState extends State<TransferMoneyBank> {

  List<transfer_money_bank_model> transferMoneyBank = List.of(transferMoneyBankData);


  String userbalance = '0';



  void getWalletBal() {
    DoctorWalletController.requestThenResponsePrint(USERTOKEN).then((value) {
      setState(() {
        print(value.statusCode);
        print(value.body);

        if(value.statusCode==200){
          Map<String, dynamic> decoded = json.decode("${value.body}");
          var walletbal = DoctorWalletResponse.fromJson(decoded);
          print(walletbal.data);
          userbalance = walletbal.data;
        }

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getWalletBal();
    //getTrxHist();
    super.initState();
  }



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
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage()));
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text(
                        "Transfer Money to Bank",
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

      Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "AVAILABLE BALANCE",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, top: 20),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "\$${userbalance}",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "BANK INFO",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Account Holder Name",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, right: 10),
            child: Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.07),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                //controller: _textEmail,
                // keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
                //scrollPadding: EdgeInsets.all(10),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 20),
                  hintText: "Enter your name",
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Bank Name",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, right: 10),
            child: Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.07),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  //controller: _textEmail,
                  // keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  //scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Enter your bank name",
                  ),
                ),
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Branch Code",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, right: 10),
            child: Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.07),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  //controller: _textEmail,
                  // keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  //scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Enter your branch code",
                  ),
                ),
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Account Number",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, right: 10),
            child: Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.07),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  //controller: _textEmail,
                  // keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  //scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Enter your account number",
                  ),
                ),
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20, top: 20),
            child: Divider(
              color: Colors.black.withOpacity(0.5),
              thickness: 2,
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Account to Transfer",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, right: 10),
            child: Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.07),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                textAlign: TextAlign.left,
                // controller: _textEmail,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
                //scrollPadding: EdgeInsets.all(10),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20),
                  hintText: "\$500",

                ),
              ),
            ),
          ),

          SizedBox(height: 20,),

          Center(
            child: Container(
              child: ElevatedButton(
                child: Text(
                  "Send to Bank",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {
                  //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 59),
                  //maximumSize: const Size(350, 59),
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
          SizedBox(height: 20,),

        ],
      )
          ],
        ),
      ),
    );
  }
}


