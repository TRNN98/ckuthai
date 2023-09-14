class DividendModel {
  int accountYear;
  String dividend;
  String totalInterest;
  String averageReturn;
  String totalSum;
  int year;

  DividendModel({
    this.accountYear,
    this.dividend,
    this.totalInterest,
    this.averageReturn,
    this.totalSum,
    this.year,
  });

  factory DividendModel.fromJson(Map<String, dynamic> json) => DividendModel(
        accountYear: json["account_year"],
        dividend: json["dividend"],
        totalInterest: json["total_interest"],
        averageReturn: json["average_return"],
        totalSum: json["total_sum"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "account_year": accountYear,
        "dividend": dividend,
        "total_interest": totalInterest,
        "average_return": averageReturn,
        "total_sum": totalSum,
        "year": year,
      };
}

class DividendDetailModel {
  DividendDetailModel({
    this.moneyTypeName,
    this.itemAmount,
    this.bankName,
    this.bankId,
  });

  String moneyTypeName;
  String itemAmount;
  String bankName;
  dynamic bankId;

  factory DividendDetailModel.fromJson(Map<String, dynamic> json) => DividendDetailModel(
    moneyTypeName: json["money_type_name"],
    itemAmount: json["item_amount"],
    bankName: json["bank_name"] == null ? '-' : json["bank_name"],
    bankId: json["bank_id"] == null ? '-' : json["bank_id"],
  );

  Map<String, dynamic> toJson() => {
    "money_type_name": moneyTypeName,
    "item_amount": itemAmount,
    "bank_name": bankName == null ? '-' : bankName,
    "bank_id": bankId == null ? '-' :bankId,
  };
}



