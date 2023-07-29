import 'package:cardiac_petct/src/errors/failure.dart';
import 'package:cardiac_petct/features/auth/domain/entities/user_entity.dart';
import 'package:cardiac_petct/features/auth/domain/repositories/auth_repository.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/registration_usecase/register_usecase.dart';
import 'package:dartz/dartz.dart';

class RegistrationUsecaseImp implements RegistrationUsecase {
  final AuthRepository authRepository;
  RegistrationUsecaseImp(this.authRepository);

  @override
  Future<Either<Failure, void>> call(
      UserEntity userEntity, String password) async {
    return await authRepository.registration(userEntity, password);
  }
}
