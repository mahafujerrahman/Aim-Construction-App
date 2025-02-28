import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/common/widgets/custom_button.dart';
import 'package:aim_construction_app/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project'),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                  controller: homeController.textEditingController),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
