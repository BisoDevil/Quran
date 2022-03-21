import 'package:share/share.dart';

import '../../../../../index.dart';

class ActionDialog extends StatelessWidget {
  final String text;
  final VoidCallback onBookmarkPressed;
  const ActionDialog(
      {Key? key, required this.text, required this.onBookmarkPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          // height: 25.h,
          width: 90.w,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: Text(
                  text,
                  style: Get.textTheme.button,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.share,
                  color: Get.theme.colorScheme.primary,
                ),
                title: Text(S.of(context).share),
                onTap: () async {
                  Get.back();
                  await Share.share(text);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.bookmark_add_outlined,
                  color: Get.theme.colorScheme.primary,
                ),
                onTap: () {
                  Get.back();
                  onBookmarkPressed();
                },
                title: Text(S.of(context).bookmark),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
