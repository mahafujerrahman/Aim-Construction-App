import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/role_supervisor_task_controller.dart';

class RoleSupervisorTaskView extends GetView<RoleSupervisorTaskController> {
  const RoleSupervisorTaskView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RoleSupervisorTaskView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RoleSupervisorTaskView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
