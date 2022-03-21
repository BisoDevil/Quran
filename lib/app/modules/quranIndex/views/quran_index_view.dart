import 'package:quran/app/global/widget/khatma_widget.dart';
import 'package:quran/app/modules/home/controllers/home_controller.dart';
import 'package:quran/app/routes/app_pages.dart';

import '../../../../index.dart';
import '../controllers/quran_index_controller.dart';

class QuranIndexView extends GetView<QuranIndexController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/bg_rtl.png',
          fit: BoxFit.cover,
        ),
        Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: BackButton(),
                expandedHeight: 30.h,
                title: Text(S.of(context).quran),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    margin: EdgeInsets.only(top: kToolbarHeight + 20),
                    padding: EdgeInsets.all(12),
                    child: Center(
                      child: GetBuilder<HomeController>(
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
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: GetBuilder<QuranIndexController>(
                  builder: (_) {
                    if (_.surahs.isEmpty) {
                      return Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                        ),
                      );
                    }
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      padding: EdgeInsets.only(top: 3.h),
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          var item = _.surahs[index];
                          return ListTile(
                            dense: true,
                            onTap: () {
                              Get.toNamed(Routes.SURAH, arguments: {
                                "surah": item.number,
                                "fromKhatma": false,
                              });
                            },
                            title: Image.asset(
                              'assets/surahs/sname_${item.number}.png',
                              alignment: Alignment.centerRight,
                              height: 38,
                            ),
                            subtitle: Text(
                              S.of(context).countAyat(item.numberOfAyahs),
                              style: Get.textTheme.subtitle2?.copyWith(
                                color: Get.theme.colorScheme.primary,
                              ),
                            ),
                            leading: Container(
                              child: Text(
                                "${item.number}.",
                                style: Get.textTheme.headline6?.copyWith(
                                  color: Get.theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: _.surahs.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
