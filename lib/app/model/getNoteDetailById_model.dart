import 'dart:convert';

class GetNoteDetailByIdModel {
  final String? title;
  final String? description;
  final List<Attachment>? attachments;
  final CreatedBy? createdBy;
  final String? projectId;
  final String? isAccepted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? noteId;

  GetNoteDetailByIdModel({
    this.title,
    this.description,
    this.attachments,
    this.createdBy,
    this.projectId,
    this.isAccepted,
    this.createdAt,
    this.updatedAt,
    this.noteId,
  });

  factory GetNoteDetailByIdModel.fromRawJson(String str) => GetNoteDetailByIdModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetNoteDetailByIdModel.fromJson(Map<String, dynamic> json) => GetNoteDetailByIdModel(
    title: json["title"],
    description: json["description"],
    attachments: json["attachments"] == null ? [] : List<Attachment>.from(json["attachments"]!.map((x) => Attachment.fromJson(x))),
    createdBy: json["createdBy"] == null ? null : CreatedBy.fromJson(json["createdBy"]),
    projectId: json["projectId"],
    isAccepted: json["isAccepted"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    noteId: json["_noteId"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "attachments": attachments == null ? [] : List<dynamic>.from(attachments!.map((x) => x.toJson())),
    "createdBy": createdBy?.toJson(),
    "projectId": projectId,
    "isAccepted": isAccepted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "_noteId": noteId,
  };
}

class Attachment {
  final String? attachment;
  final String? attachmentType;
  final DateTime? createdAt;
  final String? attachmentId;

  Attachment({
    this.attachment,
    this.attachmentType,
    this.createdAt,
    this.attachmentId,
  });

  factory Attachment.fromRawJson(String str) => Attachment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
    attachment: json["attachment"],
    attachmentType: json["attachmentType"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    attachmentId: json["_attachmentId"],
  );

  Map<String, dynamic> toJson() => {
    "attachment": attachment,
    "attachmentType": attachmentType,
    "createdAt": createdAt?.toIso8601String(),
    "_attachmentId": attachmentId,
  };
}

class CreatedBy {
  final String? fcmToken;
  final String? role;
  final String? superVisorsManagerId;
  final String? userId;

  CreatedBy({
    this.fcmToken,
    this.role,
    this.superVisorsManagerId,
    this.userId,
  });

  factory CreatedBy.fromRawJson(String str) => CreatedBy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    fcmToken: json["fcmToken"],
    role: json["role"],
    superVisorsManagerId: json["superVisorsManagerId"],
    userId: json["_userId"],
  );

  Map<String, dynamic> toJson() => {
    "fcmToken": fcmToken,
    "role": role,
    "superVisorsManagerId": superVisorsManagerId,
    "_userId": userId,
  };
}
