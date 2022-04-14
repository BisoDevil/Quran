import 'package:get_storage/get_storage.dart';
import 'package:quran/app/data/models/aya_model.dart';

import 'package:quran/app/data/providers/surah_provider.dart';
import 'package:quran/app/global/controller/dimension.dart';

import 'package:quran/app/modules/surah/views/local_widget/action_dialog.dart';
import 'package:quran/index.dart';

class SurahController extends GetxController {
  final SurahProvider _surahProvider = Get.find<SurahProvider>();
  var loc = Get.find<Dimension>();
  final GetStorage _box = Get.find<GetStorage>();
  PageController pageController = PageController();
  final popupMenu = Get.find<PopupMenu>();
  List<AyaModel> ayat = [];
  // AyaModel? currentAya;
  bool lineHasNoAya = false;
  Map<String, int> ayaPaintPoints = {};
  bool foundAya = false;
  late AyaModel currentAya;

  @override
  void onInit() {
    _getAyahs();
    super.onInit();
  }

  @override
  void onClose() {
    if (popupMenu.isShow) popupMenu.fastDismiss();
    super.onClose();
  }

  _getAyahs() async {
    late int index;
    bool fromKhatma = Get.arguments['fromKhatma'];

    if (fromKhatma) {
      index = _box.read('khatma') ?? 0;
    } else {
      var no = Get.arguments['surah'];
      index = await _surahProvider.getPageNumber(suraNumber: no, ayaNumber: 1);
    }

    ayat = await _surahProvider.pageAyat(pageNumber: index);
    currentAya = ayat.first;
    update();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      pageController.jumpToPage(index);
    });
  }

  Future<void> onPageChanged(int index) async {
    if (popupMenu.isShow) popupMenu.fastDismiss();
    ayaPaintPoints = {};
    ayat = await _surahProvider.pageAyat(pageNumber: index);
    currentAya = ayat.first;
    update();
    print(index);
  }

  // ayahAction(Ayah ayah, double offset) async {
  //   // show dialog
  //   return;
  //   // await Get.dialog(
  //   //   ActionDialog(
  //   //     text: ayah.text,
  //   //     onBookmarkPressed: () async {
  //   //       lastRead = ayah.number;
  //   //       if (surah != null) {
  //   //         await _box.write("khatma", {
  //   //           "surah": surah!.name,
  //   //           "percent": lastRead,
  //   //           "surahNo": surah!.number,
  //   //           "offset": offset
  //   //         });
  //   //         Get.find<HomeController>().getData();
  //   //       }
  //   //     },
  //   //   ),
  //   // );
  //   // selectedAyah = 0;
  //   // update();
  // }

  getAyaPaintPoints(double positionX, double positionY) async {
    int linesNumber = 15;
    int y = 0;
    int y2 = 100;
    int increaseBy = 100;

    if (pageController.page?.toInt() == 1 ||
        pageController.page?.toInt() == 2) {
      linesNumber = 7;
      y = 55;
      y2 = 200;
      increaseBy = 100;
    }

    outerloop:
    for (int line = 1; line <= linesNumber; line++) {
      //* INCREASE BY TO COVER EACH LINE HEIGHT
      y += increaseBy;
      y2 += increaseBy;

      //* Which Line Am I & Which ayat Are In
      if (positionY >= loc.getScaledY(y, false) &&
          positionY <= loc.getScaledY(y2, false)) {
        print(' Line : $line');
        print(' positionY : $positionY');
        print(' Y : ${loc.getScaledY(y, false)}');
        print(' Y2 : ${loc.getScaledY(y2, false)}');

        List<AyaModel> ayatInLine = [];

        //* GET ayat IN LINE
        for (int i = 0; i <= ayat.length - 1; i++) {
          if (loc.getScaledY(ayat[i].yn, false) >= loc.getScaledY(y, false) &&
              loc.getScaledY(ayat[i].yn, false) <= loc.getScaledY(y2, false)) {
            ayatInLine.add(ayat[i]);
          }
        }

        //*IF THIS LINE HAS NO AYA
        if (ayatInLine.isEmpty) {
          print('Line Has No Aya');
          lineHasNoAya = true;
          final double diff =
              (loc.getScaledY(y, false) - loc.getScaledY(y2, false));
          positionY += diff.abs();
          continue outerloop;
        }

        final List<AyaModel> reversedAyatInLine = ayatInLine.reversed.toList();

        //* LOOPING IN ayat IN LINE
        for (int a = 0; a <= ayatInLine.length - 1; a++) {
          int ayaIndex = ayat.indexOf(reversedAyatInLine[a]);

          if (lineHasNoAya) {
            final int ayaIndex2 = ayat.indexOf(ayatInLine[a]);
            ayaPaintPoints = {
              'endAyaX': ayat[ayaIndex2].xn,
              'endAyaY': ayat[ayaIndex2].yn,
              'prevAyaX': ayaIndex2 == 0 ? 0 : ayat[ayaIndex2 - 1].xn,
              'prevAyaY': ayaIndex2 == 0 ? 0 : ayat[ayaIndex2 - 1].yn,
            };
            foundAya = true;
            currentAya = ayat[ayaIndex2];
            print('Current Aya: ${currentAya.pureText}');

            break;
          } else if (positionX > loc.getScaledX(reversedAyatInLine[a].xn)) {
            ayaPaintPoints = {
              'endAyaX': ayat[ayaIndex].xn,
              'endAyaY': ayat[ayaIndex].yn,
              'prevAyaX': ayaIndex == 0 ? 0 : ayat[ayaIndex - 1].xn,
              'prevAyaY': ayaIndex == 0 ? 0 : ayat[ayaIndex - 1].yn,
            };
            foundAya = true;
            currentAya = ayat[ayaIndex];
            print('Current Aya: ${currentAya.pureText}');
          }

          //* THERE IS NO AYA WE ARE BIGGER THAN
          if (!foundAya) {
            print('THERE IS NO AYA WE ARE BIGGER THAN');

            ayaPaintPoints = {
              'endAyaX': ayat[ayaIndex + ayatInLine.length].xn,
              'endAyaY': ayat[ayaIndex + ayatInLine.length].yn,
              'prevAyaX': ayat[ayaIndex + (ayatInLine.length - 1)].xn,
              'prevAyaY': ayat[ayaIndex + (ayatInLine.length - 1)].yn,
            };
            currentAya = ayat[ayaIndex + ayatInLine.length];
            print('Current Aya: ${currentAya.pureText}');
          }
        }

        foundAya = false;
        lineHasNoAya = false;
        ayatInLine.clear();
      }
    }
    update();
    _showPopupMenu();
  }

  _showPopupMenu() {
    print("show");
    if (popupMenu.isShow) {
      popupMenu.fastDismiss();
    }
    bool isPre = true;
    var dataName = 'prev';

    // if (loc.getScaledY(currentAya.y, true) > loc.getScaledY(500, true)) {
    //   dataName = 'prev';
    //   // * REgularly the quran popUp appears above end aya,
    //   // * Send isPrev true make it appears upper to previos aya
    //   isPre = true;
    // }
    popupMenu.show(
      rect: Rect.fromCircle(
          center: Offset(
            loc.getScaledX(ayaPaintPoints['${dataName}AyaX']!),
            loc.getScaledY(ayaPaintPoints['${dataName}AyaY']!, true),
          ),
          radius: 0),
      isPrev: isPre,
    );
  }
}
