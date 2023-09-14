class AuthModel {
    int rcCode;
    String rcDesc;
    String memId;
    String dateOfBirth;
    String idCard;
    String sex;

    AuthModel({
        this.rcCode,
        this.rcDesc,
        this.memId,
        this.dateOfBirth,
        this.idCard,
        this.sex,
    });

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        rcCode: json["rc_code"],
        rcDesc: json["rc_desc"],
        memId: json["mem_id"],
        dateOfBirth: json["date_of_birth"],
        idCard:json['id_card'],
        sex:json['sex'],
    );

    Map<String, dynamic> toJson() => {
        "rc_code": rcCode,
        "rc_desc": rcDesc,
        "mem_id": memId,
        "date_of_birth": dateOfBirth,
        "id_card":idCard,
        "sex":sex,
    };
}



class AuthRegitModel {
    String sex;
    String rcCode;
    String rcDesc;
    String idCard;
    String dateOfBirth;
    String memberName;
    String memberSurname;

    AuthRegitModel({
        this.sex,
        this.rcCode,
        this.rcDesc,
        this.idCard,
        this.dateOfBirth,
        this.memberName,
        this.memberSurname,
    });

    factory AuthRegitModel.fromJson(Map<String, dynamic> json) => AuthRegitModel(
        sex: json["sex"],
        rcCode: json["rc_code"],
        rcDesc: json["rc_desc"],
        idCard: json["id_card"],
        dateOfBirth: json["date_of_birth"],
        memberName: json["member_name"],
        memberSurname: json["member_surname"],
    );

    Map<String, dynamic> toJson() => {
        "sex": sex,
        "rc_code": rcCode,
        "rc_desc": rcDesc,
        "id_card": idCard,
        "date_of_birth": dateOfBirth,
        "member_name": memberName,
        "member_surname": memberSurname,
    };
}
