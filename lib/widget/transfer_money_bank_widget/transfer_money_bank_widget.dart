import 'package:care_plus_doctor/model/ui_model/transfer_money_bank_model/transfer_money_bank_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget TransferMoneyBankWidget(transfer_money_bank_model transferMoneyBank) =>
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
                  "\$520",
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
                //Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
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
    );
