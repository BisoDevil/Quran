import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../models/adhan_time_model.dart';

class AdhanTimeProvider extends GetConnect {
  final GetStorage _box = Get.find<GetStorage>();
  AdhanTimeProvider() {
    httpClient.baseUrl = 'http://api.aladhan.com/v1/';
  }

  Future<AdhanTime?> getAdhanTime(
      double latitude, double longitude, DateTime date) async {
    /// Check now date to get it from cache first
    var _now = DateTime.now();
    if (date.year == _now.year &&
        date.month == _now.month &&
        date.day == _now.day &&
        _box.hasData('adhan')) {
      var map = _box.read("adhan");
      print("from cache");
      return AdhanTime.fromJson(map);
    } else {
      final response = await httpClient.get(
          'timings?latitude=$latitude&longitude=$longitude&date_or_timestamp=${DateFormat('DD-MM-YYYY').format(date)}');
      await _box.write("adhan", response.body);
      return AdhanTime.fromJson(response.body);
    }
  }
}
