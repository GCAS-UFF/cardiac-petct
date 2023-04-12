import 'package:cardiac_petct/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:cardiac_petct/features/auth/data/models/user_model.dart';
import 'package:cardiac_petct/src/errors/failure.dart';
import 'package:cardiac_petct/features/auth/domain/entities/user_entity.dart';
import 'package:cardiac_petct/features/auth/domain/repositories/auth_repository.dart';
import 'package:cardiac_petct/src/platform/network_info.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  final NetworkInfo networkInfo;

  AuthRepositoryImp(this.authRemoteDatasource, this.networkInfo);
  @override
  Future<Either<Failure, bool>> confirmEmailVerified() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await authRemoteDatasource.confirmEmailVerified();
        return Right(result);
      } on Failure catch (e) {
        return Left(e);
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await authRemoteDatasource.login(email, password);
        return Right(result);
      } on Failure catch (e) {
        return Left(e);
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> recoverPassword(String email) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await authRemoteDatasource.recoverPassword(email);
        return Right(result);
      } on Failure catch (e) {
        return Left(e);
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> registration(
      UserEntity userEntity, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await authRemoteDatasource.registration(
            UserModel.fromEntity(userEntity), password);
        return Right(result);
      } on Failure catch (e) {
        return Left(e);
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> sendEmailVerification() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await authRemoteDatasource.sendEmailVerification();
        return Right(result);
      } on Failure catch (e) {
        return Left(e);
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<void> signout() {
    // TODO: implement signout
    throw UnimplementedError();
  }
}
