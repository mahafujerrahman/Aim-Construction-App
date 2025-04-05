import 'package:aim_construction_app/app/controller/project_controller.dart';
import 'package:aim_construction_app/app/data/api_constants.dart';
import 'package:aim_construction_app/app/modules/bottom_menu/supervisor_bottom_menu..dart';
import 'package:aim_construction_app/app/modules/role/supervisor/homeScreen/controllers/role_supervisor_home_screen_controller.dart';
import 'package:aim_construction_app/app/modules/role/supervisor/homeScreen/views/widget/projectCard.dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/common/prefs_helper/prefs_helpers.dart';
import 'package:aim_construction_app/common/widgets/custom_text_field.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_constant.dart';
import 'package:aim_construction_app/utils/app_images.dart';
import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SupervisorHomeScreenView extends StatefulWidget {
  SupervisorHomeScreenView({super.key});

  @override
  State<SupervisorHomeScreenView> createState() => _SupervisorHomeScreenViewState();
}

class _SupervisorHomeScreenViewState extends State<SupervisorHomeScreenView> {
  final RoleSupervisorHomeScreenController roleSupervisorHomeScreenController = Get.put(RoleSupervisorHomeScreenController());
  final ProjectController projectController = Get.put(ProjectController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      var userId = await PrefsHelper.getString(AppConstants.userId);
      projectController.getAllProjectDetails(projectManager: userId);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SupervisorBottomMenu(0),
      appBar: AppBar(
        title: const Text('Manager Project'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Obx(()
    {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Always display the search field
              CustomTextField(
                controller: roleSupervisorHomeScreenController.textEditingController,
                hintText: "Search Project",
              ),
              SizedBox(height: 16.h),

              if (projectController.isLoading.value)
                Center(
                  child: CupertinoActivityIndicator(
                      radius: 32.r, color: AppColors.primaryColor),)
              else
                if (projectController.projectDetailsModel.value.isEmpty)
                // Show message when no projects are available
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppImage.noData, height: 200.h),
                        Padding(
                          padding: EdgeInsets.all(12.r),
                          child: Text(
                            'No project available now.',
                            style: AppStyles.fontSize20(color: AppColors
                                .hintColor),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                // Show the project list when data is available
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: projectController.projectDetailsModel.value
                        .length,
                    itemBuilder: (context, index) {
                      final projectDetails = projectController
                          .projectDetailsModel.value[index];
                      return Column(
                        children: [
                          ProjectCard(
                            onTap: () {
                              Get.toNamed(AppRoutes.managerProjectToolsScreen);
                            },
                            imageUrl: "${ApiConstants
                                .imageBaseUrl}${projectDetails.projectLogo ??
                                ''}",
                            title: '${projectDetails.projectName}',
                            projectID: '${projectDetails.projectId}',
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
    }),
    );
  }
}