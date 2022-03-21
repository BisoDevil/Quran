import '../../../../../index.dart';

class OptionWidget extends StatelessWidget {
  final String title;
  final String svgPath;
  final VoidCallback? onPressed;
  const OptionWidget(
      {Key? key, required this.title, required this.svgPath, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: SvgPicture.asset(
                svgPath,
                height: 30,
                width: 30,
                alignment: Alignment.topRight,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  title,
                  style: Get.textTheme.caption?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
