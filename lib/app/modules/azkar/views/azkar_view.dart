import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran/app/util/widget_util.dart';
import 'package:quran/generated/l10n.dart';

import '../controllers/azkar_controller.dart';

class AzkarView extends GetView<AzkarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
      ),
      body: GetBuilder<AzkarController>(
        builder: (_) {
          return ListView(
            padding: EdgeInsets.all(8),
            children: _.azkar
                .map(
                  (e) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          e.zekr,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (e.bless.isNotEmpty) Divider(),
                            if (e.bless.isNotEmpty)
                              Text(
                                e.bless,
                              ),
                            addVerticalSpace(1),
                            Text(
                              S.of(context).repeatTimes(e.repeat),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
