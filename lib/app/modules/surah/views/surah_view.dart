import 'package:cached_network_image/cached_network_image.dart';
import 'package:quran/app/global/controller/dimension.dart';
import 'package:quran/app/routes/app_pages.dart';
import 'package:quran/app/util/constants.dart';

import 'package:quran/app/util/image_painter.dart';
import 'package:quran/index.dart';

import '../../../util/util_function.dart';
import '../controllers/surah_controller.dart';

class SurahView extends GetView<SurahController> {
  @override
  Widget build(BuildContext context) {
    var loc = Get.find<Dimension>();
    loc.setScreenDimension(context);
    return GetBuilder<SurahController>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.offNamed(Routes.QURAN_INDEX);
                },
                child: Image.asset(
                  'assets/surahs/sname_${controller.currentAya?.sura ?? 1}.png',
                  height: kToolbarHeight * .7,
                  color: Constants.tintColor,
                ),
              ),
              Spacer(),
              Image.asset(
                'assets/images/juz.png',
                height: kToolbarHeight * .45,
                color: Constants.tintColor,
              ),
              Text(
                " ${getVerseEndSymbol(_.currentAya?.juz)} ",
                style: TextStyle(
                  color: Constants.tintColor,
                ),
              ),
              Image.asset(
                'assets/images/hezb.png',
                height: kToolbarHeight * .45,
                color: Constants.tintColor,
              ),
              Text(
                " ${getVerseEndSymbol(_.currentAya?.hezb)} ",
                style: TextStyle(
                  color: Constants.tintColor,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              height: loc.quranScaledHeight,
              child: PageView.builder(
                itemCount: 605,
                controller: _.pageController,
                onPageChanged: _.onPageChanged,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CustomPaint(
                    painter: ImagePainter(
                      endAyaX: _.ayaPaintPoints['endAyaX'] ?? 0,
                      endAyaY: _.ayaPaintPoints['endAyaY'] ?? 0,
                      prevAyaX: _.ayaPaintPoints['prevAyaX'] ?? 0,
                      prevAyaY: _.ayaPaintPoints['prevAyaY'] ?? 0,
                    ),
                    child: GestureDetector(
                      onLongPressEnd: (details) {
                        _.getAyaPaintPoints(
                            details.localPosition.dx, details.localPosition.dy);
                      },
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://hquran.net/quran/hafs/imagesv2/$index.png",
                        placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                          strokeWidth: 1,
                        )),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  );
                },
              ),
            ),
            Slider(
              value: _.index.toDouble(),
              min: 1,
              max: 605,
              divisions: 605,
              label: _.index.toString(),
              onChangeEnd: (d) {
                _.index = d.toInt();
                _.pageController.animateToPage(_.index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              onChanged: (d) {
                _.index = d.toInt();
                _.update();
              },
            ),
          ],
        ),
      );
    });
  }
}
