import 'package:cardiac_petct/features/exam_settings/domain/entities/exam_settings_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ExamSettingsRepository {
  Future<Either<Exception, void>> cacheExamSettings(
      ExamSettingsEntity exameSettings);
  Future<Either<Exception, ExamSettingsEntity>> getExamSettings();
}
