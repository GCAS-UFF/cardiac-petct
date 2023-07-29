import 'dart:convert';

import 'package:cardiac_petct/features/home/data/models/meal_item_model.dart';
import 'package:cardiac_petct/features/home/data/models/meal_type_model.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal_item.dart';
import 'package:cardiac_petct/features/home/domain/entities/meal_type.dart';
import 'package:flutter/foundation.dart';

extension CurrencyExtension on CurrencyEnum {
  static List<CurrencyEnum> getList() {
    return [CurrencyEnum.real, CurrencyEnum.dolar, CurrencyEnum.euro];
  }

  static CurrencyEnum typeFromString(String value) {
    switch (value) {
      case 'Real':
        return CurrencyEnum.real;
      case 'Dollar':
        return CurrencyEnum.dolar;
      case 'Euro':
        return CurrencyEnum.euro;
      default:
        return CurrencyEnum.dolar;
    }
  }

  static String stringFromType(CurrencyEnum value) {
    switch (value) {
      case CurrencyEnum.real:
        return 'Real';
      case CurrencyEnum.dolar:
        return 'Dollar';
      case CurrencyEnum.euro:
        return 'Euro';
      default:
        return 'Dollar';
    }
  }

  static String codeFromType(CurrencyEnum value) {
    switch (value) {
      case CurrencyEnum.real:
        return 'R\$';
      case CurrencyEnum.dolar:
        return '\$';
      case CurrencyEnum.euro:
        return '€';
      default:
        return '\$';
    }
  }
}

class MealModel extends Meal {
  MealModel(
    super.id,
    super.items,
    super.imageUrl,
    super.type,
    super.comment, {
    required super.currency,
    required super.isRegistered,
    required super.typeId,
    required super.price,
    required super.itemsIds,
  });

  MealModel copyWith({
    String? id,
    List<MealItem>? items,
    String? imageUrl,
    MealType? type,
    String? comment,
    CurrencyEnum? currency,
    bool? isRegistered,
    String? typeId,
    double? price,
    List<String>? itemsIds,
  }) {
    return MealModel(
      id ?? this.id,
      items ?? this.items,
      imageUrl ?? this.imageUrl,
      type ?? this.type,
      comment ?? this.comment,
      currency: currency ?? this.currency,
      isRegistered: isRegistered ?? this.isRegistered,
      typeId: typeId ?? this.typeId,
      price: price ?? this.price,
      itemsIds: itemsIds ?? this.itemsIds,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'itemsList': items!.map((e) => (e as MealItemModel).toMap()).toList(),
      'imageUrl': imageUrl,
      'currency': CurrencyExtension.stringFromType(currency),
      'mealTypeItem': (type as MealTypeModel).toMap(),
      'totalPrice': price,
      'items': itemsIds,
      'comment': comment,
      'isRegistered': isRegistered,
    };
  }

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      map['id'],
      (map['itemsList'] != null)
          ? List<MealItemModel>.from(
              map['itemsList']?.map((x) => MealItemModel.fromMap(x)),
            )
          : [],
      map['imageUrl'],
      (map['mealTypeItem'] != null)
          ? MealTypeModel.fromMap(map['mealTypeItem'])
          : null,
      map['comment'],
      currency: CurrencyExtension.typeFromString(map['currency']),
      isRegistered: map['isRegistered'] ?? false,
      typeId: map['mealType'] ?? '',
      price: double.tryParse(map['totalPrice'].toString()) as double,
      itemsIds: List<String>.from(map['items']?.map((x) => x as String)),
    );
  }

  factory MealModel.fromEntity(Meal meal) {
    return MealModel(
      meal.id,
      meal.items,
      meal.imageUrl,
      meal.type,
      meal.comment,
      currency: meal.currency,
      isRegistered: meal.isRegistered,
      typeId: meal.typeId,
      price: meal.price,
      itemsIds: meal.itemsIds,
    );
  }

  String toJson() => json.encode(toMap());

  factory MealModel.fromJson(String source) =>
      MealModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MealModel(id: $id, items: $items, imageUrl: $imageUrl, currency: $currency, type: $type, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MealModel &&
        other.id == id &&
        listEquals(other.items, items) &&
        other.imageUrl == imageUrl &&
        other.currency == currency &&
        other.type == type &&
        other.price == price &&
        other.comment == comment;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        items.hashCode ^
        imageUrl.hashCode ^
        currency.hashCode ^
        type.hashCode ^
        price.hashCode ^
        comment.hashCode;
  }
}
