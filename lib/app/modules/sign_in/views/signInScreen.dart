import 'package:aim_construction_app/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/common/app_color/app_colors.dart';
import 'package:aim_construction_app/common/app_icons/app_icons.dart';
import 'package:aim_construction_app/common/app_text_style/style.dart';
import 'package:aim_construction_app/common/custom_text/custom_text.dart';
import 'package:aim_construction_app/common/widgets/custom_button.dart';
import 'package:aim_construction_app/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../../common/app_string/app_string.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController signInController = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text("Sign In",style: AppStyles.fontSize18()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              // Text sections

              SizedBox(height: 20.h),
              CustomTextField(
                  filColor: AppColors.white,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppIcons.emailIcon),
                  ),
                  hintText: AppString.enterEmailText.tr,
                  controller: signInController.emailCtrl),
              SizedBox(height: 16.h),
              CustomTextField(
                  filColor: AppColors.white,
                  isPassword: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppIcons.lockIcon),
                  ),
                  hintText: AppString.enterPasswordText.tr,
                  controller: signInController.passCtrl),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //=================================> Forgot Password Button <================================
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.FORGET_PASSWORD);
                    },
                    child: CustomText(
                      fontWeight: FontWeight.bold,
                      text: AppString.forgotPassword.tr,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),
              /// Sing In Button
              CustomButton(
                onTap: () {
                //  Get.toNamed(AppRoutes.userHomeScreen);
                },
                text: AppString.signInText.tr,
              ),
              ///==================>> Don't have and Account <===================
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${AppString.doNotHaveAccount.tr}",
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.SIGNUP);
                      },
                      child: CustomText(
                        text: AppString.signUpText.tr,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ))
                ],
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
