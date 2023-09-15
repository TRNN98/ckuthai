class CremationModel {
  CremationModel({
    this.membershipNo,
    this.memberGain,
    this.gainShort,
    this.gainCrem,
    this.gainType,
  });

  String membershipNo;
  String memberGain;
  String gainShort;
  String gainCrem;
  String gainType;

  factory CremationModel.fromJson(Map<String, dynamic> json) => CremationModel(
        membershipNo: json['membership_no'],
        memberGain: json['member_gain'],
        gainShort: json['gain_short'],
        gainCrem: json['gain_crem'],
        gainType: json['gain_type'],
      );

  Map<String, dynamic> toJson() => {
        "membership_no": membershipNo,
        "member_gain": memberGain,
        "gain_short": gainShort,
        "gain_crem": gainCrem,
        "gain_type": gainType,
      };
}
