import 'package:cardiac_petct/features/anamnesis/data/datasources/anamnesis_local_datasource.dart';
import 'package:cardiac_petct/features/anamnesis/data/models/anamnesis_model.dart';
import 'package:cardiac_petct/features/anamnesis/domain/entities/anamnesis_entity.dart';
import 'package:cardiac_petct/features/anamnesis/domain/repositories/anamnesis_repository.dart';
import 'package:cardiac_petct/src/platform/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:cardiac_petct/src/errors/failure.dart';

class AnamnesisRepositoryImp extends AnamnesisRepository {
  final AnamnesisLocalDatasource anamnesisLocalDatasource;
  final NetworkInfo networkInfo;
  AnamnesisRepositoryImp(this.anamnesisLocalDatasource, this.networkInfo);
  @override
  Future<Either<Failure, void>> call(AnamnesisEntity anamnesisEntity) async {
    try {
      final result = await anamnesisLocalDatasource
          .setLocalAnamnesis(AnamnesisModel.fromEntity(anamnesisEntity));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
