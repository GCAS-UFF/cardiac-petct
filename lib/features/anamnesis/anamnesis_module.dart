import 'package:cardiac_petct/features/anamnesis/data/datasources/anamnesis_local_datasource.dart';
import 'package:cardiac_petct/features/anamnesis/data/repositories/anamnesis_repository_imp.dart';
import 'package:cardiac_petct/features/anamnesis/domain/usecases/send_anamnesis_answers_usecase_imp.dart';
import 'package:cardiac_petct/features/anamnesis/presentation/pages/anamnesis_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnamnesisModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => AnamnesisLocalDatasourceImp()),
        Bind.lazySingleton((i) => SendAnamnesisAnswersUsecaseImp(i())),
        Bind.lazySingleton((i) => AnamnesisRepositoryImp(i(), i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const AnamnesisPage()),
      ];
}
