import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran/generated/l10n.dart';

import '../controllers/doaa_controller.dart';

class DoaaView extends GetView<DoaaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).doaaFromSunna,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(4),
        itemCount: controller.doaa.length,
        itemBuilder: (context, index) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                controller.doaa[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
