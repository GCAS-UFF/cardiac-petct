import 'package:cardiac_petct/features/auth/domain/repositories/auth_repository.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/login_usecase/login_usecase.dart';

class LoginUseCaseImp implements LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCaseImp(this.authRepository);
  @override
  Future<void> call(String email, String password) async {
    return await authRepository.login(email, password);
  }
}
