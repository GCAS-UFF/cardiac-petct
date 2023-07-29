import 'package:cardiac_petct/features/exam_settings/data/datasources/exam_settings_datasource.dart';
import 'package:cardiac_petct/features/exam_settings/domain/entities/exam_settings_entity.dart';
import 'package:cardiac_petct/features/exam_settings/domain/repositories/exam_settings_repository.dart';
import 'package:dartz/dartz.dart';

class ExamSettingsRepositoryImp implements ExamSettingsRepository {
  final ExamSettingsDatasource datasource;

  ExamSettingsRepositoryImp(this.datasource);

  @override
  Future<Either<Exception, void>> cacheExamSettings(
      ExamSettingsEntity exameSettings) async {
    try {
      final response = await datasource.cacheExamSettings(exameSettings);
      return Right(response);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, ExamSettingsEntity>> getExamSettings() async {
    try {
      final response = await datasource.getExamSettings();
      if (response == null) {
        return Left(Exception());
      }
      return Right(response);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
