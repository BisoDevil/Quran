import 'package:get_storage/get_storage.dart';
import 'package:quran/app/data/providers/surah_provider.dart';
import 'package:quran/app/global/controller/dimension.dart';

import 'package:quran/app/theme/light_theme.dart';
import 'app/routes/app_pages.dart';
import 'index.dart';

Future<void> main() async {
  await GetStorage.init("jawza");
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        defaultTransition: Transition.cupertino,
        theme: lightTheme,
        locale: Locale('ar'),
        onInit: () {
          Get.put(SurahProvider());
          Get.put(Dimension());
        },
        localizationsDelegates: [
          S.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    ),
  );
}
