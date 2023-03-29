import 'dart:convert';

import 'package:rawg/src/app/features/authentication/domain/entities/user_entity.dart';

String userModelToJson(UserModel data) => json.encode(data.toJson());

class AuthDBFields {
  static final List<String> values = [
    id,
    userName,
    email,
    password,
    fName,
    lName,
    gender,
    image,
    createdAt,
  ];

  static const String id = "_id";
  static const String userName = "userName";
  static const String email = "email";
  static const String password = "password";
  static const String fName = "fName";
  static const String lName = "lName";
  static const String gender = "gender";
  static const String image = "image";
  static const String createdAt = "createdAt";
}

class UserModel extends UserEntity {
  const UserModel({
    super.id,
    required super.username,
    required super.email,
    required super.password,
    required super.fName,
    required super.lName,
    required super.gender,
    required super.image,
    required super.createdAt,
  });

  UserModel copyWith({
    int? id,
    String? username,
    String? email,
    String? password,
    String? fName,
    String? lName,
    String? gender,
    String? image,
    DateTime? createdAt,
  }) =>
      UserModel(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        fName: fName ?? this.fName,
        lName: lName ?? this.lName,
        gender: gender ?? this.gender,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json[AuthDBFields.id],
        username: json[AuthDBFields.userName],
        email: json[AuthDBFields.email],
        password: json[AuthDBFields.password],
        fName: json[AuthDBFields.fName],
        lName: json[AuthDBFields.lName],
        gender: json[AuthDBFields.gender],
        image: json[AuthDBFields.image],
        createdAt: DateTime.parse(json[AuthDBFields.createdAt]),
      );

  Map<String, dynamic> toJson() => {
        AuthDBFields.id: id,
        AuthDBFields.userName: username,
        AuthDBFields.email: email,
        AuthDBFields.password: password,
        AuthDBFields.fName: fName,
        AuthDBFields.lName: lName,
        AuthDBFields.gender: gender,
        AuthDBFields.image: image,
        AuthDBFields.createdAt: createdAt.toIso8601String(),
      };
}
