import 'package:cardiac_petct/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:cardiac_petct/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:cardiac_petct/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/confirm_email_verified_usecase/confirm_email_verified_imp.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/send_email_verification_usecase/send_email_verification_usecase_imp.dart';
import 'package:cardiac_petct/features/auth/submodules/email_verify/email_verify_cubit.dart';
import 'package:cardiac_petct/features/auth/submodules/email_verify/email_verify_page.dart';
import 'package:cardiac_petct/src/platform/network_info.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class EmailVerifyModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => InternetConnectionChecker()),
        Bind.lazySingleton((i) => AuthLocalDatasourceImp()),
        Bind.lazySingleton((i) => AuthRemoteDatasourceImp()),
        Bind.lazySingleton((i) => EmailVerifyCubit(i(), i())),
        Bind.lazySingleton((i) => ConfirmEmailVerifiedUsecaseImp(i())),
        Bind.lazySingleton((i) => SendEmailVerificationUsecaseImp(i())),
        Bind.lazySingleton((i) => AuthRepositoryImp(i(), i())),
        Bind.lazySingleton((i) => NetworkInfoImp(i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const EmailVerifyPage()),
      ];
}
