class LoanModel {
    String loanContractNo;
    String principalBalance;
    String beginingOfContract;
    String periodPaymentAmount;
    int loanInstallmentAmount;
    String loanPaymentTypeCode;
    String loanApproveAmount;
    int lastPeriod;

    LoanModel({
        this.loanContractNo,
        this.principalBalance,
        this.beginingOfContract,
        this.periodPaymentAmount,
        this.loanInstallmentAmount,
        this.loanPaymentTypeCode,
        this.loanApproveAmount,
        this.lastPeriod,
    });

    factory LoanModel.fromJson(Map<String, dynamic> json) => LoanModel(
        loanContractNo: json["loan_contract_no"],
        principalBalance: json["principal_balance"],
        beginingOfContract: json["begining_of_contract"],
        periodPaymentAmount: json["period_payment_amount"],
        loanInstallmentAmount: json["loan_installment_amount"],
        loanPaymentTypeCode: json["loan_payment_type_code"],
        loanApproveAmount: json["loan_approve_amount"],
        lastPeriod: json["last_period"],
    );

    Map<String, dynamic> toJson() => {
        "loan_contract_no": loanContractNo,
        "principal_balance": principalBalance,
        "begining_of_contract": beginingOfContract,
        "period_payment_amount": periodPaymentAmount,
        "loan_installment_amount": loanInstallmentAmount,
        "loan_payment_type_code": loanPaymentTypeCode,
        "loan_approve_amount": loanApproveAmount,
        "last_period": lastPeriod,
    };
}

class LoanGuaranteeModel {
    String loanContractNo;
    String refOwnName;
    String principalBalance;
    String usedAmount;

    LoanGuaranteeModel({
        this.loanContractNo,
        this.refOwnName,
        this.principalBalance,
        this.usedAmount,
    });

    factory LoanGuaranteeModel.fromJson(Map<String, dynamic> json) => LoanGuaranteeModel(
        loanContractNo: json["loan_contract_no"],
        refOwnName: json["ref_own_name"],
        principalBalance: json["principal_balance"],
        usedAmount: json["used_amount"],
    );

    Map<String, dynamic> toJson() => {
        "loan_contract_no": loanContractNo,
        "ref_own_name": refOwnName,
        "principal_balance": principalBalance,
        "used_amount": usedAmount,
    };
}


class LoanMovementModel {
    String loanPaymentDate;
    String itemTypeDescription;
    String paymentAmount;
    String interestAmount;
    String totalAmount;
    int signStatus;
    String principalBalance;
    int period;

    LoanMovementModel({
        this.loanPaymentDate,
        this.itemTypeDescription,
        this.paymentAmount,
        this.interestAmount,
        this.totalAmount,
        this.signStatus,
        this.principalBalance,
        this.period,
    });

    factory LoanMovementModel.fromJson(Map<String, dynamic> json) => LoanMovementModel(
        loanPaymentDate: json["loan_payment_date"],
        itemTypeDescription: json["item_type_description"],
        paymentAmount: json["payment_amount"],
        interestAmount: json["interest_amount"],
        totalAmount: json["total_amount"],
        signStatus: json["sign_status"],
        principalBalance: json["principal_balance"],
        period: json["period"],
    );

    Map<String, dynamic> toJson() => {
        "loan_payment_date": loanPaymentDate,
        "item_type_description": itemTypeDescription,
        "payment_amount": paymentAmount,
        "interest_amount": interestAmount,
        "total_amount": totalAmount,
        "sign_status": signStatus,
        "principal_balance": principalBalance,
        "period": period,
    };
}
