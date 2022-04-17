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

    final response = await httpClient.get(
        'timings?latitude=$latitude&longitude=$longitude&date_or_timestamp=${DateFormat('DD-MM-YYYY').format(date)}');

    await _box.write("adhan-${date.day}", response.body);

    return AdhanTime.fromJson(response.body);
  }
}
