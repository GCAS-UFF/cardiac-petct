import 'dart:convert';

import 'package:flutter/foundation.dart';

class AnamnesisEntity {
  double weight;
  double height;
  bool smokes;
  int? smokesHowLong;
  int? cigarettesPerDay;
  bool drinks;
  String? drinksType;
  String? drinkFrequency;
  bool doPhysicalExercisesPerDay;
  String? physicalExerciseFrequency;
  List<String>? chronicDiseaseAndCommorbities;
  AnamnesisEntity({
    required this.weight,
    required this.height,
    required this.smokes,
    this.smokesHowLong,
    this.cigarettesPerDay,
    required this.drinks,
    this.drinksType,
    this.drinkFrequency,
    required this.doPhysicalExercisesPerDay,
    this.physicalExerciseFrequency,
    this.chronicDiseaseAndCommorbities,
  });

  factory AnamnesisEntity.empty() {
    return AnamnesisEntity(
      weight: 0,
      height: 0,
      smokes: false,
      drinks: false,
      doPhysicalExercisesPerDay: false,
    );
  }
  AnamnesisEntity copyWith({
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
    return AnamnesisEntity(
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
  String toString() {
    return 'AnamnesisEntity(weight: $weight, height: $height, smokes: $smokes, smokesHowLong: $smokesHowLong, cigarettesPerDay: $cigarettesPerDay, drinks: $drinks, drinksType: $drinksType, drinkFrequency: $drinkFrequency, doPhysicalExercisesPerDay: $doPhysicalExercisesPerDay, physicalExerciseFrequency: $physicalExerciseFrequency, chronicDiseaseAndCommorbities: $chronicDiseaseAndCommorbities)';
  }

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

  factory AnamnesisEntity.fromMap(Map<String, dynamic> map) {
    return AnamnesisEntity(
      weight: map['weight']?.toDouble() ?? 0.0,
      height: map['height']?.toDouble() ?? 0.0,
      smokes: map['smokes'] ?? false,
      smokesHowLong: map['smokesHowLong']?.toInt(),
      cigarettesPerDay: map['cigarettesPerDay']?.toInt(),
      drinks: map['drinks'] ?? false,
      drinksType: map['drinksType'],
      drinkFrequency: map['drinkFrequency'],
      doPhysicalExercisesPerDay: map['doPhysicalExercisesPerDay'] ?? false,
      physicalExerciseFrequency: map['physicalExerciseFrequency'],
      chronicDiseaseAndCommorbities:
          List<String>.from(map['chronicDiseaseAndCommorbities']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnamnesisEntity.fromJson(String source) =>
      AnamnesisEntity.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnamnesisEntity &&
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
