import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/userrole_set_controller.dart';

class UserroleSetView extends GetView<UserroleSetController> {
  const UserroleSetView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserroleSetView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UserroleSetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
