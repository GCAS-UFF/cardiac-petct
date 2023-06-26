import 'dart:convert';

import 'package:cardiac_petct/features/home/data/datasources/constants/home_external_constants.dart';
import 'package:cardiac_petct/features/home/data/datasources/meal_item_datasource_imp.dart';
import 'package:cardiac_petct/features/home/data/datasources/meal_type_datasource_imp.dart';
import 'package:cardiac_petct/features/home/data/models/meal_model.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal_item.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class MealDatasource {
  Future<List<MealModel>> getMealList();
  Future<MealModel> getMeal(String id);
}

class MealDatasourceImp implements MealDatasource {
  late FirebaseDatabase database;
  final MealItemDatasource mealDatasource;
  final MealTypeDatasource mealTypeDatasource;

  MealDatasourceImp(this.mealDatasource, this.mealTypeDatasource) {
    database = FirebaseDatabase.instance;
    getMealList();
  }

  @override
  Future<List<MealModel>> getMealList() async {
    try {
      final ref = database.ref();
      final mealRef = ref
          .child(HomeExternalConstants.universal)
          .child(HomeExternalConstants.meal);
      final DataSnapshot response = await mealRef.get();
      final String json = jsonEncode(response.value);
      final Map<String, dynamic> map = jsonDecode(json);
      List<MealModel> list = [];
      map.forEach((key, value) async {
        list.add(MealModel.fromJson(jsonEncode(value)).copyWith(id: key));
      });

      for (var i = 0; i < list.length; i++) {
        List<MealItem> meals = [];
        for (String id in list[i].itemsIds) {
          meals.add(await mealDatasource.getMealItem(id));
        }
        final mealType = await mealTypeDatasource.geatMealType(list[i].typeId);
        list[i] = list[i].copyWith(items: meals, type: mealType);
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MealModel> getMeal(String id) async {
    try {
      final mealRef = database
          .ref()
          .child(HomeExternalConstants.universal)
          .child(HomeExternalConstants.meal)
          .child(id);
      final DataSnapshot response = await mealRef.get();
      final String json = jsonEncode(response.value);
      final Map<String, dynamic> map = jsonDecode(json);
      MealModel meal = MealModel.fromMap(map).copyWith(id: id);
      List<MealItem> mealsItems = [];
      for (String id in meal.itemsIds) {
        mealsItems.add(await mealDatasource.getMealItem(id));
      }
      final mealType = await mealTypeDatasource.geatMealType(meal.typeId);
      return meal.copyWith(items: mealsItems, type: mealType);
    } catch (e) {
      rethrow;
    }
  }
}
