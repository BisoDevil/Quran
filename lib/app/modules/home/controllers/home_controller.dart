import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';

import 'package:map_launcher/map_launcher.dart';
import 'package:quran/app/data/models/adhan_time_model.dart';
import 'package:quran/app/data/providers/adhan_time_provider.dart';

import '../../../../index.dart';

class HomeController extends GetxController {
  var currentCity = "".obs;
  var nextAdhan = "".obs;
  var nextAdhanTime = 0.obs;
  var surahNo = 1.obs;
  var info = "".obs;
  var percent = 0.0.obs;

  final AdhanTimeProvider _adhanTimeProvider = Get.find<AdhanTimeProvider>();
  final GetStorage _box = Get.find<GetStorage>();
  late bool _serviceEnabled;
  late LocationPermission _permission;

  @override
  void onInit() {
    _getCurrentCity();
    getData();
    _getNextPrayerTime();
    super.onInit();
  }

  _getCurrentCity() async {
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      _permission = await Geolocator.requestPermission();
    }
    _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied) {
      _permission = await Geolocator.requestPermission();
    }
    var pos = await Geolocator.getCurrentPosition();

    List<Placemark> placemarks = await placemarkFromCoordinates(
      pos.latitude,
      pos.longitude,
      localeIdentifier: Get.locale?.languageCode,
    );

    currentCity.value = placemarks.first.administrativeArea ?? '';
  }

  getData() {
    if (_box.hasData("khatma")) {
      var _data = _box.read("khatma");
      info.value = _data['surah'] ?? '';
      surahNo.value = _data['surahNo'] ?? 1;
      print(_data['percent']);
      percent.value = (_data['percent'] ?? 0) / 6200;
      update();
    }
  }

  _getNextPrayerTime() async {
    var pos = await Geolocator.getLastKnownPosition();
    double lat = pos?.latitude ?? 26.30415281489869;
    double long = pos?.longitude ?? 50.22714383787001;

    //,
    AdhanTime? adhanTime = await _adhanTimeProvider.getAdhanTime(lat, long);
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

  launchMap() async {
    final availableMaps = await MapLauncher.installedMaps;
    print(availableMaps); // [AvailableMap { mapName: Google Maps
    await availableMaps.first.showDirections(
        destination: Coords(26.30411434323595, 50.22712238019586));
  }
}
