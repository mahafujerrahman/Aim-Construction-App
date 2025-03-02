import 'dart:async';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      Get.offAllNamed(AppRoutes.onboardingScreen);
    });
    super.initState();
    StreamSubscription;
    //  getConnectivity();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 200.h),
                Container(
                  height: 300.h,
                  width: 345.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24.r)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.r),
                    child: Image.network(
                      'https://img.freepik.com/free-photo/construction-site-silhouettes_1127-3253.jpg?uid=R185017981&ga=GA1.1.2010102622.1725357692&semt=ais_hybrid',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                // Text sections
                Center(
                  child: Text(
                    "Aim Construction",
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
