import 'package:cardiac_petct/features/home/domain/entities/food.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal.dart';

class Menu {
  final String? id;
  final List<Food>? allowedFood;
  final List<Meal>? meals;
  final List<Meal>? breakFasts;
  final List<Meal>? morningSnacks;
  final List<Meal>? lunchs;
  final List<Meal>? afternoonSnacks;
  final List<Meal>? dinners;
  final List<Meal>? suppers;
  final List<String> allowedFoodIds;
  final List<String> mealIds;
  final String country;
  final int durationInDays;

  Menu(
    this.id,
    this.allowedFood,
    this.meals,
    this.breakFasts,
    this.morningSnacks,
    this.lunchs,
    this.afternoonSnacks,
    this.dinners,
    this.suppers, {
    required this.allowedFoodIds,
    required this.mealIds,
    required this.country,
    required this.durationInDays,
  });
}
