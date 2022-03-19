import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:quran/app/data/models/adhan_time_model.dart';
import 'package:quran/app/data/providers/adhan_time_provider.dart';

import '../../../../index.dart';

class HomeController extends GetxController {
  var currentCity = "".obs;
  var nextAdhan = "".obs;
  var nextAdhanTime = 0.obs;
  loc.Location location = loc.Location();
  final AdhanTimeProvider _adhanTimeProvider = Get.find<AdhanTimeProvider>();

  late bool _serviceEnabled;
  late loc.PermissionStatus _permissionGranted;

  @override
  void onInit() {
    _getCurrentCity();

    super.onInit();
  }

  _getCurrentCity() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }
    var pos = await location.getLocation();
    _getNextPrayerTime(pos);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(pos.latitude!, pos.longitude!);

    currentCity.value = placemarks.first.administrativeArea ?? '';
  }

  _getNextPrayerTime(loc.LocationData location) async {
    AdhanTime? adhanTime = await _adhanTimeProvider.getAdhanTime(
        location.latitude!, location.longitude!);
    var _now = DateTime.now();
    if (adhanTime!.fajr.isAfter(_now)) {
      nextAdhanTime.value = adhanTime.fajr.difference(_now).inMinutes;
      nextAdhan.value = S.current.fajr;
    } else if (adhanTime.dhuhr.isAfter(_now)) {
      nextAdhanTime.value = adhanTime.dhuhr.difference(_now).inMinutes;
      nextAdhan.value = S.current.dhuhr;
    } else if (adhanTime.asr.isAfter(_now)) {
      nextAdhanTime.value = adhanTime.asr.difference(_now).inMinutes;
      nextAdhan.value = S.current.asr;
    } else if (adhanTime.maghrib.isAfter(_now)) {
      nextAdhanTime.value = adhanTime.maghrib.difference(_now).inMinutes;
      nextAdhan.value = S.current.maghrib;
    } else if (adhanTime.isha.isAfter(_now)) {
      nextAdhanTime.value = adhanTime.isha.difference(_now).inMinutes;
      nextAdhan.value = S.current.isha;
    } else {
      nextAdhanTime.value = 0;
      nextAdhan.value = S.current.youreDone;
    }

    update();
  }
}
