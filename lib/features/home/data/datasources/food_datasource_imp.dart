import 'package:cardiac_petct/features/home/data/datasources/constants/home_external_constants.dart';
import 'package:cardiac_petct/features/home/data/datasources/translated_word_datasource.dart';
import 'package:cardiac_petct/features/home/data/datasources/food_classification_remote_datasource_imp.dart';
import 'package:cardiac_petct/features/home/data/models/food_model.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class FoodDatasource {
  Future<List<FoodModel>> getFoodList();
  Future<FoodModel> getFood(String id);
}

class FoodsDatasourceImp implements FoodDatasource {
  late final FirebaseDatabase database;
  final FoodClassificationRemoteDatasource
      firebaseFoodClassificationRemoteDatasource;
  final TranslatedWordDatasource translatedWordDatasource;

  FoodsDatasourceImp(this.firebaseFoodClassificationRemoteDatasource,
      this.translatedWordDatasource) {
    database = FirebaseDatabase.instance;
    getFoodList();
  }

  List<FoodModel> cachedList = [];

  @override
  Future<List<FoodModel>> getFoodList() async {
    try {
      final ref = database.ref();
      final foodRef = ref
          .child(HomeExternalConstants.universal)
          .child(HomeExternalConstants.food);
      final response = await foodRef.get();
      final map = response.value as Map<String, dynamic>;
      List<FoodModel> list = [];
      map.forEach((key, value) async {
        list.add(FoodModel.fromMap(value).copyWith(id: key));
      });
      for (var i = 0; i < list.length; i++) {
        final translatedNames = await translatedWordDatasource
            .getTranslatedWord(list[i].translatedWordId);
        final foodClassification =
            await firebaseFoodClassificationRemoteDatasource
                .getFoodClassification(list[i].foodClassificationId);
        list[i] = list[i].copyWith(
            translatedWord: translatedNames,
            foodClassification: foodClassification);
      }
      cachedList = list;
      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FoodModel> getFood(String id) async {
    try {
      return cachedList.firstWhere((element) => element.id == id);
    } catch (e) {
      rethrow;
    }
  }
}
