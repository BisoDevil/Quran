import 'package:quran/app/util/widget_util.dart';

import '../../../index.dart';

class KhatmaWidget extends StatelessWidget {
  final double percent;
  final String info;
  final VoidCallback? onPressed;

  const KhatmaWidget(
      {Key? key, required this.percent, required this.info, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: info.isEmpty ? null : onPressed,
      child: Card(
        color: Color(0xffE1D3B0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 3,
        child: Container(
          height: 20.h,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      addVerticalSpace(1),
                      Text(
                        S.of(context).khatma,
                        style: Get.textTheme.headline4!.copyWith(
                            color: Colors.brown[800],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        info.isEmpty
                            ? S.of(context).startYoutKhatma
                            : S.of(context).lastReadInfo(info),
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
                                value: percent,
                                minHeight: 8,
                              ),
                            ),
                          ),
                          addHorizontalSpace(1),
                          Text(
                            '${(percent * 100).toStringAsFixed(1)} %',
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
                flex: 3,
                child: Container(
                  transform: Matrix4.translationValues(-5.w, 4.h, 0),
                  child: Image.asset(
                    "assets/icons/quran.png",
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
