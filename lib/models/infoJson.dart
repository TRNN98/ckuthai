class InfoModel {
    String membershipNo;
    String name;
    String idCard;
    String dateOfBirth;
    String ageOfBirth;
    String dateOfApprove;
    String ageOfApprove;
    String memberGroupName;
    dynamic phoneNo;
    String address;

    InfoModel({
        this.membershipNo,
        this.name,
        this.idCard,
        this.dateOfBirth,
        this.ageOfBirth,
        this.dateOfApprove,
        this.ageOfApprove,
        this.memberGroupName,
        this.phoneNo,
        this.address,
    });

    factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        membershipNo: json["membership_no"],
        name: json["name"],
        idCard: json["id_card"],
        dateOfBirth: json["date_of_birth"],
        ageOfBirth: json["age_of_birth"],
        dateOfApprove: json["date_of_approve"],
        ageOfApprove: json["age_of_approve"],
        memberGroupName: json["member_group_name"],
        phoneNo: json["phone_no"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "membership_no": membershipNo,
        "name": name,
        "id_card": idCard,
        "date_of_birth": dateOfBirth,
        "age_of_birth": ageOfBirth,
        "date_of_approve": dateOfApprove,
        "age_of_approve": ageOfApprove,
        "member_group_name": memberGroupName,
        "phone_no": phoneNo,
        "address": address,
    };
}
