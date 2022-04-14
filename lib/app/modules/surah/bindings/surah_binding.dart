import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quran/app/data/providers/surah_provider.dart';
import 'package:quran/app/modules/surah/views/local_widget/action_dialog.dart';

import '../../../global/controller/dimension.dart';
import '../controllers/surah_controller.dart';

class SurahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dimension());
    Get.lazyPut(() => PopupMenu());
    Get.lazyPut<SurahProvider>(
      () => SurahProvider(),
    );
    Get.lazyPut<GetStorage>(
      () => GetStorage(),
    );
    Get.lazyPut<SurahController>(
      () => SurahController(),
    );
  }
}
