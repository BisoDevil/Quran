class Surah {
  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.numberOfAyahs,
  });

  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  final int numberOfAyahs;

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        number: json["id"],
        name: json["name"],
        englishName: json["tname"],
        englishNameTranslation: json["ename"],
        revelationType: json["type"],
        numberOfAyahs: json["ayas"],
      );
}
