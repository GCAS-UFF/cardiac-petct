import 'package:cardiac_petct/features/home/domain/entities/translated_word.dart';

enum MealTypeEnum {
  afternoonSnack,
  supper,
  dinner,
  morningSnack,
  lunch,
  breakfast,
}

class MealType {
  final String? id;
  final TranslatedWord? translatedWord;
  final String translatedWordId;
  final MealTypeEnum mealType;

  MealType(this.id, this.translatedWord,
      {required this.translatedWordId, required this.mealType});
}
