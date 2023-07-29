import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cardiac_petct/features/home/data/models/menu_model.dart';
import 'package:cardiac_petct/features/home/data/models/meal_type_model.dart';


abstract class HomeLocalDatasource {
  Future<void> cacheMenu(MenuModel menu);
  Future<MenuModel?> getCachedMenu();
  Future<void> cacheMealTypes(List<MealTypeModel> mealTypes);
  Future<List<MealTypeModel>?> getCachedMealTypes();
  Future<void> cacheDietList(MenuModel menu);
  Future<List<MenuModel>?> getCachedDietDays();
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

  @override
  Future<void> cacheMealTypes(List<MealTypeModel> mealTypes) async {
    final SharedPreferences prefs = await _preferences;
    final typeList = mealTypes.map((type) => type.toMap()).toList();
    await prefs.setString('mealTypes', jsonEncode(typeList));
  }

  @override
  Future<List<MealTypeModel>?> getCachedMealTypes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String typesList = prefs.getString('mealTypes') ?? '';
    if (typesList.isEmpty) {
      return null;
    }
    final map = jsonDecode(typesList);
    List<MealTypeModel> mealTypeList = [];
    map.map((e) => mealTypeList.add(MealTypeModel.fromMap(e))).toList();
    return mealTypeList;
  }

  @override
  Future<void> cacheDietList(MenuModel menu) async {
    final SharedPreferences prefs = await _preferences;
    List<MenuModel> daysDiet = [];
    for (int i = 0; i < menu.durationInDays; i++) {
      daysDiet.add(
        menu.copyWith(
          id: i.toString(),
          breakFasts: [menu.breakFasts!.first],
        ),
      );
    }
    await prefs.setString('dietDays', jsonEncode(daysDiet));
  }

  @override
  Future<List<MenuModel>?> getCachedDietDays() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String dietDays = prefs.getString('dietDays') ?? '';
    if (dietDays.isEmpty) {
      return null;
    }
    final map = jsonDecode(dietDays);
    List<MenuModel> dietDaysList = [];
    map.map((e) => dietDaysList.add(MenuModel.fromJson(e))).toList();
    return dietDaysList;
  }
}
