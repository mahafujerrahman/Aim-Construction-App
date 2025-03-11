class GetAllManagerModel {
  final String? fname;
  final String? lname;
  final String? userId;

  GetAllManagerModel({
    this.fname,
    this.lname,
    this.userId,
  });

  factory GetAllManagerModel.fromJson(Map<String, dynamic> json) => GetAllManagerModel(
    fname: json["fname"],
    lname: json["lname"],
    userId: json["_userId"],
  );

  Map<String, dynamic> toJson() => {
    "fname": fname,
    "lname": lname,
    "_userId": userId,
  };
}
