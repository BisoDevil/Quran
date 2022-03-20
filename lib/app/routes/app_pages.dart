import 'package:get/get.dart';

import '../modules/azkar/bindings/azkar_binding.dart';
import '../modules/azkar/views/azkar_view.dart';
import '../modules/doaa/bindings/doaa_binding.dart';
import '../modules/doaa/views/doaa_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/info/bindings/info_binding.dart';
import '../modules/info/views/info_view.dart';
import '../modules/quranIndex/bindings/quran_index_binding.dart';
import '../modules/quranIndex/views/quran_index_view.dart';
import '../modules/surah/bindings/surah_binding.dart';
import '../modules/surah/views/surah_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.QURAN_INDEX,
      page: () => QuranIndexView(),
      binding: QuranIndexBinding(),
    ),
    GetPage(
      name: _Paths.SURAH,
      page: () => SurahView(),
      binding: SurahBinding(),
    ),
    GetPage(
      name: _Paths.AZKAR,
      page: () => AzkarView(),
      binding: AzkarBinding(),
    ),
    GetPage(
      name: _Paths.DOAA,
      page: () => DoaaView(),
      binding: DoaaBinding(),
    ),
    GetPage(
      name: _Paths.INFO,
      page: () => InfoView(),
      binding: InfoBinding(),
    ),
  ];
}
