import 'package:get_storage/get_storage.dart';
import 'package:quran/app/data/models/surah_model.dart';
import 'package:quran/app/data/providers/surah_provider.dart';
import 'package:quran/app/modules/home/controllers/home_controller.dart';
import 'package:quran/index.dart';

class SurahController extends GetxController {
  final SurahProvider _surahProvider = Get.find<SurahProvider>();
  final GetStorage _box = Get.find<GetStorage>();
  String fullSurah = "";
  Surah? surah;
  int lastRead = 0;
  var surahName = "".obs;
  @override
  void onInit() {
    _getAyahs();
    super.onInit();
  }

  _getAyahs() async {
    surah = await _surahProvider.getSurah(Get.arguments);
    surahName.value = surah!.name;
    for (var item in surah!.ayahs!) {
      fullSurah += "${item.text}《${item.numberInSurah}》";
    }
    update();
  }

  @override
  Future<void> onClose() async {
    if (surah != null) {
      await _box.write("khatma", {"surah": surah!.name, "percent": lastRead});
      Get.find<HomeController>().getData();
    }

    super.onClose();
  }
}
