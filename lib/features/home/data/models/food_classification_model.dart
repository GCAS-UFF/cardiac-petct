import 'dart:convert';

import 'package:cardiac_petct/features/home/domain/entities/food_classification.dart';
import 'package:cardiac_petct/features/home/domain/entities/translated_word.dart';

extension FoodClassificationTypeExtension on FoodClassificationType {
  static FoodClassificationType typeFromString(String value) {
    switch (value) {
      case 'FAT_AND_OILSEEDS':
        return FoodClassificationType.fatAndOilSeeds;
      case 'VEGETABLES':
        return FoodClassificationType.vegetables;
      case 'CARBOHYDRATES':
        return FoodClassificationType.carbohydrates;
      case 'PROTEINS':
        return FoodClassificationType.proteins;
      case 'LIQUIDS':
        return FoodClassificationType.liquids;
      case 'CHEESES':
        return FoodClassificationType.cheeses;
      default:
        return FoodClassificationType.carbohydrates;
    }
  }

  static String stringFromType(FoodClassificationType value) {
    switch (value) {
      case FoodClassificationType.fatAndOilSeeds:
        return 'FAT_AND_OILSEEDS';
      case FoodClassificationType.vegetables:
        return 'VEGETABLES';
      case FoodClassificationType.carbohydrates:
        return 'CARBOHYDRATES';
      case FoodClassificationType.proteins:
        return 'PROTEINS';
      case FoodClassificationType.liquids:
        return 'LIQUIDS';
      case FoodClassificationType.cheeses:
        return 'CHEESES';
      default:
        return 'CARBOHYDRATES';
    }
  }
}

class FoodClassificationModel extends FoodClassification {
  FoodClassificationModel(
    super.id,
    super.translatedWord, {
    required super.translatedWordId,
    required super.type,
  });

  FoodClassificationModel copyWith({
    String? id,
    TranslatedWord? translatedWord,
    String? translatedWordId,
    FoodClassificationType? type,
  }) {
    return FoodClassificationModel(
      id ?? this.id,
      translatedWord ?? this.translatedWord,
      translatedWordId: translatedWordId ?? this.translatedWordId,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'translatedWord': translatedWord,
      'translatedNames': translatedWordId,
      'type': FoodClassificationTypeExtension.stringFromType(type),
    };
  }

  factory FoodClassificationModel.fromMap(Map<String, dynamic> map) {
    return FoodClassificationModel(
      '',
      null,
      translatedWordId: map['translatedNames'],
      type: FoodClassificationTypeExtension.typeFromString(map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodClassificationModel.fromJson(String source) =>
      FoodClassificationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FoodClassificationModel(id: $id, translatedWord: $translatedWord, translatedWordId: $translatedWordId, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FoodClassificationModel &&
        other.id == id &&
        other.translatedWord == translatedWord &&
        other.translatedWordId == translatedWordId &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        translatedWord.hashCode ^
        translatedWordId.hashCode ^
        type.hashCode;
  }
}
