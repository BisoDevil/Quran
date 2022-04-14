// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class Dimension {
  late double _deviceHeight;
  late double _deviceWidth;
  static const int QURAN_WIDTH_HAFS = 622;
  static const int QURAN_HEIGHT_HAFS = 917;
  static const int QURAN_WIDTH_HAFSV2 = 1024;
  static const int QURAN_HEIGHT_HAFSV2 = 1656;
  static const int QURAN_WIDTH_WARSH = 620;
  static const int QURAN_HEIGHT_WARSH = 1005;
  late double _quranScaledWidth;
  late double _quranScaledHeight;
  late double _quranScaleFactor;
  late Orientation _deviceOrientaion;

  Orientation? get deviceOrientaion => _deviceOrientaion;
  Matrix4 disableFramMatrixPortrait = Matrix4.identity();
  Matrix4 disableFramMatrixLandscape = Matrix4.identity();
  Matrix4 disableFramMatrixWarshPortrait = Matrix4.identity();
  Matrix4 disableFramMatrixWarshLandscape = Matrix4.identity();
  double get deviceHeight => _deviceHeight;
  double get deviceWidth => _deviceWidth;
  double get quranScaledWidth => _quranScaledWidth;
  double get quranScaledHeight => _quranScaledHeight;
  double get quranScaleFactor => _quranScaleFactor;

  static double xfactor = 1.367;
  static double xoffset = 7.0;
  static double yfactor = 1.349;
  static double yoffset = 17.723;
  static double withHeightFactor = 40;

  double getScaledY(int y, bool withHeight) {
    return (yfactor * y - yoffset) * quranScaleFactor +
        (withHeight ? withHeightFactor * quranScaleFactor : 0);
  }

  double toOriginalImageY(int y) {
    return (y + yoffset) / (quranScaleFactor * yfactor);
  }

  double getScaledX(int x) {
    return (xfactor * x - xoffset) * quranScaleFactor;
  }

  double toOriginalImageX(int x) {
    return (x + xoffset) / (quranScaleFactor * xfactor);
  }

  setScreenDimension(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    // log.i('DEvicePixelRatio = ${MediaQuery.of(context).devicePixelRatio}');
    // log.i('Device Height = ${MediaQuery.of(context).size.height}');
    // log.i('Device Width = ${MediaQuery.of(context).size.width}');
    _deviceOrientaion = MediaQuery.of(context).orientation;
    scaleQuranImage();
    disableFramMatrixPortrait = Matrix4.fromList([
      1.22,
      0.0,
      0.0,
      0.0,
      0.0,
      1.125,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      1.0
    ]);
    disableFramMatrixWarshPortrait = Matrix4.fromList([
      1.118,
      0.0,
      0.0,
      0.0,
      0.0,
      1.082,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      1.0
    ]);
    disableFramMatrixWarshLandscape = Matrix4.fromList([
      1.128,
      0.0,
      0.0,
      0.0,
      0.0,
      1.082,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      1.0
    ]);
    disableFramMatrixLandscape = Matrix4.fromList([
      1.18,
      0.0,
      0.0,
      0.0,
      0.0,
      1.125,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0,
      0,
      0.0,
      1.0
    ]);
  }

  scaleQuranImage() {
    xfactor = 1.367;
    xoffset = 7.0;
    yfactor = 1.349;
    yoffset = 17.723;
    withHeightFactor = 40;
    //* FIT IMAGE WIDTH
    int quranWidth = QURAN_WIDTH_HAFS;
    int quranHeight = QURAN_HEIGHT_HAFS;

    xfactor = 1;
    xoffset = 0;
    yfactor = 1.0125;
    yoffset = 0;
    withHeightFactor = 55;
    quranWidth = QURAN_WIDTH_HAFSV2;
    quranHeight = QURAN_HEIGHT_HAFSV2;

    if (quranWidth != _deviceWidth) {
      _quranScaleFactor = _deviceWidth / quranWidth;
      _quranScaledWidth = _deviceWidth;
      _quranScaledHeight = quranHeight * _quranScaleFactor;
    } else {
      // hasan: the app crashes on iPad 12.9" because `_quranScaledHeight` is null
      // temp solution to set a positive number to avoid the crash
      _quranScaledHeight = 1.0;
    }

    //* FIT LINE HEIGHT IF DEVICE HEIGHT > IMAGE HEIGHT
    double dummyHeight = _deviceHeight - (2.1 * AppBar().preferredSize.height);
    if (deviceOrientaion == Orientation.portrait &&
        _quranScaledHeight > dummyHeight) {
      double ratioEdit = (dummyHeight) / _quranScaledHeight;
      _quranScaleFactor *= ratioEdit;
      _quranScaledHeight = (dummyHeight);
      _quranScaledWidth *= ratioEdit;
    }
    // _quranScaledHeight =
    //     _quranScaledHeight - (1.8 * AppBar().preferredSize.height);
  }
}
