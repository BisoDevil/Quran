import 'package:geocoding/geocoding.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart' as loc;
import 'package:map_launcher/map_launcher.dart';
import 'package:quran/app/data/models/adhan_time_model.dart';
import 'package:quran/app/data/providers/adhan_time_provider.dart';

import '../../../../index.dart';

class HomeController extends GetxController {
  var currentCity = "".obs;
  var nextAdhan = "".obs;
  var nextAdhanTime = 0.obs;
  var info = "".obs;
  var percent = 0.0.obs;
  loc.Location location = loc.Location();
  final AdhanTimeProvider _adhanTimeProvider = Get.find<AdhanTimeProvider>();
  final GetStorage _box = Get.find<GetStorage>();
  late bool _serviceEnabled;
  late loc.PermissionStatus _permissionGranted;

  @override
  void onInit() {
    _getCurrentCity();
    getData();
    _getNextPrayerTime();
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

    List<Placemark> placemarks =
        await placemarkFromCoordinates(pos.latitude!, pos.longitude!);

    currentCity.value = placemarks.first.administrativeArea ?? '';
  }

  getData() {
    if (_box.hasData("khatma")) {
      var _data = _box.read("khatma");
      info.value = _data['surah'] ?? '';
      print(_data['percent']);
      percent.value = (_data['percent'] ?? 0) / 6200;
      update();
    }
  }

  _getNextPrayerTime() async {
    var pos = await location.getLocation();
    AdhanTime? adhanTime =
        await _adhanTimeProvider.getAdhanTime(pos.latitude!, pos.longitude!);
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
