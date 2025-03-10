import 'package:get/get.dart';

import '../controllers/role_supervisor_edit_personal_information_controller.dart';

class RoleSupervisorEditPersonalInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoleSupervisorEditPersonalInformationController>(
      () => RoleSupervisorEditPersonalInformationController(),
    );
  }
}
