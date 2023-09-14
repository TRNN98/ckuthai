class AddressModel {
  AddressModel({
    this.address,
    this.email,
    this.fax,
    this.numberPhone1,
    this.txtPhone1,
    this.numberPhone2,
    this.txtPhone2,
    this.numberPhone3,
    this.txtPhone3,
    this.numberPhone4,
    this.txtPhone4,
    this.line,
    this.facebook,
    this.map,
  });

  String address;
  String email;
  String fax;
  String numberPhone1;
  String txtPhone1;
  String numberPhone2;
  String txtPhone2;
  String numberPhone3;
  String txtPhone3;
  String numberPhone4;
  String txtPhone4;
  String line;
  String facebook;
  String map;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        address: json["address"],
        email: json["email"],
        fax: json["fax"],
        numberPhone1: json["number_phone1"],
        txtPhone1: json["txt_phone1"],
        numberPhone2: json["number_phone2"],
        txtPhone2: json["txt_phone2"],
        numberPhone3: json["number_phone3"],
        txtPhone3: json["txt_phone3"],
        numberPhone4: json["number_phone4"],
        txtPhone4: json["txt_phone4"],
        line: json["line"],
        facebook: json["facebook"],
        map: json["map"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "email": email,
        "fax": fax,
        "number_phone1": numberPhone1,
        "txt_phone1": txtPhone1,
        "number_phone2": numberPhone2,
        "txt_phone2": txtPhone2,
        "number_phone3": numberPhone3,
        "txt_phone3": txtPhone3,
        "number_phone4": numberPhone4,
        "txt_phone4": txtPhone4,
        "line": line,
        "facebook": facebook,
        "map": map,
      };
}
