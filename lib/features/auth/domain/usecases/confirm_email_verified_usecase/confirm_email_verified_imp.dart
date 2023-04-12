import 'package:cardiac_petct/features/auth/domain/repositories/auth_repository.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/confirm_email_verified_usecase/confirm_email_verified_usecase.dart';
import 'package:cardiac_petct/src/errors/failure.dart';
import 'package:dartz/dartz.dart';

class ConfirmEmailVerifiedUsecaseImp implements ConfirmEmailVerifiedUsecase {
  final AuthRepository authRepository;
  ConfirmEmailVerifiedUsecaseImp(this.authRepository);
  @override
  Future<Either<Failure,bool>> call() async {
    return await authRepository.confirmEmailVerified();
  }
}
