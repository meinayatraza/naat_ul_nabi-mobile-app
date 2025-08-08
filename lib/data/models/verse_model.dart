class Verse {
  final int id;
  final String text;
  final String explanation;

  Verse({
    required this.id,
    required this.text,
    required this.explanation,
  });

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      id: json['id'],
      text: json['text'],
      explanation: json['explanation'],
    );
  }
}
