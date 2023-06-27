import 'dart:convert';

import 'package:cardiac_petct/features/home/data/datasources/constants/home_external_constants.dart';
import 'package:cardiac_petct/features/home/data/datasources/translated_word_datasource.dart';
import 'package:cardiac_petct/features/home/data/datasources/food_datasource_imp.dart';
import 'package:cardiac_petct/features/home/data/models/food_model.dart';
import 'package:cardiac_petct/features/home/data/models/meal_item_model.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class MealItemDatasource {
  Future<List<MealItemModel>> getMealItemList();
  Future<MealItemModel> getMealItem(String id);
}

class MealItemDatasourceImp implements MealItemDatasource {
  late FirebaseDatabase database;
  final TranslatedWordDatasource translatedWordsDatasource;
  final FoodDatasource foodDatasource;

  MealItemDatasourceImp(this.translatedWordsDatasource, this.foodDatasource) {
    database = FirebaseDatabase.instance;
    getMealItemList();
  }

  @override
  Future<List<MealItemModel>> getMealItemList() async {
    try {
      final ref = database.ref();
      final mealItemRef = ref
          .child(HomeExternalConstants.universal)
          .child(HomeExternalConstants.mealItem);
      final DataSnapshot response = await mealItemRef.get();
      final String json = jsonEncode(response.value);
      final Map<String, dynamic> map = jsonDecode(json);
      List<MealItemModel> list = [];
      map.forEach((key, value) async {
        list.add(MealItemModel.fromJson(jsonEncode(value)).copyWith(id: key));
      });
      for (var i = 0; i < list.length; i++) {
        if (list[i].translatedNameId != null) {
          final translatedNames = await translatedWordsDatasource
              .getTranslatedWord(list[i].translatedNameId!);
          list[i] = list[i].copyWith(translatedWord: translatedNames);
        }
        List<FoodModel> foods = [];
        for (String foodId in list[i].foodIds) {
          final foodItem = await foodDatasource.getFood(foodId);
          foods.add(foodItem);
        }
        list[i] = list[i].copyWith(foodsItens: foods);
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MealItemModel> getMealItem(String id) async {
    try {
      final mealItemRef = database
          .ref()
          .child(HomeExternalConstants.universal)
          .child(HomeExternalConstants.mealItem)
          .child(id);
      final DataSnapshot response = await mealItemRef.get();
      final String json = jsonEncode(response.value);
      final Map<String, dynamic> map = jsonDecode(json);
      MealItemModel mealItem = MealItemModel.fromMap(map).copyWith(id: id);
      if (mealItem.translatedNameId != null) {
        final translatedNames = await translatedWordsDatasource
            .getTranslatedWord(mealItem.translatedNameId!);
        mealItem = mealItem.copyWith(translatedWord: translatedNames);
      }
      List<FoodModel> foods = [];
      for (String foodId in mealItem.foodIds) {
        final foodItem = await foodDatasource.getFood(foodId);
        foods.add(foodItem);
      }
      return mealItem.copyWith(foodsItens: foods, id: response.key);
    } catch (e) {
      rethrow;
    }
  }
}
