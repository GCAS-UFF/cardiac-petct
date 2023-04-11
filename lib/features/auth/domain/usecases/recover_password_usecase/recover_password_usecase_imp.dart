import 'package:cardiac_petct/features/auth/domain/repositories/recover_password_repository.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/recover_password_usecase/recover_password_usecase.dart';

class RecoverPasswordUsecaseImp implements RecoverPasswordUsecase {
  final RecoverPasswordRepository recoverPasswordRepository;
  RecoverPasswordUsecaseImp(this.recoverPasswordRepository);

  @override
  Future<void> call() async {
    return await recoverPasswordRepository();
  }
}
