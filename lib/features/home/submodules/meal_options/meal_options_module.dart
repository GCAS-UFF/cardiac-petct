import 'package:cardiac_petct/features/home/submodules/meal_options/domain/get_meal_options.dart';
import 'package:cardiac_petct/features/home/submodules/meal_options/domain/set_meal_option.dart';
import 'package:cardiac_petct/features/home/submodules/meal_options/meal_options_cubit.dart';
import 'package:cardiac_petct/features/home/submodules/meal_options/meal_options_page.dart';
import 'package:cardiac_petct/features/home/submodules/meal_registration/data/datasources/meal_local_datasource.dart';
import 'package:cardiac_petct/features/home/submodules/meal_registration/data/repositories/meal_repository_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MealOptionsModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => SetMealOptionUsecaseImp(i())),
        Bind.lazySingleton((i) => GetMealOptionsUsecaseImp(i())),
        Bind.lazySingleton((i) => MealOptionsCubit(i(),i())),
        Bind.lazySingleton((i) => MealRepositoryImp(i(), i())),
        Bind.lazySingleton((i) => MealLocalDatasourceImp())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => MealOptionsPage(
            meal: args.data[0],
            menuId: args.data[1],
          ),
        ),
      ];
}
