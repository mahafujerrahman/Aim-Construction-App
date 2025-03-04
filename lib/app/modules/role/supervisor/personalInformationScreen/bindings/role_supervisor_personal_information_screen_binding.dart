import 'package:get/get.dart';

import '../controllers/role_supervisor_personal_information_screen_controller.dart';

class RoleSupervisorPersonalInformationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoleSupervisorPersonalInformationScreenController>(
      () => RoleSupervisorPersonalInformationScreenController(),
    );
  }
}
