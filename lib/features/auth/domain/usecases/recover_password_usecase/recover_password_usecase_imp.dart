import 'package:cardiac_petct/features/auth/domain/repositories/auth_repository.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/recover_password_usecase/recover_password_usecase.dart';

class RecoverPasswordUsecaseImp implements RecoverPasswordUsecase {
  final AuthRepository authRepository;
  RecoverPasswordUsecaseImp(this.authRepository);

  @override
  Future<void> call() async {
    return await authRepository.recoverPassword();
  }
}
