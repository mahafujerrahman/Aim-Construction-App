import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoleSupervisorDailyLogView extends StatelessWidget {
  const RoleSupervisorDailyLogView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Name'),
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

