import '../../../../../index.dart';

class OptionWidget extends StatelessWidget {
  final String title;
  final String svgPath;

  const OptionWidget({Key? key, required this.title, required this.svgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              svgPath,
              height: 35,
              alignment: Alignment.topLeft,
              width: 35,
            ),
            Spacer(),
            Text(
              title,
              style: Get.textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
