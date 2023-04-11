import 'package:cardiac_petct/features/auth/submodules/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, artgs) => const LoginPage(),
        ),
      ];
}
