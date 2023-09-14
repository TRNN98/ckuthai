class GainModel {
  String gainName;
  String gainIdCard;
  int recNo;
  String relatedNa;

  GainModel({
    this.gainName,
    this.gainIdCard,
    this.recNo,
    this.relatedNa,
  });

  factory GainModel.fromJson(Map<String, dynamic> json) => GainModel(
        gainName: json["gain_name"],
        gainIdCard: json["gain_id_card"],
        recNo: json["rec_no"],
        relatedNa: json["related_na"],
      );

  Map<String, dynamic> toJson() => {
        "gain_name": gainName,
        "gain_id_card": gainIdCard,
        "rec_no": recNo,
        "related_na": relatedNa,
      };
}
