import 'package:care_plus_doctor/data/transfer_money_bank_data/transfer_money_bank_data.dart';
import 'package:care_plus_doctor/model/ui_model/transfer_money_bank_model/transfer_money_bank_model.dart';
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

            Row(
              children: [
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      //controller: PageController(viewportFraction: 0.3),
                        scrollDirection: Axis.vertical,
                        itemCount: transferMoneyBank.length,
                        itemBuilder: (context,index) {
                          //var information = carePlushPrescriptionList[index];
                          return TransferMoneyBankWidget(transferMoneyBank[index]);

                        }
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


