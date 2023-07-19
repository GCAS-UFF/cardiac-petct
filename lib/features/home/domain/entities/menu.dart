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
  final DateTime? dietDay;
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
    this.suppers,
    this.dietDay, {
    required this.allowedFoodIds,
    required this.mealIds,
    required this.country,
    required this.durationInDays,
  });

  Menu copyWith({
    String? id,
    List<Food>? allowedFood,
    List<Meal>? meals,
    List<Meal>? breakFasts,
    List<Meal>? morningSnacks,
    List<Meal>? lunchs,
    List<Meal>? afternoonSnacks,
    List<Meal>? dinners,
    List<Meal>? suppers,
    List<String>? allowedFoodIds,
    List<String>? mealIds,
    DateTime? dietDay,
    String? country,
    int? durationInDays,
  }) {
    return Menu(
      id ?? this.id,
      allowedFood ?? this.allowedFood,
      meals ?? this.meals,
      breakFasts ?? this.breakFasts,
      morningSnacks ?? this.morningSnacks,
      lunchs ?? this.lunchs,
      afternoonSnacks ?? this.afternoonSnacks,
      dinners ?? this.dinners,
      suppers ?? this.suppers,
      dietDay ?? this.dietDay,
      allowedFoodIds: allowedFoodIds ?? this.allowedFoodIds,
      mealIds: mealIds ?? this.mealIds,
      country: country ?? this.country,
      durationInDays: durationInDays ?? this.durationInDays,
    );
  }
}
