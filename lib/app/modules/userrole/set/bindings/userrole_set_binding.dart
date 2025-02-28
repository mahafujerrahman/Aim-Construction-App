import 'package:get/get.dart';

import '../controllers/userrole_set_controller.dart';

class UserroleSetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserroleSetController>(
      () => UserroleSetController(),
    );
  }
}
