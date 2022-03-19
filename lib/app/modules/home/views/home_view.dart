import 'package:quran/app/global/widget/khatma_widget.dart';
import 'package:quran/app/modules/home/views/local_widget/option_widget.dart';
import 'package:quran/app/modules/home/views/local_widget/qiblah_compass_widget.dart';
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
              Text(
                "Maghrib",
                style: Get.textTheme.headline3?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "in 28m",
                style: Get.textTheme.headline6,
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
              KhatmaWidget(),
              addVerticalSpace(3),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  children: [
                    OptionWidget(
                      title: "Quran",
                      svgPath: "assets/icons/quran_book.svg",
                    ),
                    OptionWidget(
                        title: "Azkar Alsabah",
                        svgPath: "assets/icons/azkar.svg"),
                    OptionWidget(
                        title: "Azkar Almasa",
                        svgPath: "assets/icons/night.svg"),
                    OptionWidget(
                      title: "Doaa from sunna",
                      svgPath: "assets/icons/open_book.svg",
                    ),
                    OptionWidget(
                      title: "Location",
                      svgPath: "assets/icons/location.svg",
                    ),
                    OptionWidget(
                      title: "Information",
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
