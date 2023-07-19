import 'dart:convert';

import 'package:cardiac_petct/features/home/data/models/food_model.dart';
import 'package:cardiac_petct/features/home/data/models/meal_model.dart';
import 'package:flutter/foundation.dart';

import 'package:cardiac_petct/features/home/domain/entities/food.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
import 'package:cardiac_petct/features/home/domain/entities/menu.dart';

class MenuModel extends Menu {
  MenuModel(
    super.id,
    super.allowedFood,
    super.meals,
    super.breakFasts,
    super.morningSnacks,
    super.lunchs,
    super.afternoonSnacks,
    super.dinners,
    super.suppers,
    super.dietDay, {
    required super.allowedFoodIds,
    required super.mealIds,
    required super.country,
    required super.durationInDays,
  });

  MenuModel copyWith({
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
    return MenuModel(
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'allowedFoodsItens':
          allowedFood!.map((e) => (e as FoodModel).toMap()).toList(),
      'mealsItens': meals!.map((e) => (e as MealModel).toMap()).toList(),
      'breakFasts': breakFasts!.map((e) => (e as MealModel).toMap()).toList(),
      'morningSnacks':
          morningSnacks!.map((e) => (e as MealModel).toMap()).toList(),
      'lunchs': lunchs!.map((e) => (e as MealModel).toMap()).toList(),
      'afternoonSnacks':
          afternoonSnacks!.map((e) => (e as MealModel).toMap()).toList(),
      'dinners': dinners!.map((e) => (e as MealModel).toMap()).toList(),
      'suppers': suppers!.map((e) => (e as MealModel).toMap()).toList(),
      'country': country,
      'durationInDays': durationInDays,
    };
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      map['id'],
      (map['allowedFoodsItens'] != null)
          ? List<Food>.from(
              map['allowedFoodsItens']?.map((x) => FoodModel.fromMap(x)))
          : [],
      (map['mealsItens'] != null)
          ? List<MealModel>.from(
              map['mealsItens']?.map((x) => MealModel.fromMap(x)),
            )
          : [],
      (map['breakFasts'] != null)
          ? List<MealModel>.from(
              map['breakFasts']?.map((x) => MealModel.fromMap(x)),
            )
          : [],
      (map['morningSnacks'] != null)
          ? List<MealModel>.from(
              map['morningSnacks']?.map((x) => MealModel.fromMap(x)),
            )
          : [],
      (map['lunchs'] != null)
          ? List<MealModel>.from(
              map['lunchs']?.map((x) => MealModel.fromMap(x)),
            )
          : [],
      (map['afternoonSnacks'] != null)
          ? List<MealModel>.from(
              map['afternoonSnacks']?.map((x) => MealModel.fromMap(x)),
            )
          : [],
      (map['dinners'] != null)
          ? List<MealModel>.from(
              map['dinners']?.map((x) => MealModel.fromMap(x)),
            )
          : [],
      (map['suppers'] != null)
          ? List<MealModel>.from(
              map['suppers']?.map((x) => MealModel.fromMap(x)),
            )
          : [],
      null,
      allowedFoodIds: (map['allowedFoods'] != null)
          ? List<String>.from(map['allowedFoods'])
          : [],
      mealIds: (map['meals'] != null) ? List<String>.from(map['meals']) : [],
      country: map['country'] ?? '',
      durationInDays: map['durationInDays']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) =>
      MenuModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MenuModel(id: $id, allowedFood: $allowedFood, meals: $meals, allowedFoodIds: $allowedFoodIds, mealIds: $mealIds, country: $country, durationInDays: $durationInDays)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MenuModel &&
        other.id == id &&
        listEquals(other.allowedFood, allowedFood) &&
        listEquals(other.meals, meals) &&
        listEquals(other.allowedFoodIds, allowedFoodIds) &&
        listEquals(other.mealIds, mealIds) &&
        other.country == country &&
        other.durationInDays == durationInDays;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        allowedFood.hashCode ^
        meals.hashCode ^
        allowedFoodIds.hashCode ^
        mealIds.hashCode ^
        country.hashCode ^
        durationInDays.hashCode;
  }
}
