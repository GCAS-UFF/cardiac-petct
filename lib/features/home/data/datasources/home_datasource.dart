import 'dart:convert';

import 'package:cardiac_petct/features/home/data/datasources/constants/home_external_constants.dart';
import 'package:cardiac_petct/features/home/data/datasources/food_datasource_imp.dart';
import 'package:cardiac_petct/features/home/data/datasources/home_local_datasource.dart';
import 'package:cardiac_petct/features/home/data/datasources/meal_datasource_imp.dart';
import 'package:cardiac_petct/features/home/data/models/menu_model.dart';
import 'package:cardiac_petct/features/home/domain/entities/food.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class HomeDatasource {
  Future<MenuModel> getMenu();
}

class HomeDatasourceImp implements HomeDatasource {
  late final FirebaseDatabase database;
  final MealDatasource mealDatasource;
  final FoodDatasource foodDatasource;
  final HomeLocalDatasource homeLocalDatasource;

  HomeDatasourceImp(
      this.mealDatasource, this.foodDatasource, this.homeLocalDatasource) {
    database = FirebaseDatabase.instance;
    getMenu();
  }

  @override
  Future<MenuModel> getMenu() async {
    try {
      final cachedMenu = await homeLocalDatasource.getCachedMenu();
      if (cachedMenu != null) {
        return cachedMenu;
      } else {
        final ref = database.ref();
        final menuRef = ref
            .child(HomeExternalConstants.universal)
            .child(HomeExternalConstants.menu);
        final DataSnapshot response = await menuRef.get();
        final String json = jsonEncode(response.value);
        final Map<String, dynamic> map = jsonDecode(json);
        List<MenuModel> list = [];
        map.forEach((key, value) async {
          list.add(MenuModel.fromJson(jsonEncode(value)).copyWith(id: key));
        });
        for (var i = 0; i < list.length; i++) {
          List<Meal> meals = [];
          List<Food> allowedFood = [];
          for (String id in list[i].mealIds) {
            meals.add(await mealDatasource.getMeal(id));
          }
          for (String id in list[i].allowedFoodIds) {
            allowedFood.add(await foodDatasource.getFood(id));
          }
          list[i] = list[i].copyWith(meals: meals, allowedFood: allowedFood);
        }
        await homeLocalDatasource.cacheMenu(list.first);
        return list.first;
      }
    } catch (e) {
      rethrow;
    }
  }
}
