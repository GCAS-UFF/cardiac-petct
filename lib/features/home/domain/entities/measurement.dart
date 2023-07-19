enum MeasurementUnity {
  unity,
  bigUnity,
  grams,
  mililiters,
  freely,
  spoon,
  teaSpoon,
  soupSpoon,
  fullSoupSpoon
}

extension MeasurementExtension on MeasurementUnity {
  static List<MeasurementUnity> measurementUnitiesList() {
    return [
      MeasurementUnity.unity,
      MeasurementUnity.bigUnity,
      MeasurementUnity.spoon,
      MeasurementUnity.teaSpoon,
      MeasurementUnity.soupSpoon,
      MeasurementUnity.fullSoupSpoon,
      MeasurementUnity.mililiters,
      MeasurementUnity.grams,
      MeasurementUnity.freely
    ];
  }

  static MeasurementUnity typeFromString(String value) {
    switch (value) {
      case 'UNITY':
        return MeasurementUnity.unity;
      case 'BIG_UNITY':
        return MeasurementUnity.bigUnity;
      case 'GRAMS':
        return MeasurementUnity.grams;
      case 'FREELY':
        return MeasurementUnity.freely;
      case 'SPOON':
        return MeasurementUnity.spoon;
      case 'TEA_SPOON':
        return MeasurementUnity.teaSpoon;
      case 'SOUP_SPOON':
        return MeasurementUnity.soupSpoon;
      case 'FULL_SOUP_SPOON':
        return MeasurementUnity.fullSoupSpoon;
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
      case MeasurementUnity.bigUnity:
        return 'BIG_UNITY';
      case MeasurementUnity.grams:
        return 'GRAMS';
      case MeasurementUnity.freely:
        return 'FREELY';
      case MeasurementUnity.spoon:
        return 'SPOON';
      case MeasurementUnity.teaSpoon:
        return 'TEA_SPOON';
      case MeasurementUnity.soupSpoon:
        return 'SOUP_SPOON';
      case MeasurementUnity.fullSoupSpoon:
        return 'FULL_SOUP_SPOON';
      case MeasurementUnity.mililiters:
        return 'MILILITERS';
      default:
        return 'UNITY';
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

  static String nameFromEnum(MeasurementUnity unity) {
    switch (unity) {
      case MeasurementUnity.unity:
        return 'Unidades';
      case MeasurementUnity.bigUnity:
        return 'Unidades grandes';
      case MeasurementUnity.grams:
        return 'Gramas';
      case MeasurementUnity.freely:
        return 'Livre';
      case MeasurementUnity.spoon:
        return 'Colheres';
      case MeasurementUnity.teaSpoon:
        return 'Colheres de chá';
      case MeasurementUnity.soupSpoon:
        return 'Colheres de sopa';
      case MeasurementUnity.fullSoupSpoon:
        return 'Colheres de sopa cheia';
      case MeasurementUnity.mililiters:
        return 'ml';
      default:
        return 'Unidades';
    }
  }
}

class Measurement {
  final double? consumedPortion;
  final double portion;
  final MeasurementUnity measurementUnity;

  Measurement(
    this.consumedPortion, {
    required this.portion,
    required this.measurementUnity,
  });

  Measurement copyWith({
    double? consumedPortion,
    double? portion,
    MeasurementUnity? measurementUnity,
  }) {
    return Measurement(
      consumedPortion ?? this.consumedPortion,
      portion: portion ?? this.portion,
      measurementUnity: measurementUnity ?? this.measurementUnity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'consumedPortion': consumedPortion,
      'portion': portion,
      'measurementUnit': MeasurementExtension.stringFromType(measurementUnity),
    };
  }
}
