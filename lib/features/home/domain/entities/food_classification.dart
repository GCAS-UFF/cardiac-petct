import 'package:cardiac_petct/features/home/domain/entities/translated_word.dart';

enum FoodClassificationType {
  fatAndOilSeeds,
  vegetables,
  carbohydrates,
  proteins,
  liquids,
  cheeses,
}

class FoodClassification {
  final String? id;
  final TranslatedWord? translatedWord;
  final String translatedWordId;
  final FoodClassificationType type;
  FoodClassification(this.id, this.translatedWord,
      {required this.type, required this.translatedWordId});
}
