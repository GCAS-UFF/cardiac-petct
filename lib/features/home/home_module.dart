import 'package:cardiac_petct/features/home/domain/usecases/get_menu_list.dart';
import 'package:cardiac_petct/features/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => GetMenuUsecaseImp(i())),
      ];
  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const HomePage())];
}
