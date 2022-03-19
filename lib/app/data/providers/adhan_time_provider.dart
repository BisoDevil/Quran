import 'package:get/get.dart';

import '../models/adhan_time_model.dart';

class AdhanTimeProvider extends GetConnect {
  AdhanTimeProvider() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return AdhanTime.fromJson(map);
      if (map is List) {
        return map.map((item) => AdhanTime.fromJson(item)).toList();
      }
    };

    httpClient.baseUrl = 'http://api.aladhan.com/v1/';
  }

  Future<AdhanTime?> getAdhanTime(double latitude, double longitude) async {
    final response =
        await httpClient.get('timings?latitude=$latitude&longitude=$longitude');

    return response.body;
  }
}
