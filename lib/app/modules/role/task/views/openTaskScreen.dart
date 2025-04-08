import 'package:aim_construction_app/app/controller/projectTask_controller.dart';
import 'package:aim_construction_app/app/modules/role/task/views/taskCard.dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/common/helper/time_formate.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_images.dart';
import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/cupertino.dart';
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
      projectTaskController.getAllProjectTaskDetails(task_status: 'open');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        return  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                if (projectTaskController.isLoading.value)
                  Center(
                    child: CupertinoActivityIndicator(radius: 32.r, color: AppColors.primaryColor),)
                else if (projectTaskController.projectTaskDetailsModel.value.isEmpty)
                // Show message when no projects are available
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppImage.noData,height: 200.h),
                        Padding(
                          padding: EdgeInsets.all(12.r),
                          child: Text(
                            'No project task available now.',
                            style: AppStyles.fontSize20(color: AppColors.hintColor),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: projectTaskController.projectTaskDetailsModel.value.length,
                    itemBuilder: (context, index) {
                      final projectTaskDetails = projectTaskController.projectTaskDetailsModel.value[index];
                      return Column(
                        children: [
                          TaskCard(
                            noteText: projectTaskDetails.title ?? '',
                            doumentCount: projectTaskDetails.documentCount ?? 0,
                            imageCount: projectTaskDetails.imageCount ?? 0,
                            authorName: projectTaskDetails.assignedTo?.fname ?? '',
                            date: '${TimeFormatHelper.formatDate(DateTime.parse(projectTaskDetails.createdAt.toString()))}',
                            onTap: () {
                              print('Card tapped');
                            },
                          ),
                          const SizedBox(height: 16),
                        ],
                      );
                    },
                  ),
              ],
            ),
          ),
        );
      }
      ),
    );
  }
}
