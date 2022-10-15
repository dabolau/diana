import 'package:get/get.dart';

import '../controllers/getpassword_controller.dart';

class GetpasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetpasswordController>(
      () => GetpasswordController(),
    );
  }
}
