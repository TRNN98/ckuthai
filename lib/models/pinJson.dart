class PinModel {
    String token;
    // Member member;
    String tokenType;
    int expiresIn;

    PinModel({
        this.token,
        // this.member,
        this.tokenType,
        this.expiresIn,
    });

    factory PinModel.fromJson(Map<String, dynamic> json) => PinModel(
        token: json["token"],
        // member: Member.fromJson(json["member"]),
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
    );
}

// class Member {
//     int membershipNo;
//     String prename;
//     String memberName;
//     String memberSurname;
//     String memType;
//     String memberGroupNo;
//     String idCard;
//     DateTime dateOfBirth;
//     DateTime approveDate;
//     String memberStatusCode;
//     dynamic resignationApproveDate;
//     String sex;
//     String memberGroupName;
//     String bloodDesc;
//     dynamic phoneNo;
//     dynamic email;
//     dynamic salaryId;
//     String addressPresent;
//     String addressPermanent;
//     dynamic remark;
//     int salaryAmount;

//     Member({
//         this.membershipNo,
//         this.prename,
//         this.memberName,
//         this.memberSurname,
//         this.memType,
//         this.memberGroupNo,
//         this.idCard,
//         this.dateOfBirth,
//         this.approveDate,
//         this.memberStatusCode,
//         this.resignationApproveDate,
//         this.sex,
//         this.memberGroupName,
//         this.bloodDesc,
//         this.phoneNo,
//         this.email,
//         this.salaryId,
//         this.addressPresent,
//         this.addressPermanent,
//         this.remark,
//         this.salaryAmount,
//     });

//     factory Member.fromJson(Map<String, dynamic> json) => Member(
//         membershipNo: json["MEMBERSHIP_NO"],
//         prename: json["PRENAME"],
//         memberName: json["MEMBER_NAME"],
//         memberSurname: json["MEMBER_SURNAME"],
//         memType: json["MEM_TYPE"],
//         memberGroupNo: json["MEMBER_GROUP_NO"],
//         idCard: json["ID_CARD"],
//         dateOfBirth: DateTime.parse(json["DATE_OF_BIRTH"]),
//         approveDate: DateTime.parse(json["APPROVE_DATE"]),
//         memberStatusCode: json["MEMBER_STATUS_CODE"],
//         resignationApproveDate: json["RESIGNATION_APPROVE_DATE"],
//         sex: json["SEX"],
//         memberGroupName: json["MEMBER_GROUP_NAME"],
//         bloodDesc: json["BLOOD_DESC"],
//         phoneNo: json["PHONE_NO"],
//         email: json["EMAIL"],
//         salaryId: json["SALARY_ID"],
//         addressPresent: json["ADDRESS_PRESENT"],
//         addressPermanent: json["ADDRESS_PERMANENT"],
//         remark: json["REMARK"],
//         salaryAmount: json["SALARY_AMOUNT"],
//     );
// }
