import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/base/pin_code_text_field.dart';
import 'package:aim_construction_app/common/custom_text/custom_text.dart';
import 'package:aim_construction_app/common/widgets/custom_button.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_string.dart';
import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          AppString.verifyEmail.tr,
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
            Text(
              'We have sent a verification code to your email. Please check your email and enter the code. ',
              style: AppStyles.fontSize16(color: AppColors.color878787),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 30.h),
            CustomPinCodeTextField(),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppString.didNotGetCode.tr,
                  color: AppColors.color878787,
                ),
                //=====================> Resend Text Button <=================
                InkWell(
                  onTap: () {},
                  child: CustomText(
                    text: AppString.resend.tr,
                    fontSize: 16.sp,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 100.h),
            CustomButton(
              onTap: () {
               Get.toNamed(AppRoutes.successfullScreen);
              },
              text: AppString.verifyEmail.tr,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
