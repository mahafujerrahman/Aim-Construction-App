import 'package:aim_construction_app/app/modules/bottom_menu/bottom_menu..dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
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
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          AppString.forgetPassWordText.tr,
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
            Text("Please enter your email address to reset password.",
              style: AppStyles.fontSize16(color: AppColors.color878787),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              filColor: AppColors.fillUpColor,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(AppIcons.emailIcon),
              ),
              hintText: AppString.enterEmailText.tr,
              controller: emailController,
            ),
            SizedBox(height: 100.h),
            CustomButton(
              onTap: () {Get.toNamed(AppRoutes.VERIFY_EMAIL);
              },
              text: AppString.sendOTPText.tr,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
