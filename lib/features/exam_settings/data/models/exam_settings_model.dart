import 'dart:convert';

import 'package:cardiac_petct/features/exam_settings/domain/entities/exam_settings_entity.dart';
import 'package:flutter/material.dart';

class ExamSettingsModel extends ExamSettingsEntity {
  ExamSettingsModel(
      {required super.examDateTime,
      required super.examHour,
      required super.examAddress,
      required super.breakfastsHour,
      required super.morningSnacksHour,
      required super.lunchsHour,
      required super.afternoonSnacksHour,
      required super.dinnersHour,
      required super.suppersHour});

  @override
  ExamSettingsModel copyWith({
    DateTime? examDateTime,
    TimeOfDay? examHour,
    String? examAddress,
    TimeOfDay? breakfastsHour,
    TimeOfDay? morningSnacksHour,
    TimeOfDay? lunchsHour,
    TimeOfDay? afternoonSnacksHour,
    TimeOfDay? dinnersHour,
    TimeOfDay? suppersHour,
  }) {
    return ExamSettingsModel(
      examDateTime: examDateTime ?? this.examDateTime,
      examHour: examHour ?? this.examHour,
      examAddress: examAddress ?? this.examAddress,
      breakfastsHour: breakfastsHour ?? this.breakfastsHour,
      morningSnacksHour: morningSnacksHour ?? this.morningSnacksHour,
      lunchsHour: lunchsHour ?? this.lunchsHour,
      afternoonSnacksHour: afternoonSnacksHour ?? this.afternoonSnacksHour,
      dinnersHour: dinnersHour ?? this.dinnersHour,
      suppersHour: suppersHour ?? this.suppersHour,
    );
  }

  Map<String, dynamic> _timeOfDayToMap(TimeOfDay time) {
    return {
      'hour': time.hour,
      'minute': time.minute,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'examDateTime': examDateTime.millisecondsSinceEpoch,
      'examHour': _timeOfDayToMap(examHour),
      'examAddress': examAddress,
      'breakfastsHour': _timeOfDayToMap(breakfastsHour),
      'morningSnacksHour': _timeOfDayToMap(morningSnacksHour),
      'lunchsHour': _timeOfDayToMap(lunchsHour),
      'afternoonSnacksHour': _timeOfDayToMap(afternoonSnacksHour),
      'dinnersHour': _timeOfDayToMap(dinnersHour),
      'suppersHour': _timeOfDayToMap(suppersHour),
    };
  }

  TimeOfDay timeOfDayFromMap(Map<String, dynamic> time) {
    return TimeOfDay(hour: time['hour'], minute: time['minute']);
  }

  factory ExamSettingsModel.fromMap(Map<String, dynamic> map) {
    return ExamSettingsModel(
      examDateTime: DateTime.fromMillisecondsSinceEpoch(map['examDateTime']),
      examHour: TimeOfDay(
          hour: map['examHour']['hour'], minute: map['examHour']['minute']),
      examAddress: map['examAddress'] ?? '',
      breakfastsHour: TimeOfDay(
          hour: map['breakfastsHour']['hour'],
          minute: map['breakfastsHour']['minute']),
      morningSnacksHour: TimeOfDay(
          hour: map['morningSnacksHour']['hour'],
          minute: map['morningSnacksHour']['minute']),
      lunchsHour: TimeOfDay(
          hour: map['lunchsHour']['hour'], minute: map['lunchsHour']['minute']),
      afternoonSnacksHour: TimeOfDay(
          hour: map['afternoonSnacksHour']['hour'],
          minute: map['afternoonSnacksHour']['minute']),
      dinnersHour: TimeOfDay(
          hour: map['dinnersHour']['hour'],
          minute: map['dinnersHour']['minute']),
      suppersHour: TimeOfDay(
          hour: map['suppersHour']['hour'],
          minute: map['suppersHour']['minute']),
    );
  }

  factory ExamSettingsModel.fromEntity(ExamSettingsEntity entity) {
    return ExamSettingsModel(
      afternoonSnacksHour: entity.afternoonSnacksHour,
      dinnersHour: entity.dinnersHour,
      examAddress: entity.examAddress,
      examHour: entity.examHour,
      lunchsHour: entity.lunchsHour,
      examDateTime: entity.examDateTime,
      morningSnacksHour: entity.morningSnacksHour,
      breakfastsHour: entity.breakfastsHour,
      suppersHour: entity.suppersHour,
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
