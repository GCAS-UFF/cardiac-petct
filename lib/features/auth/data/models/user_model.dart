import 'dart:convert';

import 'package:cardiac_petct/features/auth/data/models/exam_settings_model.dart';
import 'package:cardiac_petct/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_database/firebase_database.dart';

class UserModel extends UserEntity {
  UserModel({
    super.id,
    super.examSettings,
    required super.name,
    required super.email,
    required super.birthdate,
    required super.gender,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    DateTime? birthdate,
    String? gender,
    ExamSettingsModel? examSettings,
  }) {
    return UserModel(
      id: id ?? id,
      name: name ?? this.name,
      email: email ?? this.email,
      birthdate: birthdate ?? this.birthdate,
      gender: gender ?? this.gender,
      examSettings: examSettings ?? examSettings,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'birthdate': birthdate.millisecondsSinceEpoch,
      'gender': gender,
      'examSettings': examSettings != null
          ? (examSettings as ExamSettingsModel).toMap()
          : examSettings,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map['id'],
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        birthdate: DateTime.fromMillisecondsSinceEpoch(map['birthdate']),
        gender: map['gender'] ?? '',
        examSettings: map['examSettings'] != null
            ? ExamSettingsModel.fromMap(map['examSettings'])
            : map['examSettings']);
  }

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      id: userEntity.id,
      name: userEntity.name,
      email: userEntity.email,
      birthdate: userEntity.birthdate,
      gender: userEntity.gender,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, birthdate: $birthdate, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.birthdate == birthdate &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        birthdate.hashCode ^
        gender.hashCode;
  }

  factory UserModel.fromDataSnapshot(DataSnapshot dataSnapshot) {
    Map<dynamic, dynamic> userMap = dataSnapshot.value as Map;
    userMap['id'] = dataSnapshot.key;

    return UserModel.fromJson(jsonEncode(userMap));
  }
}
