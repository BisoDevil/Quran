import 'package:quran/app/global/widget/khatma_widget.dart';

import '../../../../index.dart';
import '../controllers/quran_index_controller.dart';

class QuranIndexView extends GetView<QuranIndexController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).quran),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          KhatmaWidget(percent: .3, info: "info"),
          Center(
            child: Text(
              'QuranIndexView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
