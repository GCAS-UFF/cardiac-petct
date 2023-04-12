import 'package:cardiac_petct/features/auth/domain/repositories/auth_repository.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/confirm_email_verified_usecase/confirm_email_verified_usecase.dart';

class ConfirmEmailVerifiedUsecaseImp implements ConfirmEmailVerifiedUsecase {
  final AuthRepository authRepository;
  ConfirmEmailVerifiedUsecaseImp(this.authRepository);
  @override
  Future<void> call() async {
    return await authRepository.confirmEmailVerified();
  }
}
