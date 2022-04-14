class AyaModel {
  final int id;
  final int sura;
  final int suraAya;
  final String text;
  final String pureText;
  final int page;
  final double amount;
  final int juz;
  final int x;
  final int y;
  final int xn;
  final int yn;
  final int xw;
  final int yw;
  final String tafseer;
  final String surahName;
  final int hezb;
  final int quarter;

  AyaModel(
      {required this.id,
      required this.sura,
      required this.suraAya,
      required this.text,
      required this.pureText,
      required this.page,
      required this.amount,
      required this.juz,
      required this.x,
      required this.y,
      required this.xn,
      required this.yn,
      required this.xw,
      required this.yw,
      required this.tafseer,
      required this.surahName,
      required this.hezb,
      required this.quarter});
}
