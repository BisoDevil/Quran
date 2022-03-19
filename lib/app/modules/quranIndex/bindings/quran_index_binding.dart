import 'package:get/get.dart';

import '../controllers/quran_index_controller.dart';

class QuranIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuranIndexController>(
      () => QuranIndexController(),
    );
  }
}
