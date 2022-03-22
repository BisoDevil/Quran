import 'package:flutter/gestures.dart';
import 'package:quran/app/modules/surah/views/local_widget/ayah_number_widget.dart';

import 'package:quran/index.dart';

import '../controllers/surah_controller.dart';

class SurahView extends GetView<SurahController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 252, 249),
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            title: Obx(
              () => Text(
                controller.surahName.value,
              ),
            ),
            backgroundColor: Color.fromARGB(255, 252, 252, 249),
            floating: true,
          ),
          SliverToBoxAdapter(
            child: GetBuilder<SurahController>(
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
                        textDirection: TextDirection.rtl,
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
                                  children: [
                                    WidgetSpan(
                                      child: AyahNumberWidget(
                                          number: item.numberInSurah),
                                      alignment: PlaceholderAlignment.bottom,
                                    ),
                                  ]);
                            }

                            return TextSpan(
                              text: " ${item.text} ",
                              recognizer: LongPressGestureRecognizer()
                                ..onLongPress = () {
                                  controller.ayahAction(
                                      item, _.scrollController.offset);
                                },
                              style: TextStyle(
                                backgroundColor: item.number == _.selectedAyah
                                    ? Colors.grey[300]
                                    : null,
                              ),
                              children: [
                                WidgetSpan(
                                  child: AyahNumberWidget(
                                      number: item.numberInSurah),
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
          )
        ],
      ),
    );
  }
}
