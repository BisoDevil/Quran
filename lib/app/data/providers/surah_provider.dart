import 'package:get/get.dart';

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

import '../models/aya_model.dart';
import '../models/surah_model.dart';

class SurahProvider extends GetConnect {
  late Database db;
  SurahProvider() {
    _loadDatabase();
  }

  _loadDatabase() async {
    final appPath = (await getApplicationDocumentsDirectory()).path;
    final String path = join(appPath, "mushaf_data");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load(join('assets', "db", "db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
    }

    db = await openDatabase(path);
  }

  Future<List<Surah>> getAllSurah() async {
    final List<Map<String, dynamic>> map =
        await db.rawQuery('SELECT * FROM Sura');

    return List<Surah>.from(map.map((e) => Surah.fromJson(e)).toList());
  }

  Future<int> getPageNumber(
      {required int suraNumber, required int ayaNumber}) async {
    // Get a reference to the database.

    final List<Map<String, dynamic>> maps = await db.rawQuery('''
        SELECT page
        FROM Aya
        WHERE sura = $suraNumber AND sura_aya = $ayaNumber ''');

    return maps[0]['page'];
  }

  Future<List<AyaModel>> pageAyat({required int pageNumber}) async {
    // Get a reference to the database.

    String query = "";

    query =
        'select at.* , st.ayas,st.name from Aya at inner join Sura st on  at.sura = st.id where at.page = $pageNumber ';

    final List<Map<String, dynamic>> maps = await db.rawQuery(query);

    return List.generate(maps.length, (i) {
      return AyaModel(
          id: maps[i]['id'],
          sura: maps[i]['sura'],
          suraAya: maps[i]['sura_aya'],
          pureText: maps[i]['pure_text'],
          page: maps[i]['page'],
          amount: maps[i]['amount'],
          juz: maps[i]['juz'],
          x: maps[i]['x'],
          y: maps[i]['y'],
          xw: maps[i]['xw'],
          yw: maps[i]['yw'],
          xn: maps[i]['xn'],
          yn: maps[i]['yn'],
          hezb: maps[i]['hezb'],
          surahName: maps[i]['name'],
          quarter: maps[i]['quarter'],
          tafseer: maps[i]['tafseer'],
          text: maps[i]['text']);
    });
  }
}
