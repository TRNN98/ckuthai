class VersionsModel {
    VersionsModel({
        this.viostest,
        this.vios,
        this.vandroid,
        this.fios,
        this.fandroid,
        this.uandroid,
        this.uios,
        this.msg,
        this.fmsg,
    });

    String viostest;
    String vios;
    String vandroid;
    String fios;
    String fandroid;
    String uandroid;
    String uios;
    String msg;
    String fmsg;

    factory VersionsModel.fromJson(Map<String, dynamic> json) => VersionsModel(
        viostest: json["viostest"],
        vios: json["vios"],
        vandroid: json["vandroid"],
        fios: json["fios"],
        fandroid: json["fandroid"],
        uandroid: json["uandroid"],
        uios: json["uios"],
        msg: json["msg"],
        fmsg: json["fmsg"],
    );

    Map<String, dynamic> toJson() => {
        "viostest": viostest,
        "vios": vios,
        "vandroid": vandroid,
        "fios": fios,
        "fandroid": fandroid,
        "uandroid": uandroid,
        "uios": uios,
        "msg": msg,
        "fmsg": fmsg,
    };
}