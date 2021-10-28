
class transfer_money_bank_model {
  late final int balance;
  late final String name;
  late final String bank_name;
  late final String branch_code;
  late final int account_number;

  transfer_money_bank_model({
    required this.balance,
    required this.name,
    required this.bank_name,
    required this.branch_code,
    required this.account_number,
  });
}