import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbars_history'.tr),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'texts_history'.tr,
        ),
      ),
    );
  }
}
