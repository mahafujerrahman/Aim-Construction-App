import 'package:aim_construction_app/app/modules/role/supervisor/projectTool/views/toolsCard.dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ManagerProjectToolsScreen extends StatefulWidget {
  const ManagerProjectToolsScreen({super.key});

  @override
  State<ManagerProjectToolsScreen> createState() =>
      _ManagerProjectToolsScreenState();
}

class _ManagerProjectToolsScreenState extends State<ManagerProjectToolsScreen> {
  @override
  Widget build(BuildContext context) {
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
              style: AppStyles.fontSize16(
                  color: AppColors.color323B4A, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 16.h),
            // Wrap the GridView.builder with Expanded or Flexible
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0.w,
                  mainAxisSpacing: 30.h,
                ),
                itemCount: 5, // The total number of tools
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: ToolsCard(
                        title: 'Daily Logs',
                        icon: AppIcons.daliyLogs,
                        onTap: () {
                          Get.toNamed(AppRoutes.managerDailyLogScreen);
                        },
                      ),
                    );
                  } else if (index == 1) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: ToolsCard(
                        title: 'Task',
                        icon: AppIcons.taskIcon,
                        onTap: () {
                          Get.toNamed(AppRoutes.ROLE_SUPERVISOR_TASK);
                        },
                      ),
                    );
                  } else if (index == 2) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: ToolsCard(
                        title: 'Image',
                        icon: AppIcons.imageIcon,
                        onTap: () {
                          Get.toNamed(AppRoutes.ROLE_SUPERVISOR_IMAGES);
                        },
                      ),
                    );
                  } else if (index == 3) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: ToolsCard(
                        title: 'Document',
                        icon: AppIcons.documentsIcon,
                        onTap: () {
                          Get.toNamed(AppRoutes.supervisorDocuments);
                        },
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: ToolsCard(
                        title: 'Contract',
                        icon: AppIcons.contractIcon,
                        onTap: () {
                          Get.toNamed(AppRoutes.managerContactScreen);
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

