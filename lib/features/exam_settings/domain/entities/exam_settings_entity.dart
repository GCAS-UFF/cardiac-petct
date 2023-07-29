import 'package:flutter/material.dart';

class ExamSettingsEntity {
  final DateTime examDateTime;
  final TimeOfDay examHour;
  final String examAddress;
  final TimeOfDay breakfastsHour;
  final TimeOfDay morningSnacksHour;
  final TimeOfDay lunchsHour;
  final TimeOfDay afternoonSnacksHour;
  final TimeOfDay dinnersHour;
  final TimeOfDay suppersHour;

  ExamSettingsEntity({
    required this.examHour,
    required this.examDateTime,
    required this.examAddress,
    required this.breakfastsHour,
    required this.morningSnacksHour,
    required this.lunchsHour,
    required this.afternoonSnacksHour,
    required this.dinnersHour,
    required this.suppersHour,
  });

  ExamSettingsEntity copyWith({
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
    return ExamSettingsEntity(
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
}
