import 'package:cardiac_petct/features/home/domain/entities/food_classification.dart';
import 'package:cardiac_petct/features/home/domain/entities/translated_word.dart';

class Food {
  final String? id;
  final FoodClassification? foodClassification;
  final TranslatedWord? translatedWord;
  final String foodClassificationId;
  final String translatedWordId;

  Food(this.id, this.foodClassification, this.translatedWord,
      {required this.foodClassificationId, required this.translatedWordId});
}
