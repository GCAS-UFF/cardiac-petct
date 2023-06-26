import 'package:cardiac_petct/features/home/data/models/meal_type_model.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal_type.dart';
import 'package:cardiac_petct/features/home/domain/entities/menu.dart';
import 'package:cardiac_petct/features/home/domain/usecases/get_meal_types.dart';
import 'package:cardiac_petct/features/home/domain/usecases/get_menu_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetMenuListUsecase getMenuListUsecase;
  final GetMealTypes getMealTypes;
  HomeCubit(this.getMenuListUsecase, this.getMealTypes)
      : super(HomeLoadingState());

  void initialize() async {
    List<MealType> mealTypes = [];
    final response = await getMenuListUsecase.getMenu();
    final mealTypesResponse = await getMealTypes();
    mealTypesResponse.fold((l) => emit(HomeErrorState()),
        (mealTypesList) => mealTypes = mealTypesList);
    mealTypes.sort(MealTypeExtension.customCompare);
    response.fold(
      (l) => emit(HomeErrorState()),
      (menuResponse) => emit(
        HomeSuccessState(
          menuResponse,
          mealTypes,
        ),
      ),
    );
  }
}

abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<Menu> menu;
  final List<MealType> mealTypes;
  HomeSuccessState(this.menu, this.mealTypes);
}

class HomeErrorState extends HomeState {}
