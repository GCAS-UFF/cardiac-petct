import 'package:cardiac_petct/features/exam_settings/data/datasources/exam_settings_datasource.dart';
import 'package:cardiac_petct/features/exam_settings/data/repositories/exam_settings_repository_imp.dart';
import 'package:cardiac_petct/features/exam_settings/domain/usecases/get_exam_settings.dart';
import 'package:cardiac_petct/features/home/home_cubit.dart';
import 'package:cardiac_petct/features/home/home_page.dart';
import 'package:cardiac_petct/features/home/submodules/meal_options/meal_options_module.dart';
import 'package:cardiac_petct/features/home/submodules/meal_registration/meal_registration_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => GetExamSettingsUsecaseImp(i())),
        Bind.lazySingleton((i) => ExamSettingsRepositoryImp(i())),
        Bind.lazySingleton((i) => ExamSettingsDatasourceImp()),
        Bind.lazySingleton((i) => HomeCubit(i(), i(), i())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ModuleRoute('/meal-registration', module: MealRegistrationModule()),
        ModuleRoute('/meal-options', module: MealOptionsModule()),
      ];
}
