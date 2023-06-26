import 'dart:convert';

import 'package:cardiac_petct/features/home/data/datasources/constants/home_external_constants.dart';
import 'package:cardiac_petct/features/home/data/datasources/translated_word_datasource.dart';
import 'package:cardiac_petct/features/home/data/models/food_classification_model.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class FoodClassificationRemoteDatasource {
  Future<List<FoodClassificationModel>> getFoodClassificationList();
  Future<FoodClassificationModel> getFoodClassification(String id);
}

class FoodClassificationRemoteDatasourceImp
    implements FoodClassificationRemoteDatasource {
  late final FirebaseDatabase firebaseDatabase;
  final TranslatedWordDatasource translatedWordDatasource;
  FoodClassificationRemoteDatasourceImp(this.translatedWordDatasource) {
    firebaseDatabase = FirebaseDatabase.instance;
    getFoodClassificationList();
  }

  @override
  Future<List<FoodClassificationModel>> getFoodClassificationList() async {
    try {
      final ref = firebaseDatabase.ref();
      final foodClassificationRef = ref
          .child(HomeExternalConstants.universal)
          .child(HomeExternalConstants.classificationFood);
      final DataSnapshot response = await foodClassificationRef.get();
      final String json = jsonEncode(response.value);
      final Map<String, dynamic> map = jsonDecode(json);
      List<FoodClassificationModel> list = [];
      map.forEach((key, value) async {
        list.add(FoodClassificationModel.fromMap(value).copyWith(id: key));
      });
      for (var i = 0; i < list.length; i++) {
        final translatedNames = await translatedWordDatasource
            .getTranslatedWord(list[i].translatedWordId);
        list[i] = list[i].copyWith(translatedWord: translatedNames);
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FoodClassificationModel> getFoodClassification(String id) async {
    try {
      final ref = firebaseDatabase.ref();
      final foodClassificationRef = ref
          .child(HomeExternalConstants.universal)
          .child(HomeExternalConstants.classificationFood)
          .child(id);
      final DataSnapshot response = await foodClassificationRef.get();
      final String json = jsonEncode(response.value);
      final Map<String, dynamic> map = jsonDecode(json);
      final foodClassification =
          FoodClassificationModel.fromMap(map).copyWith(id: id);
      final translatedWord = await translatedWordDatasource
          .getTranslatedWord(foodClassification.translatedWordId);
      return foodClassification.copyWith(translatedWord: translatedWord);
    } catch (e) {
      rethrow;
    }
  }
}
