import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../controllers/surah_controller.dart';

class SurahView extends GetView<SurahController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.surahName.value,
          ),
        ),
      ),
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
            child: SelectableText.rich(
              TextSpan(
                text: "",
                style: Get.textTheme.headline6!.copyWith(
                  height: 2.6,
                  fontFamily: "Quran",
                ),
                children: [
                  for (var item in _.surah!.ayahs!)
                    TextSpan(
                      text: " ${item.text} ",
                      children: [
                        WidgetSpan(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/aya_icon.png',
                                height: 40,
                              ),
                              VisibilityDetector(
                                key: GlobalObjectKey(item.number),
                                // key: Key(item.number.toString()),

                                onVisibilityChanged: (VisibilityInfo info) {
                                  if (info.visibleFraction == 0 &&
                                      item.number > _.lastRead) {
                                    _.lastRead = item.number;
                                    print(_.lastRead);
                                  }
                                },

                                child: Text(
                                  item.numberInSurah.toString(),
                                  style: Get.textTheme.caption!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                          alignment: PlaceholderAlignment.bottom,
                        ),
                      ],
                    ),
                ],
              ),
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
            ),
          );
        },
      ),
    );
  }
}
