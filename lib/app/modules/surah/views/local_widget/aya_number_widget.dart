import 'package:quran/app/util/util_function.dart';

import '../../../../../index.dart';

class AyahNumberWidget extends StatelessWidget {
  final int number;
  const AyahNumberWidget({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/aya_icon.svg',
          height: 36,
        ),
        Text(
          getVerseEndSymbol(number),
          style: Get.textTheme.caption!.copyWith(
            fontWeight: FontWeight.bold,
            // fontSize: 9,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class WidgetSpanWrapper extends StatefulWidget {
  const WidgetSpanWrapper({required Key key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  WidgetSpanWrapperState createState() => WidgetSpanWrapperState();
}

class WidgetSpanWrapperState extends State<WidgetSpanWrapper> {
  Offset offset = Offset.zero;

  void updateXOffset(double xOffset) {
    setState(() {
      offset = Offset(xOffset, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: widget.child,
    );
  }
}
