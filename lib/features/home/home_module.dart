import 'package:cardiac_petct/features/home/data/datasources/food_classification_remote_datasource_imp.dart';
import 'package:cardiac_petct/features/home/data/datasources/food_datasource_imp.dart';
import 'package:cardiac_petct/features/home/data/datasources/home_datasource.dart';
import 'package:cardiac_petct/features/home/data/datasources/meal_datasource_imp.dart';
import 'package:cardiac_petct/features/home/data/datasources/meal_item_datasource_imp.dart';
import 'package:cardiac_petct/features/home/data/datasources/meal_type_datasource_imp.dart';
import 'package:cardiac_petct/features/home/data/datasources/translated_word_datasource.dart';
import 'package:cardiac_petct/features/home/data/repositories/home_repository_imp.dart';
import 'package:cardiac_petct/features/home/domain/usecases/get_menu_list.dart';
import 'package:cardiac_petct/features/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => GetMenuUsecaseImp(i())),
        Bind.lazySingleton((i) => HomeRepositoryImp(i())),
        Bind.lazySingleton((i) => TranslatedWordDatasourceImp()),
        Bind.lazySingleton((i) => FoodClassificationRemoteDatasourceImp(i())),
        Bind.lazySingleton((i) => FoodsDatasourceImp(i(), i())),
        Bind.lazySingleton((i) => MealItemDatasourceImp(i(), i())),
        Bind.lazySingleton((i) => MealDatasourceImp(i(), i())),
        Bind.lazySingleton((i) => MealTypeDatasourceImp(i())),
        Bind.lazySingleton((i) => HomeDatasourceImp(i(), i())),
      ];
  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const HomePage())];
}
