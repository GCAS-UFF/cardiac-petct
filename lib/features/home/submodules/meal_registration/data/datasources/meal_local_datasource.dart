import 'dart:convert';

import 'package:cardiac_petct/features/home/data/models/meal_model.dart';
import 'package:cardiac_petct/features/home/data/models/menu_model.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MealLocalDatasource {
  Future<void> registrateMeal(String menuId, Meal meal);
}

class MealLocalDatasourceImp implements MealLocalDatasource {
  late final Future<SharedPreferences> _preferences =
      SharedPreferences.getInstance();

  @override
  Future<void> registrateMeal(String menuId, Meal meal) async {
    SharedPreferences prefs = await _preferences;
    String json = prefs.getString('dietDays') ?? '';
    final map = jsonDecode(json);
    List<MenuModel> dietDays = [];
    map.map((value) async {
      dietDays.add(MenuModel.fromJson(value));
    }).toList();
    for (int i = 0; i < dietDays.length; i++) {
      final mealModel = MealModel.fromEntity(meal);
      if (dietDays[i].id == menuId) {
        if (meal.type!.mealType == MealTypeEnum.breakfast) {
          dietDays[i].breakFasts!.clear();
          dietDays[i].breakFasts!.add(mealModel.copyWith(isRegistered: true));
        }
      }
    }
    await prefs.setString('dietDays', jsonEncode(dietDays));
    String json1 = prefs.getString('dietDays') ?? '';
    final map1 = jsonDecode(json1);
    List<MenuModel> dietDays1 = [];
    map1.map((value) async {
      dietDays1.add(MenuModel.fromJson(value));
    }).toList();
  }
}
