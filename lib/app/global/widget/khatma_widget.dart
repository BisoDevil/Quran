import 'package:quran/app/util/widget_util.dart';

import '../../../index.dart';

class KhatmaWidget extends StatelessWidget {
  const KhatmaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 224, 190, 163),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Container(
        height: 20.h,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    addVerticalSpace(1),
                    Text(
                      "Khatma",
                      style: Get.textTheme.headline4!.copyWith(
                          color: Colors.brown[800],
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Last read ins",
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: LinearProgressIndicator(
                              value: .3,
                              minHeight: 8,
                            ),
                          ),
                        ),
                        addHorizontalSpace(1),
                        Text(
                          '30 %',
                          style: Get.textTheme.bodyText2?.copyWith(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Image.asset(
                "assets/icons/quran.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
