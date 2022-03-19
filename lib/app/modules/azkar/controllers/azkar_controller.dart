import 'package:quran/app/data/models/azkar_model.dart';
import 'package:quran/app/data/providers/azkar_provider.dart';

import '../../../../index.dart';

class AzkarController extends GetxController {
  final AzkarProvider _azkarProvider = Get.find<AzkarProvider>();
  List<Azkar> azkar = [];
  var title = "".obs;
  @override
  void onInit() {
    _getAzkar();
    super.onInit();
  }

  _getAzkar() async {
    var shift = Get.arguments;
    if (shift == 'morning') {
      title.value = S.current.azkarAlsabah;
      azkar = await _azkarProvider.getMorningAzkar();
    } else {
      title.value = S.current.azkarAlmasa;
      azkar = await _azkarProvider.getNightAzkar();
    }
    update();
  }
}
