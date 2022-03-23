import 'package:flutter/gestures.dart';
import 'package:flutter/scheduler.dart';
import 'package:quran/app/modules/surah/views/local_widget/aya_number_widget.dart';

import 'package:quran/index.dart';

import '../controllers/surah_controller.dart';

class SurahView extends GetView<SurahController> {
  double getYOffsetOf(GlobalKey key) {
    RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
    return box.localToGlobal(Offset.zero).dy;
  }

  double getXOffsetOf(GlobalKey key) {
    RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
    return box.localToGlobal(Offset.zero).dx;
  }

  void resolveSameRow(List<GlobalKey<WidgetSpanWrapperState>> keys) {
    var middle = (keys.length / 2.0).floor();
    for (int i = 0; i < middle; i++) {
      var a = keys[i];
      var b = keys[keys.length - i - 1];
      var left = getXOffsetOf(a);
      var right = getXOffsetOf(b);
      a.currentState!.updateXOffset(right - left);
      b.currentState!.updateXOffset(left - right);
    }
  }

  final keys = <GlobalKey<WidgetSpanWrapperState>>[];
  nextKey() {
    var key = GlobalKey<WidgetSpanWrapperState>();
    keys.add(key);
    return key;
  }

  @override
  Widget build(BuildContext context) {
    keys.clear();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(milliseconds: 20), () {
        if (keys.isNotEmpty) {
          List<GlobalKey<WidgetSpanWrapperState>>? sameRow;
          GlobalKey<WidgetSpanWrapperState> prev = keys.removeAt(0);
          for (var key in keys) {
            if (getYOffsetOf(key) == getYOffsetOf(prev)) {
              sameRow ??= [prev];

              sameRow.add(key);
            } else if (sameRow != null) {
              resolveSameRow(sameRow);
              sameRow = null;
            }
            prev = key;
          }
          if (sameRow != null) {
            resolveSameRow(sameRow);
          }
        }
      });
    });

    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            title: Obx(
              () => Text(
                controller.surahName.value,
              ),
            ),
            backgroundColor: Colors.amber[100],
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

                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        for (var item in _.surah!.ayahs!)
                          item.text.contains(
                                  'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ')
                              ? WidgetSpan(
                                  child: WidgetSpanWrapper(
                                    key: nextKey(),
                                    child: Center(
                                      child: Text(
                                        "g",
                                        style: TextStyle(
                                          fontSize: 50,
                                          fontFamily: "Besmellah",
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : TextSpan(
                                  text: " ${item.text} ",
                                  recognizer: LongPressGestureRecognizer()
                                    ..onLongPress = () {
                                      controller.ayahAction(
                                          item, _.scrollController.offset);
                                    },
                                  style: TextStyle(
                                    backgroundColor:
                                        item.number == _.selectedAyah
                                            ? Colors.grey[300]
                                            : null,
                                  ),
                                  children: [
                                    WidgetSpan(
                                      alignment: PlaceholderAlignment.bottom,
                                      child: WidgetSpanWrapper(
                                        key: nextKey(),
                                        child: AyahNumberWidget(
                                          number: item.numberInSurah,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                      ],
                    ),
                    softWrap: true,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.justify,
                    style: Get.textTheme.headline6?.copyWith(
                      height: 2.6,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Quran",
                    ),
                  ),
                );
                // return RichText(
                //   text: TextSpan(
                //     text: "",
                //     style: Get.textTheme.headline6!.copyWith(
                //       height: 2.6,
                //       fontWeight: FontWeight.normal,
                //       fontFamily: "Quran",
                //     ),
                //     children: _.surah!.ayahs!.map((item) {
                //       if (item.text
                //           .contains('بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ')) {
                //         return TextSpan(
                //             text:
                //                 " ${item.text.replaceFirst('بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ', '')} ",
                //             children: [
                //               TextSpan(
                //                 text: getVerseEndSymbol(item.numberInSurah),
                //                 style: TextStyle(
                //                   fontFamily: DefaultTextStyle.of(context)
                //                       .style
                //                       .fontFamily,
                //                   fontSize: 27,
                //                   color: Get.theme.colorScheme.primary,
                //                 ),
                //               ),
                //             ]);
                //       }

                //       return TextSpan(
                //         text: " ${item.text} ",
                //         recognizer: LongPressGestureRecognizer()
                //           ..onLongPress = () {
                //             controller.ayahAction(
                //                 item, _.scrollController.offset);
                //           },
                //         style: TextStyle(
                //           backgroundColor: item.number == _.selectedAyah
                //               ? Colors.grey[300]
                //               : null,
                //         ),
                //         children: [
                //           TextSpan(
                //             text: getVerseEndSymbol(item.numberInSurah),
                //             style: TextStyle(
                //               fontFamily:
                //                   DefaultTextStyle.of(context).style.fontFamily,
                //               fontSize: 27,
                //               color: Get.theme.colorScheme.primary,
                //             ),
                //           ),
                //         ],
                //       );
                //     }).toList(),
                //   ),
                //   textAlign: TextAlign.justify,
                //   textDirection: TextDirection.rtl,
                // );
              },
            ),
          )
        ],
      ),
    );
  }
}
