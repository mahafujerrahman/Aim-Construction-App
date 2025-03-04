import 'package:aim_construction_app/common/widgets/custom_button.dart';
import 'package:aim_construction_app/common/widgets/custom_text_field.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:aim_construction_app/utils/app_string.dart';
import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          AppString.changePasswordText.tr,
          style: AppStyles.fontSize18(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
           CustomTextField(
              isPassword: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(AppIcons.lockIcon,color: AppColors.primaryColor),
              ),
              hintText: AppString.currentPasswordText.tr,
              controller: emailController,
            ),
            SizedBox(height: 20.h),
           CustomTextField(
              isPassword: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(AppIcons.lockIcon,color: AppColors.primaryColor),
              ),
              hintText: AppString.newPasswordText.tr,
              controller: emailController,
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              isPassword: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(AppIcons.lockIcon,color: AppColors.primaryColor),
              ),
              hintText: AppString.confrimNewPasswordText.tr,
              controller: emailController,
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                onTap: () {
                 // Get.toNamed(AppRoutes.verifyCodeScreen);
                },
                text: AppString.updatePasswordText.tr,
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
