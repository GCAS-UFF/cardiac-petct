import 'package:cardiac_petct/features/auth/domain/repositories/auth_repository.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/sign_out_usecase/sign_out_usecase.dart';

class SignOutUsecaseImp implements SignOutUsecase {
  final AuthRepository authRepository;
  SignOutUsecaseImp(this.authRepository);
  @override
  Future<void> call() async {
    return await authRepository.signout();
  }
}
