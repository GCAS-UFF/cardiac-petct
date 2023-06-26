import 'dart:convert';

import 'package:cardiac_petct/features/home/data/datasources/constants/home_external_constants.dart';
import 'package:cardiac_petct/features/home/data/datasources/home_local_datasource.dart';
import 'package:cardiac_petct/features/home/data/datasources/translated_word_datasource.dart';
import 'package:cardiac_petct/features/home/data/models/meal_type_model.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal_type.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class MealTypeDatasource {
  Future<List<MealTypeModel>> getMealTypeList();
  Future<MealType> geatMealType(String id);
}

class MealTypeDatasourceImp implements MealTypeDatasource {
  late final FirebaseDatabase database;
  final TranslatedWordDatasource translatedWordsDatasource;
  final HomeLocalDatasource homeLocalDatasource;

  MealTypeDatasourceImp(
      this.translatedWordsDatasource, this.homeLocalDatasource) {
    database = FirebaseDatabase.instance;
    getMealTypeList();
  }

  @override
  Future<List<MealTypeModel>> getMealTypeList() async {
    try {
      final cachedMealTypes = await homeLocalDatasource.getCachedMealTypes();
      if (cachedMealTypes != null) {
        return cachedMealTypes;
      } else {
        final ref = database.ref();
        final mealTypeRef = ref
            .child(HomeExternalConstants.universal)
            .child(HomeExternalConstants.mealType);
        final DataSnapshot response = await mealTypeRef.get();
        final String json = jsonEncode(response.value);
        final Map<String, dynamic> map = jsonDecode(json);
        List<MealTypeModel> list = [];
        map.forEach((key, value) async {
          list.add(MealTypeModel.fromMap(value).copyWith(id: key));
        });
        for (var i = 0; i < list.length; i++) {
          final translatedNames = await translatedWordsDatasource
              .getTranslatedWord(list[i].translatedWordId);
          list[i] = list[i].copyWith(translatedWord: translatedNames);
        }
        await homeLocalDatasource.cacheMealTypes(list);
        return list;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MealTypeModel> geatMealType(String id) async {
    try {
      final mealTypeRef = database
          .ref()
          .child(HomeExternalConstants.universal)
          .child(HomeExternalConstants.mealType)
          .child(id);
      final DataSnapshot response = await mealTypeRef.get();
      final String json = jsonEncode(response.value);
      final Map<String, dynamic> map = jsonDecode(json);
      MealTypeModel mealType = MealTypeModel.fromMap(map);
      final translatedNames = await translatedWordsDatasource
          .getTranslatedWord(mealType.translatedWordId);
      return mealType.copyWith(translatedWord: translatedNames, id: id);
    } catch (e) {
      rethrow;
    }
  }
}
