import 'package:cardiac_petct/features/anamnesis/domain/entities/anamnesis_entity.dart';
import 'package:cardiac_petct/features/anamnesis/domain/repositories/anamnesis_repository.dart';
import 'package:cardiac_petct/features/anamnesis/domain/usecases/send_anamnesis_answers_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:cardiac_petct/src/errors/failure.dart';

class SendAnamnesisAnswersUsecaseImp extends SendAnamnesisAnswersUsecase {
  final AnamnesisRepository anamnesisRepository;

  SendAnamnesisAnswersUsecaseImp(this.anamnesisRepository);

  @override
  Future<Either<Failure, void>> call(AnamnesisEntity anamnesisEntity) async {
    return await anamnesisRepository(anamnesisEntity);
  }
}
