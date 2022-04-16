import 'package:get_storage/get_storage.dart';
import 'package:quran/app/modules/home/controllers/home_controller.dart';
import 'package:quran/app/modules/surah/controllers/surah_controller.dart';
import 'package:quran/app/modules/surah/views/local_widget/tafseer_bottom_sheet.dart';
import 'package:share/share.dart';

import '../../../../../index.dart';
import '../../../../global/controller/dimension.dart';

class PopupMenu {
  final double itemWidth = Get.find<Dimension>().deviceWidth * .75;
  final double itemHeight = 7.h;
  final double arrowHeight = Get.find<Dimension>().deviceHeight * .01;
  late OverlayEntry _entry;
  late Offset _offset;
  late VoidCallback dismissCallback;

  late Rect _showRect;
  final bool _isDown = true;

  bool _isShow = false;
  bool get isShow => _isShow;
  bool _isPrev = false;
  double _op = 0;

  void show({
    required Rect rect,
    required bool isPrev,
  }) {
    _isPrev = isPrev;

    _showRect = rect;
    // dismissCallback = dismissCallback;

    _offset = _calculateOffset(Get.overlayContext!);

    _entry = OverlayEntry(builder: (context) {
      return buildPopupMenuLayout(_offset);
    });

    Overlay.of(Get.overlayContext!)!.insert(_entry);
    _isShow = true;
    Future.delayed(Duration(milliseconds: 20), () {
      _entry.markNeedsBuild();
      _op = 1;
    });
  }

  static Rect getWidgetGlobalRect(GlobalKey key) {
    RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);
    return Rect.fromLTWH(
        offset.dx, offset.dy, renderBox.size.width, renderBox.size.height);
  }

  void dismiss() {
    if (_isShow) {
      _op = 0;
      _entry.markNeedsBuild();
      Future.delayed(Duration(milliseconds: 500), () {
        _entry.remove();
      });
      _isShow = false;
    }
  }

  void fastDismiss() {
    _entry.remove();

    _isShow = false;
  }

  Offset _calculateOffset(BuildContext context) {
    double dx;
    double dy = _showRect.top - itemHeight;
    if (_showRect.left < Get.find<Dimension>().deviceWidth * .4) {
      dx = Get.find<Dimension>().deviceWidth * .37;
      if (Get.find<Dimension>().deviceWidth > 600) {
        dx = Get.find<Dimension>().deviceWidth * .25;
      }
    } else if (_showRect.left > Get.find<Dimension>().deviceWidth * .6) {
      dx = Get.find<Dimension>().deviceWidth * .1;
    } else {
      dx = Get.find<Dimension>().deviceWidth * .22;
    }
    return Offset(dx, dy);
  }

//  "notes_dialog": "Notes",
//     "tafseer_dialog": "Explain",
//     "listen_dialog": "Listen",
//     "add_fav": "Add",
//     "fasil_dialog": "Bookmark",
//     "share_dialog": "Share",
  LayoutBuilder buildPopupMenuLayout(Offset offset) {
    return LayoutBuilder(builder: (context, constraints) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            // width: Get.find<Dimension>().quranScaledWidth,
            height: Get.find<Dimension>().quranScaledHeight,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                dismiss();
              },
              child: Stack(
                children: <Widget>[
                  // triangle arrow
                  // if (!_isPrev)
                  //   Positioned(
                  //     left: _showRect.left + _showRect.width / 2.0 - 7.5,
                  //     top: _isDown
                  //         ? offset.dy -
                  //             Get.find<Dimension>().deviceHeight * .01 +
                  //             Get.find<Dimension>().deviceHeight * .1
                  //         : offset.dy - arrowHeight + offset.dy,
                  //     child: CustomPaint(
                  //       size: Size(Get.find<Dimension>().deviceWidth * .05,
                  //           arrowHeight),
                  //       painter: TrianglePainter(
                  //           isDown: !_isDown,
                  //           color: colorPrimary.withOpacity(.9)),
                  //     ),
                  //   ),
                  // menu content
                  Positioned(
                    right: offset.dx,
                    top: !_isPrev
                        ? _isDown
                            ? (offset.dy < 0 ? 50 : offset.dy) +
                                Get.find<Dimension>().deviceHeight * .1
                            : (offset.dy < 0 ? 50 : offset.dy) +
                                (offset.dy < 0 ? 50 : offset.dy)
                        : (offset.dy < 0 ? 50 : offset.dy) -
                            Get.find<Dimension>().deviceHeight * .03,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 500),
                      opacity: _op,
                      child: Container(
                        width: 45.w,
                        height: itemHeight,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                width: 40.w,
                                height: itemHeight,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        dismiss();
                                        final GetStorage _box =
                                            Get.find<GetStorage>();
                                        await _box.write(
                                            "khatma",
                                            Get.find<SurahController>()
                                                .currentAya
                                                .page);
                                        await _box.write(
                                            "surahName",
                                            Get.find<SurahController>()
                                                .currentAya
                                                .surahName);
                                        Get.find<HomeController>().getData();
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.bookmark_add_outlined),
                                          Text(
                                            S.of(context).bookmark,
                                            style:
                                                Get.textTheme.caption!.copyWith(
                                              color:
                                                  Get.theme.colorScheme.primary,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        var text = Get.find<SurahController>()
                                            .currentAya
                                            .text;
                                        await Share.share(text);
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.share),
                                          Text(
                                            S.of(context).share,
                                            style:
                                                Get.textTheme.caption!.copyWith(
                                              color:
                                                  Get.theme.colorScheme.primary,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        var text = Get.find<SurahController>()
                                            .currentAya
                                            .tafseer;
                                        Get.bottomSheet(TafseerBottomSheet(
                                          text: text,
                                        ));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.inbox_rounded),
                                          Text(
                                            S.of(context).explaination,
                                            style:
                                                Get.textTheme.caption!.copyWith(
                                              color:
                                                  Get.theme.colorScheme.primary,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ].reversed.toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
