import 'package:get/get.dart';
import 'package:quran/app/data/models/surah_model.dart';
import 'package:quran/app/data/providers/surah_provider.dart';

class QuranIndexController extends GetxController {
  final SurahProvider _surahProvider = Get.find<SurahProvider>();
  List<Surah> surahs = [];

  @override
  void onInit() {
    _getAllSurah();
    super.onInit();
  }

  _getAllSurah() async {
    surahs = await _surahProvider.getAllSurah();
    update();
  }
}
