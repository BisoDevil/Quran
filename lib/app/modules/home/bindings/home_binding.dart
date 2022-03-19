import 'package:get/get.dart';
import 'package:quran/app/data/providers/adhan_time_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdhanTimeProvider>(
      () => AdhanTimeProvider(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
