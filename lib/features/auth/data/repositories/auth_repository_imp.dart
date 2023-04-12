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
  Future<void> confirmEmailVerified() {
    // TODO: implement confirmEmailVerified
    throw UnimplementedError();
  }

  @override
  Future<void> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> recoverPassword() {
    // TODO: implement recoverPassword
    throw UnimplementedError();
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
  Future<void> sendEmailVerification() {
    // TODO: implement sendEmailVerification
    throw UnimplementedError();
  }

  @override
  Future<void> signout() {
    // TODO: implement signout
    throw UnimplementedError();
  }
}
