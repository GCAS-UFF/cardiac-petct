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

  List<FoodClassificationModel> cachedList = [];

  @override
  Future<List<FoodClassificationModel>> getFoodClassificationList() async {
    try {
      if (cachedList.isEmpty) {
        final ref = firebaseDatabase.ref();
        final translateWordRef = ref
            .child(HomeExternalConstants.universal)
            .child(HomeExternalConstants.classificationFood);
        final response = await translateWordRef.get();
        final map = response.value as Map<String, dynamic>;
        List<FoodClassificationModel> list = [];
        map.forEach((key, value) async {
          list.add(FoodClassificationModel.fromMap(value).copyWith(id: key));
        });
        for (var i = 0; i < list.length; i++) {
          final translatedNames = await translatedWordDatasource
              .getTranslatedWord(list[i].translatedWordId);
          list[i] = list[i].copyWith(translatedWord: translatedNames);
        }
        cachedList = list;
        return list;
      } else {
        return cachedList;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FoodClassificationModel> getFoodClassification(String id) async {
    try {
      final foodClassification =
          cachedList.firstWhere((element) => element.id == id);
      return foodClassification;
    } catch (e) {
      rethrow;
    }
  }
}
