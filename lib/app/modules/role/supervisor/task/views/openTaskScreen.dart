import 'package:aim_construction_app/app/controller/projectTask_controller.dart';
import 'package:aim_construction_app/app/modules/role/supervisor/task/views/taskCard.dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SupervisorOpenTaskScreen extends StatefulWidget {
  SupervisorOpenTaskScreen({super.key});

  @override
  State<SupervisorOpenTaskScreen> createState() => _SupervisorOpenTaskScreenState();
}

class _SupervisorOpenTaskScreenState extends State<SupervisorOpenTaskScreen> {

  final ProjectTaskController projectTaskController = Get.put(ProjectTaskController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      projectTaskController.getAllProjectTaskDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap :(){
                          Get.toNamed(AppRoutes.taskStatusScreen);
                        },
                        child: TaskCard(
                          noteText: "This note structure ensures clear communication of the day's",
                          doumentCount: 1,
                          imageCount : 1,
                          authorName: "Billal",
                          date: "25 February, 2025",
                          onTap: () {
                            print('Card tapped');
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
