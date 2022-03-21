import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';

import 'package:map_launcher/map_launcher.dart';
import 'package:quran/app/data/models/adhan_time_model.dart';
import 'package:quran/app/data/providers/adhan_time_provider.dart';

import '../../../../index.dart';
import '../views/local_widget/adhan_model_sheet.dart';

class HomeController extends GetxController {
  var currentCity = "".obs;
  var nextAdhan = "".obs;
  var nextAdhanTime = Duration().obs;
  var surahNo = 1.obs;
  var info = "".obs;
  var percent = 0.0.obs;
  AdhanTime? adhanTime, _nextAdhan;
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

  showAdhanBottomSheet() {
    if (adhanTime == null) return;
    Get.bottomSheet(
      AdhanModelSheet(
        adhanTime: adhanTime!,
      ),
    );
  }

  _getNextPrayerTime() async {
    var pos = await Geolocator.getLastKnownPosition();
    double lat = pos?.latitude ?? 26.30415281489869;
    double long = pos?.longitude ?? 50.22714383787001;

    //,
    adhanTime =
        await _adhanTimeProvider.getAdhanTime(lat, long, DateTime.now());

    var _now = DateTime.now();
    if (adhanTime!.fajr.isAfter(_now)) {
      nextAdhanTime.value = adhanTime!.fajr.difference(_now);
      nextAdhan.value = S.current.fajr;
    } else if (adhanTime!.dhuhr.isAfter(_now)) {
      nextAdhanTime.value = adhanTime!.dhuhr.difference(_now);
      nextAdhan.value = S.current.dhuhr;
    } else if (adhanTime!.asr.isAfter(_now)) {
      nextAdhanTime.value = adhanTime!.asr.difference(_now);
      nextAdhan.value = S.current.asr;
    } else if (adhanTime!.maghrib.isAfter(_now)) {
      nextAdhanTime.value = adhanTime!.maghrib.difference(_now);
      nextAdhan.value = S.current.maghrib;
    } else if (adhanTime!.isha.isAfter(_now)) {
      nextAdhanTime.value = adhanTime!.isha.difference(_now);
      nextAdhan.value = S.current.isha;
    } else {
      _nextAdhan = await _adhanTimeProvider.getAdhanTime(
          lat, long, DateTime.now().add(Duration(days: 1)));
      nextAdhanTime.value =
          _nextAdhan!.fajr.add(Duration(days: 1)).difference(_now);

      nextAdhan.value = S.current.fajr;
    }

    update();
  }

  launchMap() async {
    final availableMaps = await MapLauncher.installedMaps;
    print(availableMaps); // [AvailableMap { mapName: Google Maps
    await availableMaps.first.showMarker(
      coords: Coords(26.30411434323595, 50.22712238019586),
      title: 'مسجد الجوزاء القحطاني',
    );
  }
}
