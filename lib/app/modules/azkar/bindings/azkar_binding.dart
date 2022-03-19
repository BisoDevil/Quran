import 'package:get/get.dart';
import 'package:quran/app/data/providers/azkar_provider.dart';

import '../controllers/azkar_controller.dart';

class AzkarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AzkarProvider>(
      () => AzkarProvider(),
    );
    Get.lazyPut<AzkarController>(
      () => AzkarController(),
    );
  }
}
