class Surah {
  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.numberOfAyahs,
    this.ayahs,
  });

  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  final int numberOfAyahs;
  final List<Ayah>? ayahs;

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        revelationType: json["revelationType"],
        numberOfAyahs: json["numberOfAyahs"],
        ayahs: json["ayahs"] == null
            ? []
            : List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
      );
}

class Ayah {
  Ayah({
    required this.number,
    required this.text,
    required this.numberInSurah,
  });

  final int number;
  final String text;
  final int numberInSurah;

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: json["number"],
        text: json["text"],
        numberInSurah: json["numberInSurah"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "text": text,
        "numberInSurah": numberInSurah,
      };
}
