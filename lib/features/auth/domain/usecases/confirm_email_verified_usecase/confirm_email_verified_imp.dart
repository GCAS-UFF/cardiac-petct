import 'package:cardiac_petct/features/auth/domain/repositories/confirm_email_verified_repository.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/confirm_email_verified_usecase/confirm_email_verified_usecase.dart';

class ConfirmEmailVerifiedUsecaseImp implements ConfirmEmailVerifiedUsecase {
  final ConfirmEmailVerifiedRepository confirmEmailVerifiedRepository;
  ConfirmEmailVerifiedUsecaseImp(this.confirmEmailVerifiedRepository);
  @override
  Future<void> call() async {
    return await confirmEmailVerifiedRepository();
  }
}
