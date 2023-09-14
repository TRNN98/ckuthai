class GuaranteeModel {
    String loanContractNo;
    String loanName;
    String principalBalance;

    GuaranteeModel({
        this.loanContractNo,
        this.loanName,
        this.principalBalance,
    });

    factory GuaranteeModel.fromJson(Map<String, dynamic> json) => GuaranteeModel(
        loanContractNo: json["loan_contract_no"],
        loanName: json["loan_name"],
        principalBalance: json["principal_balance"],
    );

    Map<String, dynamic> toJson() => {
        "loan_contract_no": loanContractNo,
        "loan_name": loanName,
        "principal_balance": principalBalance,
    };
}
