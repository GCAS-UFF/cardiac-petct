import 'dart:convert';

import 'package:cardiac_petct/features/home/data/models/menu_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeLocalDatasource {
  Future<void> cacheMenu(MenuModel menu);
  Future<MenuModel?> getCachedMenu();
}

class HomeLocalDatasourceImp implements HomeLocalDatasource {
  late final Future<SharedPreferences> _preferences =
      SharedPreferences.getInstance();
  HomeLocalDatasourceImp();
  @override
  Future<void> cacheMenu(MenuModel menu) async {
    final SharedPreferences prefs = await _preferences;
    final menuJson = menu.toJson();
    await prefs.setString('menu', menuJson);
  }

  @override
  Future<MenuModel?> getCachedMenu() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String menuJson = prefs.getString('menu') ?? '';
    if (menuJson.isEmpty) {
      return null;
    }
    return MenuModel.fromMap(jsonDecode(menuJson));
  }
}
