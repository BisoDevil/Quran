import 'package:get/get.dart';

import '../models/surah_model.dart';

class SurahProvider extends GetConnect {
  SurahProvider() {
    httpClient.defaultDecoder = (map) {
      if (map["data"] is Map<String, dynamic>) {
        return Surah.fromJson(map["data"]);
      }
      if (map["data"] is List) {
        return List<Surah>.from(
            map["data"].map((item) => Surah.fromJson(item)));
      }
    };
    httpClient.baseUrl = 'http://api.alquran.cloud/v1/';
  }
  Future<List<Surah>> getAllSurah() async {
    final response = await get('surah');

    return response.body;
  }

  Future<Surah?> getSurah(int id) async {
    final response = await get('surah/$id');
    return response.body;
  }
}
