import 'package:flutter/gestures.dart';

import 'package:quran/index.dart';

import '../controllers/surah_controller.dart';

class SurahView extends GetView<SurahController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 252, 249),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        body: GetBuilder<SurahController>(
          builder: (_) {
            if (_.surah == null) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                ),
              );
            }
            return SingleChildScrollView(
              padding: EdgeInsets.all(10),
              controller: controller.scrollController,
              child: Column(
                children: [
                  if (_.surah!.ayahs!.first.text
                      .contains('بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ'))
                    Text(
                      'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                      style: Get.textTheme.headline4!.copyWith(
                        // height: 2.6,
                        color: Colors.black,
                        fontFamily: "Quran",
                      ),
                    ),
                  RichText(
                    // textDirection: TextDirection.rtl,
                    text: TextSpan(
                      text: "",
                      style: Get.textTheme.headline6!.copyWith(
                        height: 2.6,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Quran",
                      ),
                      children: _.surah!.ayahs!.map((item) {
                        if (item.text.contains(
                            'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ')) {
                          return TextSpan(
                              text:
                                  " ${item.text.replaceFirst('بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ', '')} ",
                              style: Get.textTheme.headline5!.copyWith(
                                height: 2.6,
                                fontFamily: "Quran",
                              ));
                        }
                        return TextSpan(
                          text: " ${item.text} ",
                          recognizer: LongPressGestureRecognizer()
                            ..onLongPress = () {
                              controller.ayahAction(
                                  item, _.scrollController.offset);
                            },
                          children: [
                            WidgetSpan(
                              child: Stack(
                                alignment: Alignment.center,
                                key: GlobalObjectKey(item.number),
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/aya_icon.svg',
                                    height: 33,
                                  ),
                                  Text(
                                    item.numberInSurah.toString(),
                                    style: Get.textTheme.caption!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 9,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                              alignment: PlaceholderAlignment.bottom,
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            );
          },
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Obx(
                () => Text(
                  controller.surahName.value,
                ),
              ),
              floating: true,
            )
          ];
        },
      ),
    );
  }
}
