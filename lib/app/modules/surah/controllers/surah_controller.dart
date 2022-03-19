import 'package:get/get.dart';
import 'package:quran/app/data/providers/surah_provider.dart';

import '../../../data/models/surah_model.dart';

class SurahController extends GetxController {
  final SurahProvider _surahProvider = Get.find<SurahProvider>();
  String fullSurah = "";
  var surahName = "".obs;
  @override
  void onInit() {
    _getAyahs();
    super.onInit();
  }

  _getAyahs() async {
    var surah = await _surahProvider.getSurah(Get.arguments);
    surahName.value = surah!.name;
    for (var item in surah.ayahs!) {
      fullSurah += "${item.text}《${item.numberInSurah}》";
    }
    update();
  }
}
