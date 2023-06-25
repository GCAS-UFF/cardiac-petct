import 'dart:convert';

import 'package:cardiac_petct/features/home/data/models/measurement_model.dart';
import 'package:cardiac_petct/features/home/domain/entities/food.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal_item.dart';
import 'package:cardiac_petct/features/home/domain/entities/measurement.dart';
import 'package:cardiac_petct/features/home/domain/entities/translated_word.dart';
import 'package:flutter/foundation.dart';

class MealItemModel extends MealItem {
  MealItemModel({
    super.id,
    super.translatedNameId,
    super.translatedWord,
    super.foodsItens,
    required super.foodIds,
    required super.measurements,
  });

  MealItemModel copyWith({
    String? id,
    String? translatedNameId,
    TranslatedWord? translatedWord,
    List<Food>? foodsItens,
    List<String>? foodIds,
    List<Measurement>? measurements,
  }) {
    return MealItemModel(
      id: id ?? this.id,
      translatedNameId: translatedNameId ?? this.translatedNameId,
      translatedWord: translatedWord ?? this.translatedWord,
      foodsItens: foodsItens ?? this.foodsItens,
      foodIds: foodIds ?? this.foodIds,
      measurements: measurements ?? this.measurements,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'translatedNames': translatedNameId,
      'translatedWord': translatedWord,
      'foodsItens': foodsItens?.map((x) => x).toList(),
      'foods': foodIds,
      'measurement': measurements.map((x) => x).toList(),
    };
  }

  factory MealItemModel.fromMap(Map<String, dynamic> map) {
    return MealItemModel(
      id: map['id'],
      translatedNameId: map['translatedNames'],
      translatedWord: map['translatedWord'],
      foodsItens: map['foodsItens'],
      foodIds: List<String>.from(
        map['foods']?.map((x) => x as String),
      ),
      measurements: List.from(
        map['measurement']?.map(
          (x) => MeasurementModel.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MealItemModel.fromJson(String source) =>
      MealItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MealItemModel(id: $id, translatedNameId: $translatedNameId, translatedWord: $translatedWord, foodsItens: $foodsItens, foodIds: $foodIds, measurements: $measurements)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MealItemModel &&
        other.id == id &&
        other.translatedNameId == translatedNameId &&
        other.translatedWord == translatedWord &&
        listEquals(other.foodsItens, foodsItens) &&
        listEquals(other.foodIds, foodIds) &&
        listEquals(other.measurements, measurements);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        translatedNameId.hashCode ^
        translatedWord.hashCode ^
        foodsItens.hashCode ^
        foodIds.hashCode ^
        measurements.hashCode;
  }
}
