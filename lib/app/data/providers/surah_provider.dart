import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/surah_model.dart';

class SurahProvider extends GetConnect {
  late GetStorage _box;
  SurahProvider() {
    httpClient.defaultDecoder = (map) {
      if (map["data"] is Map<String, dynamic>) {
        var surah = Surah.fromJson(map["data"]);
        _box.write(surah.number.toString(), map["data"]);
        return surah;
      }
      if (map["data"] is List) {
        _box.write("all", map["data"]);
        return List<Surah>.from(
            map["data"].map((item) => Surah.fromJson(item)));
      }
    };
    httpClient.baseUrl = 'http://api.alquran.cloud/v1/';
    _box = GetStorage();
  }
  Future<List<Surah>> getAllSurah() async {
    if (_box.hasData('all')) {
      var _data = _box.read('all');
      return List<Surah>.from(_data.map((item) => Surah.fromJson(item)));
    }

    final response = await get('surah');

    return response.body;
  }

  Future<Surah?> getSurah(int id) async {
    if (_box.hasData(id.toString())) {
      var _data = _box.read(id.toString());
      return Surah.fromJson(_data);
    }
    final response = await get('surah/$id');
    return response.body;
  }
}
