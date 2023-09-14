class CremationModel {
  CremationModel({
    this.membershipNo,
    this.memberGain,
    this.gainShort,
    this.gainCrem,
  });

  String membershipNo;
  String memberGain;
  String gainShort;
  String gainCrem;

  factory CremationModel.fromJson(Map<String, dynamic> json) => CremationModel(
      membershipNo: json['membership_no'],
      memberGain: json['member_gain'],
      gainShort: json['gain_short'],
      gainCrem: json['gain_crem']);

  Map<String, dynamic> toJson() => {
        "membership_no": membershipNo,
        "member_gain": memberGain,
        "gain_short": gainShort,
        "gain_crem": gainCrem
      };
}
