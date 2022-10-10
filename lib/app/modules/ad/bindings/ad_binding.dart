import 'package:get/get.dart';

import '../controllers/ad_controller.dart';

class AdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdController>(
      () => AdController(),
    );
  }
}
