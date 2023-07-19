import 'package:cardiac_petct/features/exam_settings/domain/entities/exam_settings_entity.dart';
import 'package:cardiac_petct/features/exam_settings/domain/repositories/exam_settings_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetExamSettingsUsecase {
  Future<Either<Exception, ExamSettingsEntity>> call();
}

class GetExamSettingsUsecaseImp implements GetExamSettingsUsecase {
  final ExamSettingsRepository repository;

  GetExamSettingsUsecaseImp(this.repository);

  @override
  Future<Either<Exception, ExamSettingsEntity>> call() async {
    return await repository.getExamSettings();
  }
}
