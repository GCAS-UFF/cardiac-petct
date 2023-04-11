import 'package:cardiac_petct/features/auth/submodules/email_verify/email_verify_module.dart';
import 'package:cardiac_petct/features/auth/submodules/registration/registration_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegistrationModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const RegistrationPage(),
        ),
        ModuleRoute(
          '/email-verify',
          module: EmailVerifyModule(),
        )
      ];
}
