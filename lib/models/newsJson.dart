class NewsModel {
    NewsModel({
        this.question,
        this.note,
        this.date,
        this.nphoto,
        this.ndata,
    });

    String question;
    String note;
    String date;
    dynamic nphoto;
    dynamic ndata;

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        question: json["question"],
        note: json["note"],
        date: json["date"],
        nphoto: json["nphoto"],
        ndata: json["ndata"],
    );

    Map<String, dynamic> toJson() => {
        "question": question,
        "note": note,
        "date": date,
        "nphoto": nphoto,
        "ndata": ndata,
    };
}
