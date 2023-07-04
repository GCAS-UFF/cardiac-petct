import 'package:cardiac_petct/app_controller.dart';
import 'package:cardiac_petct/features/anamnesis/anamnesis_cubit.dart';
import 'package:cardiac_petct/features/anamnesis/anamnesis_module.dart';
import 'package:cardiac_petct/features/anamnesis/data/datasources/anamnesis_local_datasource.dart';
import 'package:cardiac_petct/features/anamnesis/presentation/pages/anamnesis_done_page.dart';
import 'package:cardiac_petct/features/anamnesis/presentation/pages/anamnesis_form_page.dart';
import 'package:cardiac_petct/features/auth/auth_module.dart';
import 'package:cardiac_petct/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:cardiac_petct/features/auth/submodules/email_verify/email_verify_module.dart';
import 'package:cardiac_petct/features/exam_settings/data/datasources/exam_settings_datasource.dart';
import 'package:cardiac_petct/features/exam_settings/exam_settings_module.dart';
import 'package:cardiac_petct/features/exam_settings/pages/meals_time_page.dart';
import 'package:cardiac_petct/features/home/data/datasources/food_classification_remote_datasource_imp.dart';
import 'package:cardiac_petct/features/home/data/datasources/food_datasource_imp.dart';
import 'package:cardiac_petct/features/home/data/datasources/home_datasource.dart';
import 'package:cardiac_petct/features/home/data/datasources/home_local_datasource.dart';
import 'package:cardiac_petct/features/home/data/datasources/meal_datasource_imp.dart';
import 'package:cardiac_petct/features/home/data/datasources/meal_item_datasource_imp.dart';
import 'package:cardiac_petct/features/home/data/datasources/meal_type_datasource_imp.dart';
import 'package:cardiac_petct/features/home/data/datasources/translated_word_datasource.dart';
import 'package:cardiac_petct/features/home/data/repositories/home_repository_imp.dart';
import 'package:cardiac_petct/features/home/domain/usecases/get_meal_types.dart';
import 'package:cardiac_petct/features/home/domain/usecases/get_menu_list.dart';
import 'package:cardiac_petct/features/home/home_module.dart';
import 'package:cardiac_petct/src/modules/app_config/data/app_config_local_datasource/app_config_local_datasource.dart';
import 'package:cardiac_petct/src/modules/app_config/data/repositories/app_config_local_datasource.dart';
import 'package:cardiac_petct/src/platform/network_info.dart';
import 'package:cardiac_petct/src/services/firebase_autorizator_service.dart';
import 'package:cardiac_petct/start_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => HomeDatasourceImp(i(), i(), i(), i())),
        Bind.lazySingleton((i) => GetMealTypesImp(i())),
        Bind.lazySingleton((i) => GetMenuUsecaseImp(i())),
        Bind.lazySingleton((i) => HomeRepositoryImp(i())),
        Bind.lazySingleton((i) => TranslatedWordDatasourceImp()),
        Bind.lazySingleton((i) => FoodClassificationRemoteDatasourceImp(i())),
        Bind.lazySingleton((i) => FoodsDatasourceImp(i(), i())),
        Bind.lazySingleton((i) => MealItemDatasourceImp(i(), i())),
        Bind.lazySingleton((i) => MealDatasourceImp(i(), i())),
        Bind.lazySingleton((i) => MealTypeDatasourceImp(i(), i())),
        Bind.lazySingleton((i) => HomeLocalDatasourceImp()),
        Bind.lazySingleton((i) => AppConfigLocalDataSourceImp()),
        Bind.lazySingleton(
          (i) => FirebaseNavigationService(i(), i(), i()),
        ),
        Bind.lazySingleton((i) => NetworkInfoImp(InternetConnectionChecker())),
        Bind.lazySingleton((i) => AnamnesisCubit(i())),
        Bind.lazySingleton((i) => AppConfigLocalRepositoryImp(i())),
        Bind.lazySingleton((i) => AppController(i())),
        Bind.lazySingleton((i) => AuthLocalDatasourceImp()),
        Bind.lazySingleton((i) => AnamnesisLocalDatasourceImp()),
        Bind.lazySingleton((i) => ExamSettingsDatasourceImp()),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const StartPage()),
        ChildRoute('/anamnesis-form',
            child: (context, args) => const AnamnesisFormPage()),
        ChildRoute('/anamnesis-done',
            child: (context, args) => const AnamnesisDonePage()),
        ChildRoute('/meals-time',
            child: (context, args) => const MealsTimePage()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/email-verify', module: EmailVerifyModule()),
        ModuleRoute('/anamnesis', module: AnamnesisModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/exam-settings', module: ExamSettingsModule()),
      ];
}
