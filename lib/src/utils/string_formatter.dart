import 'package:cardiac_petct/features/home/domain/entities/meal_item.dart';
import 'package:cardiac_petct/src/utils/word_translator.dart';
import 'package:localization/localization.dart';

class StringFormatter {
  static String capitlize(String? value) {
    if (value != null) {
      return value[0].toUpperCase() + value.substring(1).toLowerCase();
    }
    return '';
  }

  static String listMealItemsNames(List<MealItem> items) {
    String itemsNames = '';
    items.map((item) {
      if (item.translatedWord != null) {
        itemsNames = itemsNames +
            WordTranslator.wordByDeviceLocale(item.translatedWord!);
        if (item != items.last) {
          itemsNames = '$itemsNames + ';
        }
      } else {
        if (item.foodsItens?.first != null) {
          itemsNames = itemsNames +
              WordTranslator.wordByDeviceLocale(
                  item.foodsItens!.first.translatedWord!);
          if (item != items.last) {
            itemsNames = '$itemsNames + ';
          }
        }
      }
    }).toList();
    return itemsNames;
  }

  static String removeDecimalZeroFormat(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }

  static String intToOrdinal(int value) {
    switch (value) {
      case 1:
        return 'first-day-tab'.i18n();
      case 2:
        return 'second-day-tab'.i18n();
      case 3:
        return 'third-day-tab'.i18n();
      case 4:
        return 'fourth-day-tab'.i18n();
      case 5:
        return 'fifth-day-tab'.i18n();
      default:
        return '';
    }
  }
}
