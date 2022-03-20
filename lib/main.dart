import 'package:get_storage/get_storage.dart';
import 'package:quran/app/theme/light_theme.dart';
import 'app/routes/app_pages.dart';
import 'index.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        defaultTransition: Transition.cupertino,
        theme: lightTheme,
        locale: Locale('ar'),
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
