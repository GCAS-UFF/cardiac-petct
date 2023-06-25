import 'package:cardiac_petct/features/home/domain/entities/food.dart';
import 'package:cardiac_petct/features/home/domain/entities/measurement.dart';
import 'package:cardiac_petct/features/home/domain/entities/translated_word.dart';

class MealItem {
  final String? id;
  final String? translatedNameId;
  final TranslatedWord? translatedWord;
  final List<Food>? foodsItens;
  final List<String> foodIds;
  final List<Measurement> measurements;

  MealItem({
    required this.foodIds,
    required this.measurements,
    this.id,
    this.translatedNameId,
    this.translatedWord,
    this.foodsItens,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'translatedNames': translatedNameId,
      'foods': foodIds,
      'measurements': measurements.map((x) => x.toMap()).toList(),
    };
  }
}
