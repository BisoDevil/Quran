import 'package:get_storage/get_storage.dart';
import 'package:quran/app/data/models/surah_model.dart';
import 'package:quran/app/data/providers/surah_provider.dart';
import 'package:quran/app/modules/home/controllers/home_controller.dart';
import 'package:quran/index.dart';

class SurahController extends GetxController {
  final SurahProvider _surahProvider = Get.find<SurahProvider>();
  final GetStorage _box = Get.find<GetStorage>();

  Surah? surah;
  int lastRead = 0;
  var surahName = "".obs;
  @override
  void onInit() {
    _getAyahs();
    super.onInit();
  }

//{
  //   "surah": item.number,
  //   "fromKhatma": false,
  // }
  _getAyahs() async {
    surah = await _surahProvider.getSurah(Get.arguments['surah']);
    surahName.value = surah!.name;

    update();
    if (Get.arguments['fromKhatma']) {
      if (_box.hasData('khatma')) {
        lastRead = _box.read('khatma')['percent'] ?? 0;
        await Future.delayed(Duration(seconds: 1), () {
          Scrollable.ensureVisible(
            GlobalObjectKey(lastRead).currentContext!,
            duration: Duration(
              milliseconds: 300,
            ),
          );
        });
      }
    }
  }

  @override
  void onClose() {
    _close();
    super.onClose();
  }

  _close() async {
    if (surah != null) {
      await _box.write("khatma", {
        "surah": surah!.name,
        "percent": lastRead,
        "surahNo": surah!.number,
      });
      Get.find<HomeController>().getData();
    }
  }
}
