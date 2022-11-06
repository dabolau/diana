import 'package:get/get.dart';

import '../controllers/type_controller.dart';

class TypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TypeController>(
      () => TypeController(),
    );
  }
}
