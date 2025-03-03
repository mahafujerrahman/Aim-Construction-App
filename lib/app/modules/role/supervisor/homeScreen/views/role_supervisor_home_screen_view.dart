import 'package:aim_construction_app/app/modules/bottom_menu/bottom_menu..dart';
import 'package:aim_construction_app/app/modules/role/supervisor/homeScreen/controllers/role_supervisor_home_screen_controller.dart';
import 'package:aim_construction_app/app/modules/role/supervisor/homeScreen/views/widget/projectCard.dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/common/widgets/custom_button.dart';
import 'package:aim_construction_app/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupervisorHomeScreenView extends StatelessWidget {
  SupervisorHomeScreenView({super.key});

  final RoleSupervisorHomeScreenController roleSupervisorHomeScreenController =
  Get.put(RoleSupervisorHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMenu(0),
      appBar: AppBar(
        title: const Text('Project'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Search Field
              CustomTextField(
                controller: roleSupervisorHomeScreenController.textEditingController,
                hintText: "Search Project...",
              ),
              const SizedBox(height: 16),

              // ✅ List of Project Cards
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
