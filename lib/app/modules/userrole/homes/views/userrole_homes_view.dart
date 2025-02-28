import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/userrole_homes_controller.dart';

class UserroleHomesView extends GetView<UserroleHomesController> {
  const UserroleHomesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserroleHomesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UserroleHomesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
