import 'package:cardiac_petct/features/anamnesis/domain/entities/anamnesis_entity.dart';
import 'package:cardiac_petct/src/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SendAnamnesisAnswersUsecase {
  Future<Either<Failure, void>> call(AnamnesisEntity anamnesisEntity);
}
