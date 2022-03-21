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
          height: 33,
        ),
        Text(
          number.toString(),
          style: Get.textTheme.caption!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 9,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
