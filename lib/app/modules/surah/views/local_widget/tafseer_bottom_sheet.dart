import '../../../../../index.dart';

class TafseerBottomSheet extends StatelessWidget {
  final String text;
  const TafseerBottomSheet({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
        bottom: 8.h,
        top: 4.h,
        right: 5.w,
        left: 5.w,
      ),
      child: Text(text),
    );
  }
}
