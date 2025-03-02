import 'package:get/get.dart';

import '../controllers/role_supervisor_more_controller.dart';

class RoleSupervisorMoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoleSupervisorMoreController>(
      () => RoleSupervisorMoreController(),
    );
  }
}
