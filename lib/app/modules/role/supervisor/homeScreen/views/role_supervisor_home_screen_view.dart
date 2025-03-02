import 'package:aim_construction_app/app/modules/bottom_menu/bottom_menu..dart';
import 'package:aim_construction_app/app/modules/role/supervisor/homeScreen/controllers/role_supervisor_home_screen_controller.dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/common/widgets/custom_button.dart';
import 'package:aim_construction_app/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupervisorHomeScreenView extends StatelessWidget {
   SupervisorHomeScreenView({super.key});
   final RoleSupervisorHomeScreenController roleSupervisorHomeScreenController = Get.put(RoleSupervisorHomeScreenController());

   @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomMenu(0),
      appBar: AppBar(
        title: const Text('Project'),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: CustomTextField(
                  controller: roleSupervisorHomeScreenController.textEditingController),
            ),
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: CustomButton(
                  onTap: (){
                    Get.toNamed(AppRoutes.SIGN_IN);
                  }, text: 'Home'),
            )
          ],
        ),
      ),
    );
  }
}
