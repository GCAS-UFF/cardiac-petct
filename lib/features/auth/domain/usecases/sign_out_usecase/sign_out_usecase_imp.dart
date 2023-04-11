import 'package:cardiac_petct/features/auth/domain/repositories/sign_out_repository.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/sign_out_usecase/sign_out_usecase.dart';

class SignOutUsecaseImp implements SignOutUsecase {
  final SignOutRepository signOutRepository;
  SignOutUsecaseImp(this.signOutRepository);
  @override
  Future<void> call() async {
    return await signOutRepository();
  }
}
