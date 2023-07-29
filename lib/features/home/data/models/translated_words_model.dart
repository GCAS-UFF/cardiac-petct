import 'dart:convert';

import 'package:cardiac_petct/features/home/domain/entities/translated_word.dart';

class TranslatedWordModel extends TranslatedWord {
  TranslatedWordModel({
    required super.id,
    required super.en,
    required super.pt,
    required super.it,
  });
  @override
  TranslatedWordModel copyWith({
    String? id,
    String? en,
    String? pt,
    String? it,
  }) {
    return TranslatedWordModel(
      id: id ?? this.id,
      en: en ?? this.en,
      pt: pt ?? this.pt,
      it: it ?? this.it,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'en': en,
      'pt': pt,
      'it': it,
    };
  }

  factory TranslatedWordModel.fromMap(Map<String, dynamic> map) {
    return TranslatedWordModel(
      id: map['id'] ?? '',
      en: map['en'] ?? '',
      pt: map['pt'] ?? '',
      it: map['it'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TranslatedWordModel.fromJson(String source) =>
      TranslatedWordModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TranslatedWordModel(id: $id, en: $en, pt: $pt, it: $it)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TranslatedWordModel &&
        other.id == id &&
        other.en == en &&
        other.pt == pt &&
        other.it == it;
  }

  @override
  int get hashCode {
    return id.hashCode ^ en.hashCode ^ pt.hashCode ^ it.hashCode;
  }
}
