import 'package:cardiac_petct/features/home/home_cubit.dart';
import 'package:cardiac_petct/features/home/home_page.dart';
import 'package:cardiac_petct/features/home/submodules/meal_options/meal_options_module.dart';
import 'package:cardiac_petct/features/home/submodules/meal_registration/meal_registration_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => HomeCubit(i(), i())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ModuleRoute('/meal-registration', module: MealRegistrationModule()),
        ModuleRoute('/meal-options', module: MealOptionsModule()),
      ];
}
