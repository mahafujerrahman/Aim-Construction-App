import 'package:get/get.dart';

import '../controllers/role_supervisor_documents_controller.dart';

class RoleSupervisorDocumentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoleSupervisorDocumentsController>(
      () => RoleSupervisorDocumentsController(),
    );
  }
}
