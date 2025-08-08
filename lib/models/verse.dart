class Verse {
  final String id;
  final String? urdu;
  final String? transliteration;
  final String? translation;
  final String? explanation;

  Verse({
    required this.id,
    this.urdu,
    this.transliteration,
    this.translation,
    this.explanation,
  });

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      id: json['id'] as String,
      urdu: json['urdu'] as String?,
      transliteration: json['transliteration'] as String?,
      translation: json['translation'] as String?,
      explanation: json['explanation'] as String?,
    );
  }
}
