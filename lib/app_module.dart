import 'package:cardiac_petct/features/anamnesis/anamnesis_cubit.dart';
import 'package:cardiac_petct/features/anamnesis/anamnesis_module.dart';
import 'package:cardiac_petct/features/anamnesis/presentation/pages/anamnesis_done_page.dart';
import 'package:cardiac_petct/features/anamnesis/presentation/pages/anamnesis_form_page.dart';
import 'package:cardiac_petct/features/auth/auth_module.dart';
import 'package:cardiac_petct/features/auth/submodules/email_verify/email_verify_module.dart';
import 'package:cardiac_petct/features/home/home_module.dart';
import 'package:cardiac_petct/src/platform/network_info.dart';
import 'package:cardiac_petct/src/services/firebase_autorizator_service.dart';
import 'package:cardiac_petct/start_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => FirebaseNavigationService()),
        Bind.lazySingleton((i) => NetworkInfoImp(InternetConnectionChecker())),
        Bind.lazySingleton((i) => AnamnesisCubit(i())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const StartPage()),
        ChildRoute('/anamnesis-form',
            child: (context, args) => const AnamnesisFormPage()),
        ChildRoute('/anamnesis-done',
            child: (context, args) => const AnamnesisDonePage()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/email-verify', module: EmailVerifyModule()),
        ModuleRoute('/anamnesis', module: AnamnesisModule()),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
