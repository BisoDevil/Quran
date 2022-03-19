import 'package:get/get.dart';
import 'package:quran/app/data/providers/doaa_provider.dart';

class DoaaController extends GetxController {
  final DoaaProvider _doaaProvider = Get.find<DoaaProvider>();

  List<String> doaa = [];
  @override
  void onInit() {
    doaa = _doaaProvider.getDoaa();
    super.onInit();
  }
}
