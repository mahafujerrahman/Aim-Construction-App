import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/role_supervisor_more_controller.dart';

class SupervisorMoreView extends GetView<RoleSupervisorMoreController> {
  const SupervisorMoreView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SupervisorMoreView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SupervisorMoreView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
