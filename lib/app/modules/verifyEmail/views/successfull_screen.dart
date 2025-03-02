import 'package:aim_construction_app/common/app_color/app_colors.dart';
import 'package:aim_construction_app/common/app_icons/app_icons.dart';
import 'package:aim_construction_app/common/app_text_style/style.dart';
import 'package:aim_construction_app/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SuccessfullScreen extends StatefulWidget {
  const SuccessfullScreen({super.key});

  @override
  State<SuccessfullScreen> createState() => _SuccessfullScreenState();
}

class _SuccessfullScreenState extends State<SuccessfullScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            SvgPicture.asset(AppIcons.gelaryIcon),
            Text('Successfully verified',style: AppStyles.fontSize18(fontWeight: FontWeight.w700)),
            SizedBox(height: 16.h),
            Text('You can now login to your account & start your journey',style: AppStyles.fontSize18(fontWeight: FontWeight.w700,color: AppColors.color878787)),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                onTap: () {
                 // Get.toNamed(AppRoutes.signInScreen);
                },
                text: 'Login'
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
