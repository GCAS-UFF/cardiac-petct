import 'package:cardiac_petct/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/login_usecase/login_usecase_imp.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/recover_password_usecase/recover_password_usecase_imp.dart';
import 'package:cardiac_petct/features/auth/submodules/login/login_cubit.dart';
import 'package:cardiac_petct/features/auth/submodules/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => LoginCubit(i(), i())),
        Bind.lazySingleton((i) => LoginUseCaseImp(i())),
        Bind.lazySingleton((i) => RecoverPasswordUsecaseImp(i())),
        Bind.lazySingleton((i) => AuthRepositoryImp(i(), i())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, artgs) => const LoginPage(),
        ),
      ];
}
