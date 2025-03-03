import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../utils/app_colors.dart';
import '../controllers/role_supervisor_project_tool_controller.dart';

class RoleSupervisorProjectToolView extends GetView<RoleSupervisorProjectToolController> {
  const RoleSupervisorProjectToolView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tools = [
      {'icon': Icons.dashboard, 'label': 'Daily logs'},
      {'icon': Icons.task_alt, 'label': 'Task'},
      {'icon': Icons.image, 'label': 'Image'},
      {'icon': Icons.insert_drive_file, 'label': 'Document'},

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Project'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Project Tool",
              style: AppStyles.fontSize16(color: AppColors.color323B4A,fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 16.h),

            // GridView inside Expanded to allow scrolling
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: .8,
                ),
                itemCount: tools.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                        },
                        child: Container(
                          width: 73.w,
                          height: 73.h,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: Icon(
                              tools[index]['icon'],
                              size: 40.r,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        tools[index]['label'],
                        style:AppStyles.fontSize14(color: AppColors.color323B4A),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
