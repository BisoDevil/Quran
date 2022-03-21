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
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(
                svgPath,
                height: 48,
                alignment: Alignment.topLeft,
                width: 48,
              ),
              Spacer(),
              Text(
                title,
                style: Get.textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
