import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:cardiac_petct/features/anamnesis/domain/entities/anamnesis_entity.dart';

class AnamnesisModel extends AnamnesisEntity {
  AnamnesisModel({
    required super.weight,
    required super.height,
    required super.smokes,
    super.smokesHowLong,
    super.cigarettesPerDay,
    required super.drinks,
    super.drinksType,
    super.drinkFrequency,
    required super.doPhysicalExercisesPerDay,
    super.physicalExerciseFrequency,
    super.chronicDiseaseAndCommorbities,
  });
  @override
  AnamnesisModel copyWith({
    double? weight,
    double? height,
    bool? smokes,
    int? smokesHowLong,
    int? cigarettesPerDay,
    bool? drinks,
    String? drinksType,
    String? drinkFrequency,
    bool? doPhysicalExercisesPerDay,
    String? physicalExerciseFrequency,
    List<String>? chronicDiseaseAndCommorbities,
  }) {
    return AnamnesisModel(
      weight: weight ?? this.weight,
      height: height ?? this.height,
      smokes: smokes ?? this.smokes,
      smokesHowLong: smokesHowLong ?? this.smokesHowLong,
      cigarettesPerDay: cigarettesPerDay ?? this.cigarettesPerDay,
      drinks: drinks ?? this.drinks,
      drinksType: drinksType ?? this.drinksType,
      drinkFrequency: drinkFrequency ?? this.drinkFrequency,
      doPhysicalExercisesPerDay:
          doPhysicalExercisesPerDay ?? this.doPhysicalExercisesPerDay,
      physicalExerciseFrequency:
          physicalExerciseFrequency ?? this.physicalExerciseFrequency,
      chronicDiseaseAndCommorbities:
          chronicDiseaseAndCommorbities ?? this.chronicDiseaseAndCommorbities,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'weight': weight,
      'height': height,
      'smokes': smokes,
      'smokesHowLong': smokesHowLong,
      'cigarettesPerDay': cigarettesPerDay,
      'drinks': drinks,
      'drinksType': drinksType,
      'drinkFrequency': drinkFrequency,
      'doPhysicalExercisesPerDay': doPhysicalExercisesPerDay,
      'physicalExerciseFrequency': physicalExerciseFrequency,
      'chronicDiseaseAndCommorbities': chronicDiseaseAndCommorbities,
    };
  }

  factory AnamnesisModel.fromMap(Map<String, dynamic> map) {
    return AnamnesisModel(
      weight: map['weight']?.toDouble() ?? 0.0,
      height: map['height']?.toDouble() ?? 0.0,
      smokes: map['smokes'] ?? false,
      smokesHowLong: map['smokesHowLong']?.toInt() ?? 0,
      cigarettesPerDay: map['cigarettesPerDay']?.toInt() ?? 0,
      drinks: map['drinks'] ?? false,
      drinksType: map['drinksType'] ?? '',
      drinkFrequency: map['drinkFrequency'] ?? '',
      doPhysicalExercisesPerDay: map['doPhysicalExercisesPerDay'] ?? false,
      physicalExerciseFrequency: map['physicalExerciseFrequency'] ?? '',
      chronicDiseaseAndCommorbities:
          map['chronicDiseaseAndCommorbities'] != null
              ? List<String>.from(map['chronicDiseaseAndCommorbities'])
              : [],
    );
  }

  factory AnamnesisModel.fromEntity(AnamnesisEntity entity) {
    return AnamnesisModel(
      weight: entity.weight,
      height: entity.height,
      smokes: entity.smokes,
      smokesHowLong: entity.smokesHowLong,
      cigarettesPerDay: entity.cigarettesPerDay,
      drinks: entity.drinks,
      drinksType: entity.drinksType,
      drinkFrequency: entity.drinkFrequency,
      doPhysicalExercisesPerDay: entity.doPhysicalExercisesPerDay,
      physicalExerciseFrequency: entity.physicalExerciseFrequency,
      chronicDiseaseAndCommorbities: entity.chronicDiseaseAndCommorbities,
    );
  }
  @override
  String toJson() => json.encode(toMap());

  factory AnamnesisModel.fromJson(String source) =>
      AnamnesisModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AnamnesisModel(weight: $weight, height: $height, smokes: $smokes, smokesHowLong: $smokesHowLong, cigarettesPerDay: $cigarettesPerDay, drinks: $drinks, drinksType: $drinksType, drinkFrequency: $drinkFrequency, doPhysicalExercisesPerDay: $doPhysicalExercisesPerDay, physicalExerciseFrequency: $physicalExerciseFrequency, chronicDiseaseAndCommorbities: $chronicDiseaseAndCommorbities)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnamnesisModel &&
        other.weight == weight &&
        other.height == height &&
        other.smokes == smokes &&
        other.smokesHowLong == smokesHowLong &&
        other.cigarettesPerDay == cigarettesPerDay &&
        other.drinks == drinks &&
        other.drinksType == drinksType &&
        other.drinkFrequency == drinkFrequency &&
        other.doPhysicalExercisesPerDay == doPhysicalExercisesPerDay &&
        other.physicalExerciseFrequency == physicalExerciseFrequency &&
        listEquals(
            other.chronicDiseaseAndCommorbities, chronicDiseaseAndCommorbities);
  }

  @override
  int get hashCode {
    return weight.hashCode ^
        height.hashCode ^
        smokes.hashCode ^
        smokesHowLong.hashCode ^
        cigarettesPerDay.hashCode ^
        drinks.hashCode ^
        drinksType.hashCode ^
        drinkFrequency.hashCode ^
        doPhysicalExercisesPerDay.hashCode ^
        physicalExerciseFrequency.hashCode ^
        chronicDiseaseAndCommorbities.hashCode;
  }
}
