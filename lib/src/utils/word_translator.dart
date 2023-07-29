import 'package:cardiac_petct/features/home/domain/entities/translated_word.dart';
import 'package:cardiac_petct/src/utils/string_formatter.dart';
import 'dart:ui' as ui;

class WordTranslator {
  static String wordByDeviceLocale(TranslatedWord translatedWord) {
    // ignore: deprecated_member_use
    final languageCode = ui.window.locale.languageCode;
    switch (languageCode) {
      case 'pt':
        return StringFormatter.capitlize(translatedWord.pt);
      case 'en':
        return StringFormatter.capitlize(translatedWord.en);
      case 'it':
        return StringFormatter.capitlize(translatedWord.it);
      default:
        return StringFormatter.capitlize(translatedWord.en);
    }
  }
}
