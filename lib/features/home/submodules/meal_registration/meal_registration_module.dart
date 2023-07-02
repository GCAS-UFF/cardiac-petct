import 'package:cardiac_petct/features/home/submodules/meal_registration/data/datasources/meal_local_datasource.dart';
import 'package:cardiac_petct/features/home/submodules/meal_registration/data/repositories/meal_repository_imp.dart';
import 'package:cardiac_petct/features/home/submodules/meal_registration/domain/usecases/registrate_meal.dart';
import 'package:cardiac_petct/features/home/submodules/meal_registration/meal_registration_cubit.dart';
import 'package:cardiac_petct/features/home/submodules/meal_registration/meal_registration_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MealRegistrationModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => MealRegistrationCubit(i())),
        Bind.lazySingleton((i) => RegistrateMealUsecaseImp(i())),
        Bind.lazySingleton((i) => MealRepositoryImp(i())),
        Bind.lazySingleton((i) => MealLocalDatasourceImp())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => MealRegistrationPage(
            meal: args.data[0],
            menuId: args.data[1],
          ),
        )
      ];
}
