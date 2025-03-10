import 'package:get/get.dart';

import '../controllers/role_supervisor_daily_log_controller.dart';

class RoleSupervisorDailyLogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoleSupervisorDailyLogController>(
      () => RoleSupervisorDailyLogController(),
    );
  }
}
