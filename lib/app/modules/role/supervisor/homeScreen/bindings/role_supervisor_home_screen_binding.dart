import 'package:get/get.dart';

import '../controllers/role_supervisor_home_screen_controller.dart';

class RoleSupervisorHomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoleSupervisorHomeScreenController>(() => RoleSupervisorHomeScreenController(),
    );
  }
}
