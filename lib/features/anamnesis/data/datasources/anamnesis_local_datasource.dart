import 'dart:convert';

import 'package:cardiac_petct/features/anamnesis/data/models/anamnesis_model.dart';
import 'package:cardiac_petct/features/anamnesis/domain/entities/anamnesis_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AnamnesisLocalDatasource {
  Future<void> setLocalAnamnesis(AnamnesisEntity anamnesis);
  Future<AnamnesisModel?> getLocalAnamnesis();
}

class AnamnesisLocalDatasourceImp implements AnamnesisLocalDatasource {
  final Future<SharedPreferences> _preferences =
      SharedPreferences.getInstance();

  @override
  Future<void> setLocalAnamnesis(AnamnesisEntity anamnesis) async {
    try {
      final SharedPreferences prefs = await _preferences;
      final anamnesisJson = AnamnesisModel.fromEntity(anamnesis).toJson();
      await prefs.setString('anamnesis', anamnesisJson);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AnamnesisModel?> getLocalAnamnesis() async {
    try {
      SharedPreferences prefs = await _preferences;
      String anamnesisJson = prefs.getString('anamnesis') ?? '';
      if (anamnesisJson.isEmpty) {
        return null;
      }
      return AnamnesisModel.fromMap(jsonDecode(anamnesisJson));
    } catch (e) {
      rethrow;
    }
  }
}
