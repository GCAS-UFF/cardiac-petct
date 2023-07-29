import 'package:cardiac_petct/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:cardiac_petct/features/auth/submodules/registration/registration_cubit.dart';
import 'package:cardiac_petct/features/auth/submodules/registration/registration_page.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/registration_usecase/register_usecase_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegistrationModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => AuthRepositoryImp(i(), i())),
        Bind.lazySingleton((i) => RegistrationUsecaseImp(i())),
        Bind.lazySingleton((i) => RegistrationCubit(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const RegistrationPage(),
        ),
      ];
}
