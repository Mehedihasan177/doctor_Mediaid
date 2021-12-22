// To parse this JSON data, do
//
//     final transferMoneyBankResponses = transferMoneyBankResponsesFromJson(jsonString);

import 'dart:convert';

TransferMoneyBankResponses transferMoneyBankResponsesFromJson(String str) => TransferMoneyBankResponses.fromJson(json.decode(str));

String transferMoneyBankResponsesToJson(TransferMoneyBankResponses data) => json.encode(data.toJson());

class TransferMoneyBankResponses {
  TransferMoneyBankResponses({
    required this.message,
    required this.data,
  });

  String message;
  TransferMoneyToBank data;

  factory TransferMoneyBankResponses.fromJson(Map<String, dynamic> json) => TransferMoneyBankResponses(
    message: json["message"],
    data: TransferMoneyToBank.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class TransferMoneyToBank {
  TransferMoneyToBank({
    required this.amount,
    required this.note,
    required this.mobile,
    required this.doctorId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String amount;
  String note;
  String mobile;
  String doctorId;
  String updatedAt;
  String createdAt;
  String id;

  factory TransferMoneyToBank.fromJson(Map<dynamic, dynamic> json) => TransferMoneyToBank(
    amount: json["amount"].toString(),
    note: json["note"].toString(),
    mobile: json["mobile"].toString(),
    doctorId: json["doctor_id"].toString(),
    updatedAt: json["updated_at"].toString(),
    createdAt: json["created_at"].toString(),
    id: json["id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "note": note,
    "mobile": mobile,
    "doctor_id": doctorId,
    "updated_at": updatedAt,
    "created_at": createdAt,
    "id": id,
  };
}
