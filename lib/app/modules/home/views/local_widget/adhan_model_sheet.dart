import 'package:quran/app/data/models/adhan_time_model.dart';
import 'package:intl/intl.dart';
import '../../../../../index.dart';

class AdhanModelSheet extends StatelessWidget {
  final AdhanTime adhanTime;
  final _df = DateFormat('hh:mm a');
  AdhanModelSheet({Key? key, required this.adhanTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 6.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              S.of(context).fajr,
              style: Get.textTheme.headline6,
            ),
            trailing: Text(_df.format(adhanTime.fajr)),
          ),
          Divider(),
          ListTile(
            title: Text(
              S.of(context).dhuhr,
              style: Get.textTheme.headline6,
            ),
            trailing: Text(_df.format(adhanTime.dhuhr)),
          ),
          Divider(),
          ListTile(
            title: Text(
              S.of(context).asr,
              style: Get.textTheme.headline6,
            ),
            trailing: Text(_df.format(adhanTime.asr)),
          ),
          Divider(),
          ListTile(
            title: Text(
              S.of(context).maghrib,
              style: Get.textTheme.headline6,
            ),
            trailing: Text(_df.format(adhanTime.maghrib)),
          ),
          Divider(),
          ListTile(
            title: Text(
              S.of(context).isha,
              style: Get.textTheme.headline6,
            ),
            trailing: Text(_df.format(adhanTime.isha)),
          ),
        ],
      ),
    );
  }
}
