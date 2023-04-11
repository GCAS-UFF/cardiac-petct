part of './themes_schemes.dart';

const errorcolor = Color(0xFFC73E33);
const successgreen = Color(0xFF2ED320);
const primarygreen = Color(0xFF06BEA6);
const textcolor = Color(0xFF2E2E2E);
const whiteText = Color(0xFFFAFAFA);

CustomColors lightCustomColors = const CustomColors(
  sourceErrorcolor: Color(0xFFC73E33),
  errorcolor: Color(0xFFB02D25),
  onErrorcolor: Color(0xFFFFFFFF),
  errorcolorContainer: Color(0xFFFFDAD5),
  onErrorcolorContainer: Color(0xFF410001),
  sourceSuccessgreen: Color(0xFF2ED320),
  successgreen: Color(0xFF036E00),
  onSuccessgreen: Color(0xFFFFFFFF),
  successgreenContainer: Color(0xFF77FF60),
  onSuccessgreenContainer: Color(0xFF002200),
  sourcePrimarygreen: Color(0xFF06BEA6),
  primarygreen: Color(0xFF006B5D),
  onPrimarygreen: Color(0xFFFFFFFF),
  primarygreenContainer: Color(0xFF69F9DF),
  onPrimarygreenContainer: Color(0xFF00201B),
  sourceTextcolor: Color(0xFF2E2E2E),
  textcolor: Color(0xFF006874),
  onTextcolor: Color(0xFFFFFFFF),
  textcolorContainer: Color(0xFF97F0FF),
  onTextcolorContainer: Color(0xFF001F24),
  sourceWhitebackground: Color(0xFFFAFAFA),
  whitebackground: Color(0xFF006874),
  onWhitebackground: Color(0xFFFFFFFF),
  whitebackgroundContainer: Color(0xFF97F0FF),
  onWhitebackgroundContainer: Color(0xFF001F24),
);

CustomColors darkCustomColors = const CustomColors(
  sourceErrorcolor: Color(0xFFC73E33),
  errorcolor: Color(0xFFFFB4AA),
  onErrorcolor: Color(0xFF690003),
  errorcolorContainer: Color(0xFF8E1310),
  onErrorcolorContainer: Color(0xFFFFDAD5),
  sourceSuccessgreen: Color(0xFF2ED320),
  successgreen: Color(0xFF44E433),
  onSuccessgreen: Color(0xFF013A00),
  successgreenContainer: Color(0xFF025300),
  onSuccessgreenContainer: Color(0xFF77FF60),
  sourcePrimarygreen: Color(0xFF06BEA6),
  primarygreen: Color(0xFF46DCC3),
  onPrimarygreen: Color(0xFF00382F),
  primarygreenContainer: Color(0xFF005045),
  onPrimarygreenContainer: Color(0xFF69F9DF),
  sourceTextcolor: Color(0xFF2E2E2E),
  textcolor: Color(0xFF4FD8EB),
  onTextcolor: Color(0xFF00363D),
  textcolorContainer: Color(0xFF004F58),
  onTextcolorContainer: Color(0xFF97F0FF),
  sourceWhitebackground: Color(0xFFFAFAFA),
  whitebackground: Color(0xFF4FD8EB),
  onWhitebackground: Color(0xFF00363D),
  whitebackgroundContainer: Color(0xFF004F58),
  onWhitebackgroundContainer: Color(0xFF97F0FF),
);

/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceErrorcolor,
    required this.errorcolor,
    required this.onErrorcolor,
    required this.errorcolorContainer,
    required this.onErrorcolorContainer,
    required this.sourceSuccessgreen,
    required this.successgreen,
    required this.onSuccessgreen,
    required this.successgreenContainer,
    required this.onSuccessgreenContainer,
    required this.sourcePrimarygreen,
    required this.primarygreen,
    required this.onPrimarygreen,
    required this.primarygreenContainer,
    required this.onPrimarygreenContainer,
    required this.sourceTextcolor,
    required this.textcolor,
    required this.onTextcolor,
    required this.textcolorContainer,
    required this.onTextcolorContainer,
    required this.sourceWhitebackground,
    required this.whitebackground,
    required this.onWhitebackground,
    required this.whitebackgroundContainer,
    required this.onWhitebackgroundContainer,
  });

  final Color? sourceErrorcolor;
  final Color? errorcolor;
  final Color? onErrorcolor;
  final Color? errorcolorContainer;
  final Color? onErrorcolorContainer;
  final Color? sourceSuccessgreen;
  final Color? successgreen;
  final Color? onSuccessgreen;
  final Color? successgreenContainer;
  final Color? onSuccessgreenContainer;
  final Color? sourcePrimarygreen;
  final Color? primarygreen;
  final Color? onPrimarygreen;
  final Color? primarygreenContainer;
  final Color? onPrimarygreenContainer;
  final Color? sourceTextcolor;
  final Color? textcolor;
  final Color? onTextcolor;
  final Color? textcolorContainer;
  final Color? onTextcolorContainer;
  final Color? sourceWhitebackground;
  final Color? whitebackground;
  final Color? onWhitebackground;
  final Color? whitebackgroundContainer;
  final Color? onWhitebackgroundContainer;

  @override
  CustomColors copyWith({
    Color? sourceErrorcolor,
    Color? errorcolor,
    Color? onErrorcolor,
    Color? errorcolorContainer,
    Color? onErrorcolorContainer,
    Color? sourceSuccessgreen,
    Color? successgreen,
    Color? onSuccessgreen,
    Color? successgreenContainer,
    Color? onSuccessgreenContainer,
    Color? sourcePrimarygreen,
    Color? primarygreen,
    Color? onPrimarygreen,
    Color? primarygreenContainer,
    Color? onPrimarygreenContainer,
    Color? sourceTextcolor,
    Color? textcolor,
    Color? onTextcolor,
    Color? textcolorContainer,
    Color? onTextcolorContainer,
    Color? sourceWhitebackground,
    Color? whitebackground,
    Color? onWhitebackground,
    Color? whitebackgroundContainer,
    Color? onWhitebackgroundContainer,
  }) {
    return CustomColors(
      sourceErrorcolor: sourceErrorcolor ?? this.sourceErrorcolor,
      errorcolor: errorcolor ?? this.errorcolor,
      onErrorcolor: onErrorcolor ?? this.onErrorcolor,
      errorcolorContainer: errorcolorContainer ?? this.errorcolorContainer,
      onErrorcolorContainer:
          onErrorcolorContainer ?? this.onErrorcolorContainer,
      sourceSuccessgreen: sourceSuccessgreen ?? this.sourceSuccessgreen,
      successgreen: successgreen ?? this.successgreen,
      onSuccessgreen: onSuccessgreen ?? this.onSuccessgreen,
      successgreenContainer:
          successgreenContainer ?? this.successgreenContainer,
      onSuccessgreenContainer:
          onSuccessgreenContainer ?? this.onSuccessgreenContainer,
      sourcePrimarygreen: sourcePrimarygreen ?? this.sourcePrimarygreen,
      primarygreen: primarygreen ?? this.primarygreen,
      onPrimarygreen: onPrimarygreen ?? this.onPrimarygreen,
      primarygreenContainer:
          primarygreenContainer ?? this.primarygreenContainer,
      onPrimarygreenContainer:
          onPrimarygreenContainer ?? this.onPrimarygreenContainer,
      sourceTextcolor: sourceTextcolor ?? this.sourceTextcolor,
      textcolor: textcolor ?? this.textcolor,
      onTextcolor: onTextcolor ?? this.onTextcolor,
      textcolorContainer: textcolorContainer ?? this.textcolorContainer,
      onTextcolorContainer: onTextcolorContainer ?? this.onTextcolorContainer,
      sourceWhitebackground:
          sourceWhitebackground ?? this.sourceWhitebackground,
      whitebackground: whitebackground ?? this.whitebackground,
      onWhitebackground: onWhitebackground ?? this.onWhitebackground,
      whitebackgroundContainer:
          whitebackgroundContainer ?? this.whitebackgroundContainer,
      onWhitebackgroundContainer:
          onWhitebackgroundContainer ?? this.onWhitebackgroundContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceErrorcolor: Color.lerp(sourceErrorcolor, other.sourceErrorcolor, t),
      errorcolor: Color.lerp(errorcolor, other.errorcolor, t),
      onErrorcolor: Color.lerp(onErrorcolor, other.onErrorcolor, t),
      errorcolorContainer:
          Color.lerp(errorcolorContainer, other.errorcolorContainer, t),
      onErrorcolorContainer:
          Color.lerp(onErrorcolorContainer, other.onErrorcolorContainer, t),
      sourceSuccessgreen:
          Color.lerp(sourceSuccessgreen, other.sourceSuccessgreen, t),
      successgreen: Color.lerp(successgreen, other.successgreen, t),
      onSuccessgreen: Color.lerp(onSuccessgreen, other.onSuccessgreen, t),
      successgreenContainer:
          Color.lerp(successgreenContainer, other.successgreenContainer, t),
      onSuccessgreenContainer:
          Color.lerp(onSuccessgreenContainer, other.onSuccessgreenContainer, t),
      sourcePrimarygreen:
          Color.lerp(sourcePrimarygreen, other.sourcePrimarygreen, t),
      primarygreen: Color.lerp(primarygreen, other.primarygreen, t),
      onPrimarygreen: Color.lerp(onPrimarygreen, other.onPrimarygreen, t),
      primarygreenContainer:
          Color.lerp(primarygreenContainer, other.primarygreenContainer, t),
      onPrimarygreenContainer:
          Color.lerp(onPrimarygreenContainer, other.onPrimarygreenContainer, t),
      sourceTextcolor: Color.lerp(sourceTextcolor, other.sourceTextcolor, t),
      textcolor: Color.lerp(textcolor, other.textcolor, t),
      onTextcolor: Color.lerp(onTextcolor, other.onTextcolor, t),
      textcolorContainer:
          Color.lerp(textcolorContainer, other.textcolorContainer, t),
      onTextcolorContainer:
          Color.lerp(onTextcolorContainer, other.onTextcolorContainer, t),
      sourceWhitebackground:
          Color.lerp(sourceWhitebackground, other.sourceWhitebackground, t),
      whitebackground: Color.lerp(whitebackground, other.whitebackground, t),
      onWhitebackground:
          Color.lerp(onWhitebackground, other.onWhitebackground, t),
      whitebackgroundContainer: Color.lerp(
          whitebackgroundContainer, other.whitebackgroundContainer, t),
      onWhitebackgroundContainer: Color.lerp(
          onWhitebackgroundContainer, other.onWhitebackgroundContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith();
  }
}
