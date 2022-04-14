import '../../index.dart';
import '../global/controller/dimension.dart';

class ImagePainter extends CustomPainter {
  var loc = Get.put(Dimension());

  int endAyaX;
  int endAyaY;
  int prevAyaX;
  int prevAyaY;

  ImagePainter(
      {required this.endAyaX,
      required this.endAyaY,
      required this.prevAyaX,
      required this.prevAyaY});

  @override
  void paint(Canvas canvas, Size size) async {
    //if ((selectedFrame == 0 && locator<MushafPage>().tajweedEnable)) return;
//!!
    /****************************************************
                    * PLEASE DO NOT DELETE ANY COMMENT *
    *****************************************************/
//!!
    // log.w('endAyaY= ${loc.getScaledY(endAyaY, true)}');
    // log.w('prevAyaY= ${loc.getScaledY(prevAyaY, true)}');
    //     log.w('endAyaX= ${loc.getScaledX(endAyaX)}');
    // log.w('prevAyaX= ${loc.getScaledX(prevAyaX)}');

    if (endAyaX == 0) return; //! WE SEND endAyaX WHEN SWIPE PAGE

/********************************************
 * LINE HEIGHT == LOC.GETSCALEDY(40, FALSE) *
 ********************************************/
    final Path path = Path();

    int startLine = 40;
    int endLine = 995;
    int lineHeight = 80;
    int firstLineY = 10;

    //! SEND PREVIOUS AYA 0 WHEN IT'S FIRST AYA
    if (prevAyaX == 0) {
      prevAyaX = endLine;
    }
    if (prevAyaY == 0) {
      prevAyaY = firstLineY;
    }

    // canvas.drawLine(
    //     Offset(loc.getScaledX(endAyaX), loc.getScaledY(55, false)),
    //     Offset(loc.getScaledX(endAyaX), loc.getScaledY(95, false)),
    //     Paint()
    //       ..color = Colors.purple
    //       ..strokeWidth = 10);
    // canvas.drawLine(
    //     Offset(loc.getScaledX(endAyaX), loc.getScaledY(95, false)),
    //     Offset(loc.getScaledX(endAyaX), loc.getScaledY(135, false)),
    //     Paint()
    //       ..color = Colors.red
    //       ..strokeWidth = 10);

//? -----------------------------------------------------------------------------?//

    // DRAWING LINE ACROSS WHOLE PAGE

    // canvas.drawLine(
    //     Offset(loc.getScaledX(300), loc.getScaledY(55, false)),
    //     Offset(loc.getScaledX(300), loc.getScaledY(100, false)),
    //     Paint()
    //       ..color = Colors.indigo
    //       ..strokeWidth = 10);

    // int y = 15;
    // int y2 = 55;
    // const int linesNumber = 15;
    // for (int l = 1; l <= linesNumber; l++) {
    //   y += 40;
    //   y2 += 40;
    //   canvas.drawLine(
    //       Offset(loc.getScaledX(endAyaX), loc.getScaledY(y, false)),
    //       Offset(loc.getScaledX(endAyaX), loc.getScaledY(y2, false)),
    //       Paint()
    //         ..color = Colors.red.withGreen(l * 100)
    //         ..strokeWidth = 40);
    // }

    // PRINTING CIRCLES AROUND AYA

    ///! red points == prev
    ///! purple points == end

    //**************  CIRCLES ABOVE AYA
    //canvas.drawCircle(
    //    Offset(loc.getScaledX(endAyaX),
    //        loc.getScaledY(endAyaY - (endAyaY - prevAyaY), false)),
    //    5,
    //    Paint()..color = Colors.purple.shade900);
    //canvas.drawCircle(
    //    Offset(loc.getScaledX(prevAyaX),
    //        loc.getScaledY(prevAyaY - (endAyaY - prevAyaY), false)),
    //    5,
    //    Paint()..color = Colors.red.shade900);

    //// // CIRCLES UNDER AYA
    //canvas.drawCircle(
    //    Offset(loc.getScaledX(endAyaX),
    //        loc.getScaledY(endAyaY - (endAyaY - prevAyaY), true)),
    //    5,
    //    Paint()..color = Colors.purple);
    //canvas.drawCircle(
    //    Offset(loc.getScaledX(prevAyaX),
    //        loc.getScaledY(prevAyaY - (endAyaY - prevAyaY), true)),
    //    5,
    //    Paint()..color = Colors.red);

//? -----------------------------------------------------------------------------?//

    path.moveTo(
        loc.getScaledX(endAyaX),
        loc.getScaledY(
            endAyaY, true)); //* MOVE STARTING POINT (FROM END AYA NUMBER)

    if ((endAyaY - prevAyaY).abs() > 3) {
      path.lineTo(loc.getScaledX(endLine),
          loc.getScaledY(endAyaY, true)); //* GO TO END OF LINE (Right)

      path.lineTo(loc.getScaledX(endLine),
          loc.getScaledY(prevAyaY, true)); //* UP TO START AYA NUMBER

      path.lineTo(
          loc.getScaledX(prevAyaX),
          loc.getScaledY(
              prevAyaY, true)); //* GO LEFT TO REACH UNDER STARTING AYA NUMBER

      path.lineTo(loc.getScaledX(prevAyaX),
          loc.getScaledY(prevAyaY - lineHeight, true)); //* UP TO ONE LINE EXTRA

      path.lineTo(
          loc.getScaledX(startLine),
          loc.getScaledY(
              prevAyaY - lineHeight, true)); //* GO TO END OF LINE (Left)

      path.lineTo(
          loc.getScaledX(startLine),
          loc.getScaledY(endAyaY - lineHeight,
              true)); //* THEN DOWN TO (END AYA NUMBER - LINE HEIGTH)

      path.lineTo(
          loc.getScaledX(endAyaX),
          loc.getScaledY(
              endAyaY - lineHeight, true)); //* GO RIGHT TO END AYA NUMBER

      path.lineTo(
          loc.getScaledX(endAyaX),
          loc.getScaledY(
              endAyaY, true)); //* GO DOWN TO ENDING POINT TO CLOSE PATH
    }

    //* DRAWING ONE LINE AYA CASE
    else {
      // path.lineTo(loc.getScaledX(prevAyaX),
      //     loc.getScaledY(prevAyaY, true)); //* LINE TO PREVIOUS AYA
      // Adds a rectangle to points
      path.addRect(Rect.fromLTWH(
          loc.getScaledX(endAyaX),
          loc.getScaledY(prevAyaY, false),
          loc.getScaledX(prevAyaX - endAyaX),
          loc.getScaledY(endAyaY, true) - loc.getScaledY(prevAyaY, false)));

      // path.lineTo(loc.getScaledX(endLine), loc.getScaledY(prevAyaY, false));

      // path.quadraticBezierTo(
      //     loc.getScaledX(endAyaX),
      //     loc.getScaledY(prevAyaY, false),
      //     loc.getScaledX(endAyaX),
      //     loc.getScaledY(prevAyaY, false));
    }
    path.close();
    // canvas.drawShadow(mypath, Colors.red.withOpacity(.7), 5,
    //     false);

    canvas.drawShadow(path, Color(0xFFC29B79).withOpacity(.5), 3, true);
  }

  @override
  bool shouldRepaint(ImagePainter oldDelegate) {
    return true;
  }
}
