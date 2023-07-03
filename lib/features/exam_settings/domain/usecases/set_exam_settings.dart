import 'package:cardiac_petct/features/exam_settings/domain/entities/exam_settings_entity.dart';
import 'package:cardiac_petct/features/exam_settings/domain/repositories/exam_settings_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SetExamSettingsUsecase {
  Future<Either<Exception, void>> call(ExameSettingsEntity examSettings);
}

class SetExamSettingsUsecaseImp implements SetExamSettingsUsecase {
  final ExamSettingsRepository repository;

  SetExamSettingsUsecaseImp(this.repository);

  @override
  Future<Either<Exception, void>> call(ExameSettingsEntity examSettings) async {
    return await repository(examSettings);
  }
}
