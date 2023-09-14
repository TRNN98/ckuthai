class ShareModel {
  String itemTypeDescription;
  String shareValue;
  int period;
  String operateDate;
  int signFlag;

  ShareModel({
    this.itemTypeDescription,
    this.shareValue,
    this.period,
    this.operateDate,
    this.signFlag,
  });

  factory ShareModel.fromJson(Map<String, dynamic> json) => ShareModel(
        itemTypeDescription: json["item_type_description"],
        shareValue: json["share_value"],
        period: json["period"],
        operateDate: json["operate_date"],
        signFlag: json["sign_flag"],
      );
}

class Headshare {
  String shareAmount;
  String shareStock;
  String periodRecrieve;

  Headshare({
    this.shareAmount,
    this.shareStock,
    this.periodRecrieve,
  });

  factory Headshare.fromJson(Map<String, dynamic> json) => Headshare(
        shareAmount: json["share_amount"].toString(),
        shareStock: json["share_stock"],
        periodRecrieve: json["period_recrieve"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "share_amount": shareAmount,
        "share_stock": shareStock,
        "period_recrieve": periodRecrieve,
      };
}
