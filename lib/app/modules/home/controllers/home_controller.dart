import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';

import 'package:map_launcher/map_launcher.dart';
import 'package:quran/app/data/models/adhan_time_model.dart';
import 'package:quran/app/data/providers/adhan_time_provider.dart';
import 'package:quran/app/util/util_function.dart';

import '../../../../index.dart';
import '../views/local_widget/adhan_model_sheet.dart';

class HomeController extends GetxController {
  var currentCity = "".obs;
  var nextAdhan = "".obs;
  late Duration nextAdhanTime;
  var nextAdhanText = "".obs;
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

    super.onInit();
  }

  _getCurrentCity() async {
    var _now = DateTime.now();
    if (_box.hasData("adhan-${_now.day}")) {
      var cached = AdhanTime.fromJson(_box.read('adhan-${_now.day}'));

      adhanTime = cached;
      update();
    }
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      _permission = await Geolocator.requestPermission();
    }
    _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied) {
      _permission = await Geolocator.requestPermission();
    }
    var pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium,
    );

    adhanTime = await _adhanTimeProvider.getAdhanTime(
        pos.latitude, pos.longitude, DateTime.now());

    _nextAdhan = await _adhanTimeProvider.getAdhanTime(
        pos.latitude, pos.longitude, DateTime.now().add(Duration(days: 1)));
    List<Placemark> placemarks = await placemarkFromCoordinates(
      pos.latitude,
      pos.longitude,
      localeIdentifier: Get.locale?.languageCode,
    );
    _getNextPrayerTime();
    currentCity.value = placemarks.first.administrativeArea ?? '';
    _startCounter();
  }

  getData() {
    if (_box.hasData("khatma")) {
      info.value = _box.read('surahName') ?? '';
      surahNo.value = _box.read("khatma") ?? 0;

      percent.value = (_box.read("khatma") ?? 0) / 605;
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

  _getNextPrayerTime() {
    var _now = DateTime.now();

    /// Check Fajr
    if (adhanTime!.fajr.isAfter(_now)) {
      nextAdhanTime = adhanTime!.fajr.difference(_now);
      nextAdhanText.value =
          S.current.inDurationM(nextAdhanTime.formatDuration());
      nextAdhan.value = S.current.fajr;
    } else if (adhanTime!.fajr.isBefore(_now) &&
        _now.difference(adhanTime!.fajr).inMinutes < 90) {
      nextAdhanTime = _now.difference(adhanTime!.fajr);

      nextAdhanText.value = S.current.fromDuration(
        nextAdhanTime.formatDuration(),
      );
      nextAdhan.value = S.current.fajr;
    }

    /// Check Dhur
    else if (adhanTime!.dhuhr.isAfter(_now) &&
        _now.difference(adhanTime!.fajr).inMinutes > 90) {
      nextAdhanTime = adhanTime!.dhuhr.difference(_now);
      nextAdhanText.value =
          S.current.inDurationM(nextAdhanTime.formatDuration());
      nextAdhan.value = S.current.dhuhr;
    } else if (adhanTime!.dhuhr.isBefore(_now) &&
        _now.difference(adhanTime!.dhuhr).inMinutes < 30) {
      nextAdhanTime = adhanTime!.dhuhr.difference(_now);
      nextAdhanText.value =
          S.current.inDurationM(nextAdhanTime.formatDuration());
      nextAdhan.value = S.current.dhuhr;
    }

    /// Check asr

    else if (adhanTime!.asr.isAfter(_now) &&
        _now.difference(adhanTime!.dhuhr).inMinutes > 30) {
      nextAdhanTime = adhanTime!.asr.difference(_now);
      nextAdhanText.value =
          S.current.inDurationM(nextAdhanTime.formatDuration());
      nextAdhan.value = S.current.asr;
    } else if (adhanTime!.asr.isBefore(_now) &&
        _now.difference(adhanTime!.asr).inMinutes < 30) {
      nextAdhanTime = adhanTime!.asr.difference(_now);
      nextAdhanText.value =
          S.current.inDurationM(nextAdhanTime.formatDuration());
      nextAdhan.value = S.current.asr;
    }

    /// Check Maghrib
    else if (adhanTime!.maghrib.isAfter(_now) &&
        _now.difference(adhanTime!.asr).inMinutes > 30) {
      nextAdhanTime = adhanTime!.maghrib.difference(_now);
      nextAdhanText.value =
          S.current.inDurationM(nextAdhanTime.formatDuration());
      nextAdhan.value = S.current.maghrib;
    } else if (adhanTime!.asr.isBefore(_now) &&
        _now.difference(adhanTime!.maghrib).inMinutes < 30) {
      nextAdhanTime = adhanTime!.maghrib.difference(_now);
      nextAdhanText.value =
          S.current.inDurationM(nextAdhanTime.formatDuration());
      nextAdhan.value = S.current.maghrib;
    }

    /// Check Isha
    else if (adhanTime!.isha.isAfter(_now) &&
        _now.difference(adhanTime!.maghrib).inMinutes > 30) {
      nextAdhanTime = adhanTime!.isha.difference(_now);
      nextAdhanText.value =
          S.current.inDurationM(nextAdhanTime.formatDuration());
      nextAdhan.value = S.current.isha;
    } else if (adhanTime!.isha.isBefore(_now) &&
        _now.difference(adhanTime!.isha).inMinutes < 60) {
      nextAdhanTime = adhanTime!.isha.difference(_now);
      nextAdhanText.value =
          S.current.inDurationM(nextAdhanTime.formatDuration());
      nextAdhan.value = S.current.isha;
    }

    /// Check Next Day
    else {
      nextAdhanTime = _nextAdhan!.fajr.add(Duration(days: 1)).difference(_now);
      nextAdhanText.value =
          S.current.inDurationM(nextAdhanTime.formatDuration());
      nextAdhan.value = S.current.fajr;
    }

    update();
  }

  _startCounter() {
    Timer.periodic(Duration(seconds: 1), (t) {
      _getNextPrayerTime();
    });
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
