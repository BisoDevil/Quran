import 'package:get/get.dart';
import 'package:quran/app/data/providers/doaa_provider.dart';

import '../controllers/doaa_controller.dart';

class DoaaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoaaProvider>(
      () => DoaaProvider(),
    );
    Get.lazyPut<DoaaController>(
      () => DoaaController(),
    );
  }
}
