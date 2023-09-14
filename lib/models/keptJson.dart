class KeptModel {
    int receiveYear;
    int receiveMonth;
    String receiveMonthFp;
    int receiveYearFp;
    String receiptDate;
    String receiptNo;
    int countSeqno;
    String kepMethodAmount;

    KeptModel({
        this.receiveYear,
        this.receiveMonth,
        this.receiveMonthFp,
        this.receiveYearFp,
        this.receiptDate,
        this.receiptNo,
        this.countSeqno,
        this.kepMethodAmount,
    });

    factory KeptModel.fromJson(Map<String, dynamic> json) => KeptModel(
        receiveYear: json["receive_year"],
        receiveMonth: json["receive_month"],
        receiveMonthFp: json["receive_month_fp"],
        receiveYearFp: json["receive_year_fp"],
        receiptDate: json["receipt_date"],
        receiptNo: json["receipt_no"],
        countSeqno: json["count_seqno"],
        kepMethodAmount: json["kep_method_amount"],
    );

    Map<String, dynamic> toJson() => {
        "receive_year": receiveYear,
        "receive_month": receiveMonth,
        "receive_month_fp": receiveMonthFp,
        "receive_year_fp": receiveYearFp,
        "receipt_date": receiptDate,
        "receipt_no": receiptNo,
        "count_seqno": countSeqno,
        "kep_method_amount": kepMethodAmount,
    };
}



class KeptDetailModel {
    String keepingTypeCode;
    int receiveMonth;
    String receiveDescription;
    int period;
    String principalOfLoan;
    String interest;
    String moneyAmount;
    String principalBalanceOfLoan;
    String keepingTypeName;

    KeptDetailModel({
        this.keepingTypeCode,
        this.receiveMonth,
        this.receiveDescription,
        this.period,
        this.principalOfLoan,
        this.interest,
        this.moneyAmount,
        this.principalBalanceOfLoan,
        this.keepingTypeName,
    });

    factory KeptDetailModel.fromJson(Map<String, dynamic> json) => KeptDetailModel(
        keepingTypeCode: json["keeping_type_code"],
        receiveMonth: json["receive_month"],
        receiveDescription: json["receive_description"],
        period: json["period"],
        principalOfLoan: json["principal_of_loan"],
        interest: json["interest"],
        moneyAmount: json["money_amount"],
        principalBalanceOfLoan: json["principal_balance_of_loan"],
        keepingTypeName: json["keeping_type_name"],
    );

    Map<String, dynamic> toJson() => {
        "keeping_type_code": keepingTypeCode,
        "receive_month": receiveMonth,
        "receive_description": receiveDescription,
        "period": period,
        "principal_of_loan": principalOfLoan,
        "interest": interest,
        "money_amount": moneyAmount,
        "principal_balance_of_loan": principalBalanceOfLoan,
        "keeping_type_name": keepingTypeName,
    };
}
