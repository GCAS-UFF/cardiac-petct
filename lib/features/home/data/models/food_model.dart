import 'dart:convert';

import 'package:cardiac_petct/features/home/data/models/translated_words_model.dart';
import 'package:cardiac_petct/features/home/domain/entities/food.dart';
import 'package:cardiac_petct/features/home/domain/entities/food_classification.dart';
import 'package:cardiac_petct/features/home/domain/entities/translated_word.dart';

class FoodModel extends Food {
  FoodModel(
    super.id,
    super.foodClassification,
    super.translatedWord, {
    required super.foodClassificationId,
    required super.translatedWordId,
  });

  FoodModel copyWith({
    String? id,
    FoodClassification? foodClassification,
    TranslatedWord? translatedWord,
    String? foodClassificationId,
    String? translatedWordId,
  }) {
    return FoodModel(
      id ?? this.id,
      foodClassification ?? this.foodClassification,
      translatedWord ?? this.translatedWord,
      foodClassificationId: foodClassificationId ?? this.foodClassificationId,
      translatedWordId: translatedWordId ?? this.translatedWordId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'foodClassification': foodClassification,
      'translatedWord': translatedWord,
      'foodClassificationId': foodClassificationId,
      'translatedWordId': translatedWordId,
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      map['id'],
      null,
      map['translatedWord'] != null
          ? TranslatedWordModel.fromMap(map['translatedWord'])
          : null,
      foodClassificationId: map['foodClassification'] ?? '',
      translatedWordId: map['translatedNames'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodModel.fromJson(String source) =>
      FoodModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FoodModel(id: $id, foodClassification: $foodClassification, translatedWord: $translatedWord, foodClassificationId: $foodClassificationId, translatedWordId: $translatedWordId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FoodModel &&
        other.id == id &&
        other.foodClassification == foodClassification &&
        other.translatedWord == translatedWord &&
        other.foodClassificationId == foodClassificationId &&
        other.translatedWordId == translatedWordId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        foodClassification.hashCode ^
        translatedWord.hashCode ^
        foodClassificationId.hashCode ^
        translatedWordId.hashCode;
  }
}
