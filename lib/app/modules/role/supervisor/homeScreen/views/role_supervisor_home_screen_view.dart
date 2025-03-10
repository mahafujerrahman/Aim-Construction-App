import 'package:aim_construction_app/app/modules/bottom_menu/supervisor_bottom_menu..dart';
import 'package:aim_construction_app/app/modules/role/supervisor/homeScreen/controllers/role_supervisor_home_screen_controller.dart';
import 'package:aim_construction_app/app/modules/role/supervisor/homeScreen/views/widget/projectCard.dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SupervisorHomeScreenView extends StatelessWidget {
  SupervisorHomeScreenView({super.key});

  final RoleSupervisorHomeScreenController roleSupervisorHomeScreenController = Get.put(RoleSupervisorHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SupervisorBottomMenu(0),
      appBar: AppBar(
        title: const Text('Project'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: roleSupervisorHomeScreenController.textEditingController,
                hintText: "Search Project",
              ),
              SizedBox(height: 16.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ProjectCard(
                        imageUrl: 'assets/image/workImage.jpg',
                        title: 'Sample project',
                        projectID: '12345',
                        onTap: () {
                          Get.toNamed(AppRoutes.ROLE_SUPERVISOR_PROJECT_TOOL);
                          print('Project tapped');
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
      ),
    );
  }
}
