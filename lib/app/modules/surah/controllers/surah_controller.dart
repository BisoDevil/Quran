import 'package:get_storage/get_storage.dart';
import 'package:quran/app/data/models/surah_model.dart';
import 'package:quran/app/data/providers/surah_provider.dart';
import 'package:quran/app/modules/home/controllers/home_controller.dart';
import 'package:quran/app/modules/surah/views/local_widget/action_dialog.dart';
import 'package:quran/index.dart';

class SurahController extends GetxController {
  final SurahProvider _surahProvider = Get.find<SurahProvider>();
  final GetStorage _box = Get.find<GetStorage>();
  final ScrollController scrollController = ScrollController();
  Surah? surah;
  int lastRead = 0;
  int selectedAyah = 0;
  var surahName = "".obs;

  @override
  void onInit() {
    _getAyahs();
    super.onInit();
  }

  _getAyahs() async {
    surah = await _surahProvider.getSurah(Get.arguments['surah']);

    surahName.value = surah!.name;

    update();

    if (Get.arguments['fromKhatma']) {
      if (_box.hasData('khatma')) {
        double offset = _box.read('khatma')['offset'] ?? 0;
        int _selected = _box.read('khatma')['percent'] ?? 0;
        WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
          scrollController.animateTo(offset,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
          selectedAyah = _selected;
          update();
        });
      }
    }
  }

  ayahAction(Ayah ayah, double offset) async {
    selectedAyah = ayah.number;
    update();
    // show dialog
    await Get.dialog(
      ActionDialog(
        text: ayah.text,
        onBookmarkPressed: () async {
          lastRead = ayah.number;
          if (surah != null) {
            await _box.write("khatma", {
              "surah": surah!.name,
              "percent": lastRead,
              "surahNo": surah!.number,
              "offset": offset
            });
            Get.find<HomeController>().getData();
          }
        },
      ),
    );
    selectedAyah = 0;
    update();
  }
}
