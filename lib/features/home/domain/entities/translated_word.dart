class TranslatedWord {
  final String? id;
  final String en;
  final String pt;
  final String it;

  TranslatedWord(
      {this.id, required this.en, required this.pt, required this.it});

  TranslatedWord copyWith({
    String? id,
    String? en,
    String? pt,
    String? it,
  }) {
    return TranslatedWord(
      id: id ?? this.id,
      en: en ?? this.en,
      pt: pt ?? this.pt,
      it: it ?? this.it,
    );
  }
}
