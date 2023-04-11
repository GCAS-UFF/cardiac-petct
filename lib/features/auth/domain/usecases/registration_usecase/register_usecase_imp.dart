import 'package:cardiac_petct/features/auth/domain/repositories/registration_repository.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/registration_usecase/register_usecase.dart';

class RegistrationUsecaseImp implements RegistrationUsecase {
  final RegistrationRepository registrationRepository;
  RegistrationUsecaseImp(this.registrationRepository);

  @override
  Future<void> call() async {
    return await registrationRepository();
  }
}
