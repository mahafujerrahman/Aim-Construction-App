import 'package:aim_construction_app/app/modules/bottom_menu/manager_bottom_menu..dart';
import 'package:aim_construction_app/app/modules/bottom_menu/supervisor_bottom_menu..dart';
import 'package:aim_construction_app/app/modules/role/supervisor/homeScreen/views/widget/projectCard.dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/common/widgets/custom_text_field.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ManagerHomeScreen extends StatefulWidget {
  ManagerHomeScreen({super.key});

  @override
  State<ManagerHomeScreen> createState() => _ManagerHomeScreenState();
}

class _ManagerHomeScreenState extends State<ManagerHomeScreen> {
TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ManagerBottomMenu(0),
      appBar: AppBar(
        title: const Text('Manager Project'),
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
                controller: textEditingController,
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
                        onTap: () {
                          Get.toNamed(AppRoutes.managerProjectToolsScreen);
                          print('Project tapped');
                        },
                        imageUrl: 'assets/image/workImage.jpg',
                        title: 'Sample project',
                        projectID: '12345',

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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed(AppRoutes.projectCreateScreen);
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
