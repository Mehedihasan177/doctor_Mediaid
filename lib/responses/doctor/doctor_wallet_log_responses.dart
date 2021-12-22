// To parse this JSON data, do
//
//     final walletLogResponses = walletLogResponsesFromJson(jsonString);

import 'dart:convert';

WalletLogResponses walletLogResponsesFromJson(String str) => WalletLogResponses.fromJson(json.decode(str));

String walletLogResponsesToJson(WalletLogResponses data) => json.encode(data.toJson());

class WalletLogResponses {
  WalletLogResponses({
    required this.data,
  });

  List<DoctorWalletLog> data;

  factory WalletLogResponses.fromJson(Map<String, dynamic> json) => WalletLogResponses(
    data: List<DoctorWalletLog>.from(json["data"].map((x) => DoctorWalletLog.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DoctorWalletLog {
  DoctorWalletLog({
    required this.id,
    required this.trxId,
    this.userId,
    required this.doctorId,
    this.serviceProviderId,
    required this.type,
    required this.amount,
    required this.deposit,
    required this.paymentGateway,
    required this.paymentNote,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  String trxId;
  dynamic userId;
  String doctorId;
  dynamic serviceProviderId;
  String type;
  String amount;
  String deposit;
  String paymentGateway;
  String paymentNote;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory DoctorWalletLog.fromJson(Map<String, dynamic> json) => DoctorWalletLog(
    id: json["id"],
    trxId: json["trx_id"],
    userId: json["user_id"],
    doctorId: json["doctor_id"],
    serviceProviderId: json["service_provider_id"],
    type: json["type"],
    amount: json["amount"],
    deposit: json["deposit"],
    paymentGateway: json["payment_gateway"],
    paymentNote: json["payment_note"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "trx_id": trxId,
    "user_id": userId,
    "doctor_id": doctorId,
    "service_provider_id": serviceProviderId,
    "type": type,
    "amount": amount,
    "deposit": deposit,
    "payment_gateway": paymentGateway,
    "payment_note": paymentNote,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
