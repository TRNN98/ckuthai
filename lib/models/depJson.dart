class Deposits {
  String depositAccountNo;
  String depositAccountName;
  String depositOpenedDate;
  String depositBalance;
  String withdrawableAmount;
  String depositName;
  String atmStatus;

  Deposits({
    this.depositAccountNo,
    this.depositAccountName,
    this.depositOpenedDate,
    this.depositBalance,
    this.withdrawableAmount,
    this.depositName,
    this.atmStatus,
  });

  factory Deposits.fromJson(Map<String, dynamic> json) => Deposits(
        depositAccountNo: json["deposit_account_no"],
        depositAccountName: json["deposit_account_name"],
        depositOpenedDate: json["deposit_opened_date"],
        depositBalance: json["deposit_balance"],
        withdrawableAmount: json["withdrawable_amount"],
        depositName: json["deposit_name"],
        atmStatus: json["atm_status"],
      );

  Map<String, dynamic> toJson() => {
        "depositAccountNo": depositAccountNo,
        "depositAccountName": depositAccountName,
        "depositOpenedDate": depositOpenedDate,
        "depositBalance": depositBalance,
        "withdrawableAmount": withdrawableAmount,
        "depositName": depositName,
        "atmStatus": atmStatus,
      };
}

class DepositMovement {
  String depositItemDescription;
  String depositBalance;
  String operateDate;
  String totalBalance;
  int signFlag;

  DepositMovement({
    this.depositItemDescription,
    this.depositBalance,
    this.operateDate,
    this.totalBalance,
    this.signFlag,
  });

  factory DepositMovement.fromJson(Map<String, dynamic> json) =>
      DepositMovement(
        depositItemDescription: json["deposit_item_description"],
        depositBalance: json["deposit_balance"],
        operateDate: json["operate_date"],
        totalBalance: json["total_balance"],
        signFlag: json["sign_flag"],
      );

  Map<String, dynamic> toJson() => {
        "deposit_item_description": depositItemDescription,
        "deposit_balance": depositBalance,
        "operate_date": operateDate,
        "total_balance": totalBalance,
        "sign_flag": signFlag,
      };
}
