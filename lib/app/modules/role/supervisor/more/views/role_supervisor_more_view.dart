import 'package:aim_construction_app/app/modules/bottom_menu/supervisor_bottom_menu..dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/common/custom_text/custom_text.dart';
import 'package:aim_construction_app/common/widgets/custom_listTile.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:aim_construction_app/utils/app_string.dart';
import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/role_supervisor_more_controller.dart';

class SupervisorMoreView extends GetView<RoleSupervisorMoreController> {
  const SupervisorMoreView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const SupervisorBottomMenu(2),
      appBar: AppBar(
        title: Text(AppString.profileText.tr,
          style: AppStyles.fontSize18(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height : 102.h,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(8.r))
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:  EdgeInsets.all(8.0.r),
                            child: Container(
                              width: 80.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8.r))
                              ),
                              child: Image.asset(
                                'assets/image/workImage.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(text: 'rahman munna',color: Colors.white,fontSize:24.sp ,),
                                CustomText(text: 'rahmanmunna@gmail.com',color: Colors.white,fontSize:14.sp),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    //============================> PersonalInfo List Tile <=================
                    CustomListTile(
                      onTap: () {
                        Get.toNamed(AppRoutes.ROLE_SUPERVISOR_PERSONAL_INFORMATION_SCREEN);
                      },
                      title:AppString.personalInfo.tr,
                      prefixIcon: SvgPicture.asset(AppIcons.profileIcon,color: AppColors.primaryColor,height: 20.h,width: 20.w),
                    ),
                    SizedBox(height: 8.h),
                    //============================> Settings List Tile <=================
                    CustomListTile(
                      onTap: () {
                        Get.toNamed(AppRoutes.settingScreen);
                      },
                      title:AppString.settings.tr,
                      prefixIcon: SvgPicture.asset(AppIcons.settingIcon,color: AppColors.primaryColor,height: 20.h,width: 20.w),
                    ),
                    SizedBox(height: 8.h),
                    //============================> LogOut List Tile <=================
                    CustomListTile(
                      onTap: () {
                        _showCustomBottomSheet(context);
                      },
                      title:AppString.logout.tr,
                      prefixIcon: SvgPicture.asset(AppIcons.logout,height: 20.h,width: 20.w),
                    )
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
  //=========================>>>>>  Log out Custom BottomSheet    <<<================================
  void _showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            color: AppColors.white,
          ),
          height: 265.h,
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              Divider(thickness: 1, color: AppColors.greyColor),
              SizedBox(height: 20.h),
              Text(AppString.logout, style: AppStyles.fontSize24(color: AppColors.primaryColor,fontWeight: FontWeight.w600),),
              SizedBox(height: 14.h),
              Text(AppString.sureLogoutText.tr,
                style: AppStyles.fontSize18(color: AppColors.primaryColor),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 58),
                        backgroundColor:  AppColors.fillColor,
                        side: BorderSide(
                            width: 1,
                            color: AppColors.redColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Text(AppString.cancelText.tr,
                        style: AppStyles.fontSize18(color: AppColors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.onboardingScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 58),
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                      child: Text(AppString.yesText.tr,
                        style:  AppStyles.fontSize18(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
