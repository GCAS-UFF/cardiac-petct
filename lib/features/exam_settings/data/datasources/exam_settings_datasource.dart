import 'package:cardiac_petct/features/exam_settings/domain/entities/exam_settings_entity.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class ExamSettingsDatasource {
  Future<void> call(ExameSettingsEntity exameSettings);
}

class ExamSettingsDatasourceImp implements ExamSettingsDatasource {
  late final FirebaseDatabase database;

  @override
  Future<void> call(ExameSettingsEntity exameSettings) async {
    try {

    } catch (e) {
      rethrow;
    }
  }
}
