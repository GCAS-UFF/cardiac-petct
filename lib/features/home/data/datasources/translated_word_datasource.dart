import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:cardiac_petct/features/home/data/models/translated_words_model.dart';
import 'package:cardiac_petct/features/home/data/datasources/constants/home_external_constants.dart';

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

  List<TranslatedWordModel> cachedList = <TranslatedWordModel>[];

  @override
  Future<List<TranslatedWordModel>> getTranslatedWordList() async {
    try {
      final DatabaseReference ref = firebaseDatabase.ref();
      final DatabaseReference translateWordRef = ref
          .child(HomeExternalConstants.universal)
          .child(HomeExternalConstants.translatedNames);
      final DataSnapshot response = await translateWordRef.get();
      final String json = jsonEncode(response.value);
      final Map<String, dynamic> map = jsonDecode(json);
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
      if (cachedList.isEmpty) {
        print('cachedList empty');
        final DatabaseReference ref = firebaseDatabase.ref();
        final DatabaseReference translateWordRef = ref
            .child(HomeExternalConstants.universal)
            .child(HomeExternalConstants.translatedNames)
            .child(id);
        final DataSnapshot response = await translateWordRef.get();
        final String json = jsonEncode(response.value);
        final Map<String, dynamic> map = jsonDecode(json);
        return TranslatedWordModel.fromMap(map).copyWith(id: id);
      } else {
        print('cachedList not empty');
        return cachedList.firstWhere((element) => element.id == id);
      }
    } catch (e) {
      rethrow;
    }
  }
}
