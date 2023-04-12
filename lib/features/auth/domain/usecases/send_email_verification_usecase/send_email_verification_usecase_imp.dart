import 'package:cardiac_petct/features/auth/domain/repositories/auth_repository.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/send_email_verification_usecase/send_email_verification_usecase.dart';
import 'package:cardiac_petct/src/errors/failure.dart';
import 'package:dartz/dartz.dart';

class SendEmailVerificationUsecaseImp implements SendEmailVerificationUsecase {
  final AuthRepository authRepository;
  SendEmailVerificationUsecaseImp(this.authRepository);

  @override
  Future<Either<Failure, void>> call() async {
    return await authRepository.sendEmailVerification();
  }
}
