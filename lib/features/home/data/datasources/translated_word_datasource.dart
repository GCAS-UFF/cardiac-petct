import 'package:cardiac_petct/features/home/data/datasources/constants/home_external_constants.dart';
import 'package:cardiac_petct/features/home/data/models/translated_words_model.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class TranslatedWordDatasource {
  Future<List<TranslatedWordModel>> getTranslatedWordList();
  Future<TranslatedWordModel> getTranslatedWord(String id);
}

class TranslatedWordDatasourceImp implements TranslatedWordDatasource {
  late final FirebaseDatabase firebaseDatabase;
  TranslatedWordDatasourceImp() {
    firebaseDatabase = FirebaseDatabase.instance;
    getTranslatedWordList();
  }

  List<TranslatedWordModel> cachedList = [];

  @override
  Future<List<TranslatedWordModel>> getTranslatedWordList() async {
    try {
      final ref = firebaseDatabase.ref();
      final translateWordRef = ref
          .child(HomeExternalConstants.universal)
          .child(HomeExternalConstants.translatedNames);
      final response = await translateWordRef.get();
      final map = response.value as Map<String, dynamic>;
      List<TranslatedWordModel> list = [];
      map.forEach((key, value) {
        list.add(TranslatedWordModel.fromMap(value).copyWith(id: key));
      });
      cachedList = list;
      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TranslatedWordModel> getTranslatedWord(String id) async {
    try {
      final translatedWord =
          cachedList.firstWhere((element) => element.id == id);
      return translatedWord;
    } catch (e) {
      rethrow;
    }
  }
}
