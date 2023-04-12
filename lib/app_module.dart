import 'package:cardiac_petct/app_widget.dart';
import 'package:cardiac_petct/features/auth/auth_module.dart';
import 'package:cardiac_petct/features/auth/submodules/email_verify/email_verify_module.dart';
import 'package:cardiac_petct/src/platform/network_info.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'features/auth/data/datasources/auth_remote_datasource.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => AuthRemoteDatasourceImp()),
        Bind.singleton((i) => NetworkInfoImp(InternetConnectionChecker()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const AppWidget()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/email-verify', module: EmailVerifyModule()),
      ];
}
