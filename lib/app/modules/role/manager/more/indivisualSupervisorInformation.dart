import 'package:aim_construction_app/app/modules/bottom_menu/manager_bottom_menu..dart';
import 'package:aim_construction_app/app/modules/bottom_menu/supervisor_bottom_menu..dart';
import 'package:aim_construction_app/app/modules/role/supervisor/more/controllers/role_supervisor_more_controller.dart';
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


class IndivitualSupervisorInfoScreen extends StatefulWidget {
  const IndivitualSupervisorInfoScreen({super.key});

  @override
  State<IndivitualSupervisorInfoScreen> createState() => _IndivitualSupervisorInfoScreenState();
}

class _IndivitualSupervisorInfoScreenState extends State<IndivitualSupervisorInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Supervisor Profile',
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
                                CustomText(text: '123456789',color: Colors.white,fontSize:14.sp),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    //============================> Name List Tile <=================
                    CustomListTile(
                      title:'Md. Maruf',
                      prefixIcon: SvgPicture.asset(AppIcons.profileIcon,color: AppColors.primaryColor,height: 20.h,width: 20.w),
                    ),
                    SizedBox(height: 8.h),
                    //============================> Project Supervisor List Tile <=================
                    CustomListTile(
                      title:'Project Supervisor',
                      prefixIcon: SvgPicture.asset(AppIcons.profileIcon,color: AppColors.primaryColor,height: 20.h,width: 20.w),
                    ),
                    SizedBox(height: 8.h),
                    //============================> Email List Tile <=================
                    CustomListTile(
                      title:'email@gmail.com',
                      prefixIcon: SvgPicture.asset(AppIcons.emailIcon,color: AppColors.primaryColor,height: 20.h,width: 20.w),
                    ),
                    SizedBox(height: 8.h),
                    //============================> Phone List Tile <=================
                    CustomListTile(
                      title:'+880753456789',
                      prefixIcon: SvgPicture.asset(AppIcons.phoneIcon,color: AppColors.primaryColor,height: 20.h,width: 20.w),
                    )
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
