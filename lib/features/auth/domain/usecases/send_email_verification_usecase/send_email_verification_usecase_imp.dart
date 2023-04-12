import 'package:cardiac_petct/features/auth/domain/repositories/auth_repository.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/send_email_verification_usecase/send_email_verification_usecase.dart';

class SendEmailVerificationUsecaseImp implements SendEmailVerificationUsecase {
  final AuthRepository authRepository;
  SendEmailVerificationUsecaseImp(this.authRepository);

  @override
  Future<void> call() async {
    return await authRepository.sendEmailVerification();
  }
}
