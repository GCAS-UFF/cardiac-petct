import 'dart:convert';

import 'package:cardiac_petct/features/home/data/models/translated_words_model.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal_type.dart';
import 'package:cardiac_petct/features/home/domain/entities/translated_word.dart';

extension MealTypeExtension on MealTypeEnum {
  static MealTypeEnum typeFromString(String value) {
    switch (value) {
      case 'AFTERNOON_SNACK':
        return MealTypeEnum.afternoonSnack;
      case 'SUPPER':
        return MealTypeEnum.supper;
      case 'DINNER':
        return MealTypeEnum.dinner;
      case 'MORNING_SNACK':
        return MealTypeEnum.morningSnack;
      case 'LUNCH':
        return MealTypeEnum.lunch;
      case 'BREAKFAST':
        return MealTypeEnum.breakfast;
      default:
        return MealTypeEnum.afternoonSnack;
    }
  }

  static String stringFromType(MealTypeEnum value) {
    switch (value) {
      case MealTypeEnum.afternoonSnack:
        return 'AFTERNOON_SNACK';
      case MealTypeEnum.supper:
        return 'SUPPER';
      case MealTypeEnum.dinner:
        return 'DINNER';
      case MealTypeEnum.morningSnack:
        return 'MORNING_SNACK';
      case MealTypeEnum.lunch:
        return 'LUNCH';
      case MealTypeEnum.breakfast:
        return 'BREAKFAST';
      default:
        return 'AFTERNOON_SNACK';
    }
  }

  static List<MealTypeEnum> listTypes() {
    return [
      MealTypeEnum.breakfast,
      MealTypeEnum.morningSnack,
      MealTypeEnum.lunch,
      MealTypeEnum.afternoonSnack,
      MealTypeEnum.dinner,
      MealTypeEnum.supper,
    ];
  }

  static int customCompare(MealType meal1, MealType meal2) {
    int index1 = listTypes().indexOf(meal1.mealType);
    int index2 = listTypes().indexOf(meal2.mealType);
    return index1.compareTo(index2);
  }
}

class MealTypeModel extends MealType {
  MealTypeModel(
    super.id,
    super.translatedWord, {
    required super.translatedWordId,
    required super.mealType,
  });

  MealTypeModel copyWith({
    String? id,
    TranslatedWord? translatedWord,
    String? translatedWordId,
    MealTypeEnum? mealType,
  }) {
    return MealTypeModel(
      id ?? this.id,
      translatedWord ?? this.translatedWord,
      translatedWordId: translatedWordId ?? this.translatedWordId,
      mealType: mealType ?? this.mealType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'translatedWord': (translatedWord as TranslatedWordModel).toMap(),
      'translatedNames': translatedWordId,
      'type': MealTypeExtension.stringFromType(mealType),
    };
  }

  factory MealTypeModel.fromMap(Map<String, dynamic> map) {
    return MealTypeModel(
      map['id'],
      (map['translatedWord'] != null)
          ? TranslatedWordModel.fromMap(map['translatedWord'])
          : null,
      translatedWordId: map['translatedNames'] ?? '',
      mealType: MealTypeExtension.typeFromString(map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MealTypeModel.fromJson(String source) =>
      MealTypeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MealTypeModel(id: $id, translatedWord: $translatedWord, translatedWordId: $translatedWordId, mealType: $mealType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MealTypeModel &&
        other.id == id &&
        other.translatedWord == translatedWord &&
        other.translatedWordId == translatedWordId &&
        other.mealType == mealType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        translatedWord.hashCode ^
        translatedWordId.hashCode ^
        mealType.hashCode;
  }
}
