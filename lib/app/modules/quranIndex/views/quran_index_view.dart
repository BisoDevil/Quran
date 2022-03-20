import 'package:quran/app/global/widget/khatma_widget.dart';
import 'package:quran/app/modules/home/controllers/home_controller.dart';
import 'package:quran/app/routes/app_pages.dart';
import 'package:quran/app/util/widget_util.dart';

import '../../../../index.dart';
import '../controllers/quran_index_controller.dart';

class QuranIndexView extends GetView<QuranIndexController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).quran),
      ),
      body: GetBuilder<QuranIndexController>(
        builder: (_) {
          if (_.surahs.isEmpty) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            );
          }
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            children: [
              GetBuilder<HomeController>(
                builder: (_) {
                  return KhatmaWidget(
                    info: _.info.value,
                    percent: _.percent.value,
                    onPressed: () {
                      Get.toNamed(Routes.SURAH, arguments: {
                        "surah": _.surahNo.value,
                        "fromKhatma": true,
                      });
                    },
                  );
                },
              ),
              addVerticalSpace(3),
              for (var item in controller.surahs)
                ListTile(
                  dense: true,
                  onTap: () {
                    Get.toNamed(Routes.SURAH, arguments: {
                      "surah": item.number,
                      "fromKhatma": false,
                    });
                  },
                  title: Text(
                    item.name,
                    style: Get.textTheme.headline6,
                  ),
                  subtitle: Text(S.of(context).countAyat(item.numberOfAyahs)),
                  leading: Container(
                    child: Text(
                      item.number.toString(),
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
