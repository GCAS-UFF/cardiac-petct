import 'dart:convert';

import 'package:cardiac_petct/features/home/domain/entities/measurement.dart';

extension MeasurementExtension on MeasurementUnity {
  static List<MeasurementUnity> measurementUnitiesList() {
    return [
      MeasurementUnity.unity,
      MeasurementUnity.spoon,
      MeasurementUnity.mililiters,
      MeasurementUnity.grams,
      MeasurementUnity.freely
    ];
  }

  static MeasurementUnity typeFromString(String value) {
    switch (value) {
      case 'UNITY':
        return MeasurementUnity.unity;
      case 'GRAMS':
        return MeasurementUnity.grams;
      case 'FREELY':
        return MeasurementUnity.freely;
      case 'SPOON':
        return MeasurementUnity.spoon;
      case 'MILILITERS':
        return MeasurementUnity.mililiters;
      default:
        return MeasurementUnity.unity;
    }
  }

  static String stringFromType(MeasurementUnity unity) {
    switch (unity) {
      case MeasurementUnity.unity:
        return 'UNITY';
      case MeasurementUnity.grams:
        return 'GRAMS';
      case MeasurementUnity.freely:
        return 'FREELY';
      case MeasurementUnity.spoon:
        return 'SPOON';
      case MeasurementUnity.mililiters:
        return 'MILILITERS';
      default:
        return 'UNITY';
    }
  }

  static String nameFromEnum(MeasurementUnity unity) {
    switch (unity) {
      case MeasurementUnity.unity:
        return 'Unidades';
      case MeasurementUnity.grams:
        return 'Gramas';
      case MeasurementUnity.freely:
        return 'Livre';
      case MeasurementUnity.spoon:
        return 'Colheres';
      case MeasurementUnity.mililiters:
        return 'ml';
      default:
        return 'Unidades';
    }
  }
}

class MeasurementModel extends Measurement {
  MeasurementModel(
    super.consumedPortion, {
    required super.portion,
    required super.measurementUnity,
  });
  @override
  MeasurementModel copyWith({
    double? consumedPortion,
    double? portion,
    MeasurementUnity? measurementUnity,
  }) {
    return MeasurementModel(
      consumedPortion ?? this.consumedPortion,
      portion: portion ?? this.portion,
      measurementUnity: measurementUnity ?? this.measurementUnity,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'consumedPortion': consumedPortion ?? portion,
      'portion': portion,
      'measurementUnit': MeasurementExtension.stringFromType(measurementUnity),
    };
  }

  factory MeasurementModel.fromMap(Map<String, dynamic> map) {
    return MeasurementModel(
      double.tryParse(map['consumedPortion'].toString()) ??
          double.tryParse(map['portion'].toString()) ??
          0.0,
      portion: double.tryParse(map['portion'].toString()) ?? 0.0,
      measurementUnity:
          MeasurementExtension.typeFromString(map['measurementUnit']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MeasurementModel.fromJson(String source) =>
      MeasurementModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'MeasurementModel(consumedPortion: $consumedPortion,portion: $portion, measurementUnity: $measurementUnity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MeasurementModel &&
        other.consumedPortion == consumedPortion &&
        other.portion == portion &&
        other.measurementUnity == measurementUnity;
  }

  @override
  int get hashCode =>
      consumedPortion.hashCode ^ portion.hashCode ^ measurementUnity.hashCode;
}
