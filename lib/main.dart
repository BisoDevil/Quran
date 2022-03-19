import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran/app/theme/light_theme.dart';
import 'package:sizer/sizer.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        defaultTransition: Transition.circularReveal,
        theme: lightTheme,
      ),
    ),
  );
}
