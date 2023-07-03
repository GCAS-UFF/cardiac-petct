import 'dart:convert';

import 'package:cardiac_petct/features/exam_settings/domain/entities/exam_settings_entity.dart';

class ExamSettingsModel extends ExameSettingsEntity {
  ExamSettingsModel(
      {required super.examDateTime,
      required super.examAddress,
      required super.breakfastsHour,
      required super.morningSnacksHour,
      required super.lunchsHour,
      required super.afternoonSnacksHour,
      required super.dinnersHour,
      required super.suppersHour});

  ExamSettingsModel copyWith({
    DateTime? examDateTime,
    String? examAddress,
    DateTime? breakfastsHour,
    DateTime? morningSnacksHour,
    DateTime? lunchsHour,
    DateTime? afternoonSnacksHour,
    DateTime? dinnersHour,
    DateTime? suppersHour,
  }) {
    return ExamSettingsModel(
      examDateTime: examDateTime ?? this.examDateTime,
      examAddress: examAddress ?? this.examAddress,
      breakfastsHour: breakfastsHour ?? this.breakfastsHour,
      morningSnacksHour: morningSnacksHour ?? this.morningSnacksHour,
      lunchsHour: lunchsHour ?? this.lunchsHour,
      afternoonSnacksHour: afternoonSnacksHour ?? this.afternoonSnacksHour,
      dinnersHour: dinnersHour ?? this.dinnersHour,
      suppersHour: suppersHour ?? this.suppersHour,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'examDateTime': examDateTime.millisecondsSinceEpoch,
      'examAddress': examAddress,
      'breakfastsHour': breakfastsHour.millisecondsSinceEpoch,
      'morningSnacksHour': morningSnacksHour.millisecondsSinceEpoch,
      'lunchsHour': lunchsHour.millisecondsSinceEpoch,
      'afternoonSnacksHour': afternoonSnacksHour.millisecondsSinceEpoch,
      'dinnersHour': dinnersHour.millisecondsSinceEpoch,
      'suppersHour': suppersHour.millisecondsSinceEpoch,
    };
  }

  factory ExamSettingsModel.fromMap(Map<String, dynamic> map) {
    return ExamSettingsModel(
      examDateTime: DateTime.fromMillisecondsSinceEpoch(map['examDateTime']),
      examAddress: map['examAddress'] ?? '',
      breakfastsHour:
          DateTime.fromMillisecondsSinceEpoch(map['breakfastsHour']),
      morningSnacksHour:
          DateTime.fromMillisecondsSinceEpoch(map['morningSnacksHour']),
      lunchsHour: DateTime.fromMillisecondsSinceEpoch(map['lunchsHour']),
      afternoonSnacksHour:
          DateTime.fromMillisecondsSinceEpoch(map['afternoonSnacksHour']),
      dinnersHour: DateTime.fromMillisecondsSinceEpoch(map['dinnersHour']),
      suppersHour: DateTime.fromMillisecondsSinceEpoch(map['suppersHour']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExamSettingsModel.fromJson(String source) =>
      ExamSettingsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExamSettingsModel(examDateTime: $examDateTime, examAddress: $examAddress, breakfastsHour: $breakfastsHour, morningSnacksHour: $morningSnacksHour, lunchsHour: $lunchsHour, afternoonSnacksHour: $afternoonSnacksHour, dinnersHour: $dinnersHour, suppersHour: $suppersHour)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExamSettingsModel &&
        other.examDateTime == examDateTime &&
        other.examAddress == examAddress &&
        other.breakfastsHour == breakfastsHour &&
        other.morningSnacksHour == morningSnacksHour &&
        other.lunchsHour == lunchsHour &&
        other.afternoonSnacksHour == afternoonSnacksHour &&
        other.dinnersHour == dinnersHour &&
        other.suppersHour == suppersHour;
  }

  @override
  int get hashCode {
    return examDateTime.hashCode ^
        examAddress.hashCode ^
        breakfastsHour.hashCode ^
        morningSnacksHour.hashCode ^
        lunchsHour.hashCode ^
        afternoonSnacksHour.hashCode ^
        dinnersHour.hashCode ^
        suppersHour.hashCode;
  }
}
