import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/surah_controller.dart';

class SurahView extends GetView<SurahController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.surahName.value,
          ),
        ),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<SurahController>(
        builder: (_) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _.fullSurah,
              style: Get.textTheme.headline6!.copyWith(
                height: 2,
              ),

              // softWrap: true,
              // textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
            ),
          );
        },
      ),
    );
  }
}
