enum MeasurementUnity {
  smallUnity,
  unity,
  mediumUnity,
  bigUnity,
  grams,
  mililiters,
  freely,
  spoon,
  teaSpoon,
  soupSpoon,
  fullSoupSpoon,
  thinSlice,
  cup,
  littleBranch,
}

extension MeasurementExtension on MeasurementUnity {
  static List<MeasurementUnity> measurementUnitiesList() {
    return [
      MeasurementUnity.smallUnity,
      MeasurementUnity.unity,
      MeasurementUnity.mediumUnity,
      MeasurementUnity.bigUnity,
      MeasurementUnity.spoon,
      MeasurementUnity.fullSoupSpoon,
      MeasurementUnity.soupSpoon,
      MeasurementUnity.teaSpoon,
      MeasurementUnity.mililiters,
      MeasurementUnity.grams,
      MeasurementUnity.freely,
      MeasurementUnity.thinSlice,
      MeasurementUnity.cup,
    ];
  }

  static MeasurementUnity typeFromString(String value) {
    switch (value) {
      case 'SMALL_UNITY':
        return MeasurementUnity.smallUnity;
      case 'UNITY':
        return MeasurementUnity.unity;
      case 'MEDIUM_UNITY':
        return MeasurementUnity.mediumUnity;
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
      case 'THIN_SLICE':
        return MeasurementUnity.thinSlice;
      case 'CUP':
        return MeasurementUnity.cup;
      case 'LITTLE_BRANCH':
        return MeasurementUnity.littleBranch;
      default:
        return MeasurementUnity.unity;
    }
  }

  static String stringFromType(MeasurementUnity unity) {
    switch (unity) {
      case MeasurementUnity.smallUnity:
        return 'SMALL_UNITY';
      case MeasurementUnity.unity:
        return 'UNITY';
      case MeasurementUnity.bigUnity:
        return 'MEDIUM_UNITY';
      case MeasurementUnity.mediumUnity:
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
      case MeasurementUnity.thinSlice:
        return 'THIN_SLICE';
      case MeasurementUnity.cup:
        return 'CUP';
      case MeasurementUnity.littleBranch:
        return 'LITTLE_BRANCH';
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
      case MeasurementUnity.smallUnity:
        return 'Unidades pequenas';
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
      case MeasurementUnity.thinSlice:
        return 'Fatia fina';
      case MeasurementUnity.cup:
        return 'Xícaras';
      case MeasurementUnity.littleBranch:
        return 'Ramo pequeno';
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
