import 'package:get/get.dart';
import 'package:quran/app/data/providers/surah_provider.dart';

import '../controllers/surah_controller.dart';

class SurahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurahProvider>(
      () => SurahProvider(),
    );
    Get.lazyPut<SurahController>(
      () => SurahController(),
    );
  }
}