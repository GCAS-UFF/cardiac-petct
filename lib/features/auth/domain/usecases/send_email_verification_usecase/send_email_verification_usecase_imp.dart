import 'package:cardiac_petct/features/auth/domain/repositories/send_email_verification_repository.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/send_email_verification_usecase/send_email_verification_usecase.dart';

class SendEmailVerificationUsecaseImp implements SendEmailVerificationUsecase {
  final SendEmailVerificationRepository sendEmailVerificationRepository;
  SendEmailVerificationUsecaseImp(this.sendEmailVerificationRepository);

  @override
  Future<void> call() async {
    return await sendEmailVerificationRepository();
  }
}
