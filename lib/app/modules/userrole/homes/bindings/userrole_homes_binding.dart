import 'package:get/get.dart';

import '../controllers/userrole_homes_controller.dart';

class UserroleHomesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserroleHomesController>(
      () => UserroleHomesController(),
    );
  }
}
