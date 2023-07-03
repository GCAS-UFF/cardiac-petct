import 'package:cardiac_petct/features/exam_settings/data/datasources/exam_settings_datasource.dart';
import 'package:cardiac_petct/features/exam_settings/domain/entities/exam_settings_entity.dart';
import 'package:cardiac_petct/features/exam_settings/domain/repositories/exam_settings_repository.dart';
import 'package:dartz/dartz.dart';

class ExamSettingsRepositoryImp implements ExamSettingsRepository {
  final ExamSettingsDatasource datasource;

  ExamSettingsRepositoryImp(this.datasource);

  @override
  Future<Either<Exception, void>> call(
      ExameSettingsEntity exameSettings) async {
    try {
      final response = await datasource(exameSettings);
      return Right(response);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
