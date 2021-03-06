import 'package:get/get.dart';
import 'package:quran/app/data/providers/surah_provider.dart';

import '../controllers/quran_index_controller.dart';

class QuranIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurahProvider>(
      () => SurahProvider(),
    );
    Get.lazyPut<QuranIndexController>(
      () => QuranIndexController(),
    );
  }
}
