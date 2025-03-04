import 'package:get/get.dart';

import '../controllers/role_supervisor_activity_screen_controller.dart';

class RoleSupervisorActivityScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoleSupervisorActivityScreenController>(
      () => RoleSupervisorActivityScreenController(),
    );
  }
}
