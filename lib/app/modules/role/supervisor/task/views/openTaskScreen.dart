import 'package:aim_construction_app/app/modules/role/supervisor/task/views/taskCard.dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SupervisorOpenTaskScreen extends StatelessWidget {
  SupervisorOpenTaskScreen({super.key});


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
                          attachmentCount: 1,
                          commentCount: 1,
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
