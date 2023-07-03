import 'package:cardiac_petct/features/exam_settings/data/datasources/exam_settings_datasource.dart';
import 'package:cardiac_petct/features/exam_settings/data/repositories/exam_settings_repository_imp.dart';
import 'package:cardiac_petct/features/exam_settings/domain/usecases/set_exam_settings.dart';
import 'package:cardiac_petct/features/exam_settings/pages/exam_settings_page.dart';
import 'package:cardiac_petct/features/exam_settings/exam_settings_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExamSettingsModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => ExamSettingsCubit(i())),
        Bind.lazySingleton((i) => SetExamSettingsUsecaseImp(i())),
        Bind.lazySingleton((i) => ExamSettingsRepositoryImp(i())),
        Bind.lazySingleton((i) => ExamSettingsDatasourceImp()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ExamSettingsPage()),
      ];
}
