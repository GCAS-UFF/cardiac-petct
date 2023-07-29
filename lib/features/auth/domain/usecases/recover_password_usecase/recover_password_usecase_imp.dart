import 'package:cardiac_petct/features/auth/domain/repositories/auth_repository.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/recover_password_usecase/recover_password_usecase.dart';
import 'package:cardiac_petct/src/errors/failure.dart';
import 'package:dartz/dartz.dart';

class RecoverPasswordUsecaseImp implements RecoverPasswordUsecase {
  final AuthRepository authRepository;
  RecoverPasswordUsecaseImp(this.authRepository);

  @override
  Future<Either<Failure, void>> call(String email) async {
    return await authRepository.recoverPassword(email);
  }
}
