import 'dart:convert';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/controller/doctor/doctor_wallet_controller.dart';
import 'package:care_plus_doctor/data/wallet_data/wallet_data.dart';
import 'package:care_plus_doctor/model/ui_model/wallet_model/wallet_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_wallet_log_responses.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_wallet_response.dart';
import 'package:care_plus_doctor/view/screen/profile/profile.dart';
import 'package:care_plus_doctor/view/screen/transfer_money_back/transfer_money_bank.dart';
import 'package:care_plus_doctor/widget/money_wallet_wdget/money_wallet_wdget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class walletUi extends StatefulWidget {
  const walletUi({Key? key}) : super(key: key);

  @override
  _walletUiState createState() => _walletUiState();
}

class _walletUiState extends State<walletUi> {
  List<Wallet_Model> moneyWallet = List.of(wallet_data);
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
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage()));
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 20),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                              "AVAILABLE BALANCE",
                              style: TextStyle(fontSize: 16),
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 20),
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
                  padding: const EdgeInsets.only(top: 50, right: 20),
                  child: Container(
                    // height: MediaQuery.of(context).size.height * 0.07,
                    // width: MediaQuery.of(context).size.width * 0.9,
                    //color: Color(0xF60D72),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             CardDemo(Health_History[index])));
                      },
                      child: ElevatedButton(

                        child: Text(
                          "Withdraw",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        onPressed: () async {
                           Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => TransferMoneyBank()));

                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 50),
                          // maximumSize: const Size(50, 25),
                          primary: Color(0xFF1CBFA8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    // decoration: BoxDecoration(
                    //   //color: Color(0xF60D72),
                    //     borderRadius: BorderRadius.circular(18)),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text("Recent", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
            ),


            Row(
              children: [
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    height: 700,
                    child: ListView.builder(
                      //controller: PageController(viewportFraction: 0.3),
                        scrollDirection: Axis.vertical,
                        itemCount: moneyWallet.length,
                        itemBuilder: (context,index) {
                          //var information = carePlushPrescriptionList[index];
                          return MoneyWallet(moneyWallet[index]);

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




  // void getTrxHist() {
  //
  //   WalletLogController.requestThenResponsePrint(USERTOKEN).then((value) {
  //     setState(() {
  //       Map<String, dynamic> decoded = json.decode("${value.body}");
  //       Iterable listTrx = decoded['data'];
  //       print(decoded['data']);
  //       moneyWallet =
  //           listTrx.map((model) => DoctorWalletLogResponseElement.fromJson(model)).toList();
  //
  //       print('moneyWallet');
  //       print(moneyWallet);
  //
  //
  //
  //     });
  //   });
  // }
}


