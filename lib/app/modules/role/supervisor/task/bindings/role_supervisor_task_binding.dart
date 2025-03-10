import 'package:get/get.dart';

import '../controllers/role_supervisor_task_controller.dart';

class RoleSupervisorTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoleSupervisorTaskController>(
      () => RoleSupervisorTaskController(),
    );
  }
}
