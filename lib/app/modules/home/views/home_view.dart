import 'package:quran/app/global/widget/khatma_widget.dart';
import 'package:quran/app/modules/home/views/local_widget/option_widget.dart';
import 'package:quran/app/modules/home/views/local_widget/qiblah_compass_widget.dart';
import 'package:quran/app/routes/app_pages.dart';
import 'package:quran/app/util/widget_util.dart';

import '../../../../index.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              addVerticalSpace(3),
              Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 10.h,
                    width: 10.h,
                    fit: BoxFit.cover,
                  ),
                  Spacer(),
                  Container(
                    height: 90,
                    width: 90,
                    child: QiblahCompass(),
                  )
                ],
              ),
              addVerticalSpace(7),
              Obx(
                () => Text(
                  controller.nextAdhan.value,
                  style: Get.textTheme.headline3?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Obx(
                () => Text(
                  S.of(context).inDurationM(controller.nextAdhanTime.value <= 0
                      ? ''
                      : controller.nextAdhanTime.value),
                  style: Get.textTheme.headline6,
                ),
              ),
              addVerticalSpace(1.5),
              Row(
                children: [
                  Icon(Icons.pin_drop_outlined),
                  Obx(
                    () => Text(
                      controller.currentCity.value,
                    ),
                  ),
                ],
              ),
              addVerticalSpace(3),
              KhatmaWidget(
                percent: .5,
                info: "Cow 168",
              ),
              addVerticalSpace(3),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  children: [
                    OptionWidget(
                      title: S.of(context).quran,
                      svgPath: "assets/icons/quran_book.svg",
                      onPressed: () {
                        Get.toNamed(Routes.QURAN_INDEX);
                      },
                    ),
                    OptionWidget(
                        title: S.of(context).azkarAlsabah,
                        svgPath: "assets/icons/azkar.svg"),
                    OptionWidget(
                        title: S.of(context).azkarAlmasa,
                        svgPath: "assets/icons/night.svg"),
                    OptionWidget(
                      title: S.of(context).doaaFromSunna,
                      svgPath: "assets/icons/open_book.svg",
                    ),
                    OptionWidget(
                      title: S.of(context).location,
                      svgPath: "assets/icons/location.svg",
                    ),
                    OptionWidget(
                      title: S.of(context).information,
                      svgPath: "assets/icons/info.svg",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
