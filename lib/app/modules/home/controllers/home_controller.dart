import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;

class HomeController extends GetxController {
  var currentCity = "".obs;
  loc.Location location = loc.Location();

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

    List<Placemark> placemarks =
        await placemarkFromCoordinates(pos.latitude!, pos.longitude!);

    currentCity.value = placemarks.first.administrativeArea ?? '';
  }
}
