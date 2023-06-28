import 'dart:convert';

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
    final map = jsonDecode(prefs.getString('dietDays') ?? '');
    map.map((day) {
      if (day.id == menuId) {
        final dietDay = MenuModel.fromJson(day);
        if (meal.type!.mealType == MealTypeEnum.breakfast) {
          dietDay.breakFasts!.clear();
          dietDay.breakFasts!.add(meal);
        }
        map[day.id] = dietDay.toMap();
      }
    }).toList();
    await prefs.setString('dietDays', jsonEncode(map));
  }
}
