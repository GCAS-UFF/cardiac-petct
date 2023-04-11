import 'package:cardiac_petct/features/auth/domain/repositories/login_repository.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/login_usecase/login_usecase.dart';

class LoginUseCaseImp implements LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCaseImp(this.loginRepository);
  @override
  Future<void> call() async {
    return await loginRepository();
  }
}
