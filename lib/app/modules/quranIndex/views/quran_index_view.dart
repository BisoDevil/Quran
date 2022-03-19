import 'package:quran/app/global/widget/khatma_widget.dart';
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
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<QuranIndexController>(
        builder: (_) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            children: [
              KhatmaWidget(percent: .3, info: "info"),
              addVerticalSpace(3),
              for (var item in controller.surahs)
                ListTile(
                  dense: true,
                  onTap: () {
                    Get.toNamed(Routes.SURAH, arguments: item.number);
                  },
                  title: Text(
                    item.name,
                    style: Get.textTheme.headline6,
                  ),
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
