enum MeasurementUnity { unity, grams, mililiters, freely, spoon }

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

  static String abbreviatedNameFromEnum(MeasurementUnity unity) {
    switch (unity) {
      case MeasurementUnity.unity:
        return 'Unid.';
      case MeasurementUnity.grams:
        return 'g';
      case MeasurementUnity.freely:
        return 'Livre';
      case MeasurementUnity.spoon:
        return 'Colh.';
      case MeasurementUnity.mililiters:
        return 'ml';
      default:
        return 'Unid.';
    }
  }
}

class Measurement {
  final double portion;
  final MeasurementUnity measurementUnity;

  Measurement({
    required this.portion,
    required this.measurementUnity,
  });

  Measurement copyWith({
    double? portion,
    MeasurementUnity? measurementUnity,
  }) {
    return Measurement(
      portion: portion ?? this.portion,
      measurementUnity: measurementUnity ?? this.measurementUnity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'portion': portion,
      'measurementUnit': MeasurementExtension.stringFromType(measurementUnity),
    };
  }
}
