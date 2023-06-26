import 'package:cardiac_petct/features/home/domain/entities/food.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal.dart';

class Menu {
  final String? id;
  final List<Food>? allowedFood;
  final List<Meal>? meals;
  final List<Meal>? breakFasts;
  final List<String> allowedFoodIds;
  final List<String> mealIds;
  final String country;
  final int durationInDays;

  Menu(
    this.id,
    this.allowedFood,
    this.meals,
    this.breakFasts, {
    required this.allowedFoodIds,
    required this.mealIds,
    required this.country,
    required this.durationInDays,
  });
}
