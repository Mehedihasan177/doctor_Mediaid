import 'package:care_plus_doctor/model/ui_model/wallet_model/wallet_model.dart';
import 'package:care_plus_doctor/responses/doctor/doctor_wallet_log_responses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget MoneyWallet(DoctorWalletLog moneyWallet) =>
    Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10,
          right: 10),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            alignment: Alignment.topLeft,
                            child: Text(moneyWallet.type,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17
                              ),
                            ),
                        ),
                        SizedBox(height: 7,),
                        Container(
                            alignment: Alignment.topLeft,
                            child: Text(moneyWallet.paymentNote,
                              style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),
                            ),
                        ),


                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Icon(Icons.calendar_today_rounded, size: 15,),
                            ),
                            SizedBox(width: 5,),
                            Text(DateFormat("dd-MMMM-yyyy").format(moneyWallet.createdAt)),
                            Text("    ||    "),
                            SizedBox(width: 10,),
                            Text(DateFormat.jm().format(DateTime.parse(moneyWallet.createdAt.toString()))),
                            //Text(carePlushLabReportList.time),
                          ],
                        ),

                      ],
                    ),
                  ),

                  Text("\$" + moneyWallet.amount,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );