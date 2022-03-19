import 'dart:convert';

import 'package:quran/app/data/models/azkar_model.dart';

import 'package:flutter/services.dart' show rootBundle;

class AzkarProvider {
  Future<List<Azkar>> getMorningAzkar() async {
    var json = await rootBundle.loadString('assets/json/morning_azkar.json');
    var decoded = jsonDecode(json);
    return List<Azkar>.from(decoded.map((e) => Azkar.fromJson(e)).toList());
  }

  Future<List<Azkar>> getNightAzkar() async {
    var json = await rootBundle.loadString('assets/json/night_azkar.json');
    var decoded = jsonDecode(json);
    return List<Azkar>.from(decoded.map((e) => Azkar.fromJson(e)).toList());
  }
}
