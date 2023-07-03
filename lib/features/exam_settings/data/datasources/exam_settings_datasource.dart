import 'dart:convert';

import 'package:cardiac_petct/features/exam_settings/data/models/exam_settings_model.dart';
import 'package:cardiac_petct/features/exam_settings/domain/entities/exam_settings_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ExamSettingsDatasource {
  Future<void> cacheExamSettings(ExamSettingsEntity exameSettings);
  Future<ExamSettingsModel?> getExamSettings();
}

class ExamSettingsDatasourceImp implements ExamSettingsDatasource {
  final Future<SharedPreferences> _preferences =
      SharedPreferences.getInstance();
  @override
  Future<void> cacheExamSettings(ExamSettingsEntity exameSettings) async {
    try {
      final SharedPreferences prefs = await _preferences;
      final examSettings = ExamSettingsModel.fromEntity(exameSettings).toJson();
      await prefs.setString('examSettings', examSettings);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ExamSettingsModel?> getExamSettings() async {
    try {
      SharedPreferences prefs = await _preferences;
      String examSettings = prefs.getString('examSettings') ?? '';
      if (examSettings.isEmpty) {
        return null;
      }
      return ExamSettingsModel.fromMap(jsonDecode(examSettings));
    } catch (e) {
      rethrow;
    }
  }
}
