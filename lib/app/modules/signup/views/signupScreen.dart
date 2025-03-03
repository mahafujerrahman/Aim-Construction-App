import 'dart:io';
import 'package:aim_construction_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/common/custom_text/custom_text.dart';
import 'package:aim_construction_app/common/widgets/custom_button.dart';
import 'package:aim_construction_app/common/widgets/custom_text_field.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:aim_construction_app/utils/app_string.dart';
import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  Uint8List? _image;
  File? selectedImage;
  bool isChecked = false;
  bool isSupervisorSelected = false;
  final SignupController signupController = Get.put(SignupController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Sign Up to Join', style: AppStyles.fontSize18(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //==================== Full Name ====================
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextField(
                        filColor: AppColors.fillUpColor,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AppIcons.profileIcon, color: AppColors.primaryColor),
                        ),
                        hintText: AppString.fullName.tr,
                        controller: signupController.signUpFullNameCtrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextField(
                        filColor: AppColors.fillUpColor,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AppIcons.profileIcon, color: AppColors.primaryColor),
                        ),
                        hintText: 'Last Name',
                        controller: signupController.signUpPassCtrl),
                  ),

                  //==================== Email ==========================
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextField(
                        filColor: AppColors.white,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AppIcons.emailIcon, color: AppColors.primaryColor),
                        ),
                        hintText: 'Enter Email Address',
                        controller: signupController.signUpEmailCtrl),
                  ),
/*
                  //==================== Company Name ====================
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextField(
                        filColor: AppColors.fillUpColor,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AppIcons.companyIcon, color: AppColors.primaryColor),
                        ),
                        hintText: 'Enter Company Name',
                        controller: signupController.signUpCompanyCtrl),
                  ),*/

                  //==================== Role Selection ====================
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 60.h,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: AppColors.fillUpColor,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.primaryColor, width: 1),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: Row(
                          children: [
                            SvgPicture.asset(AppIcons.emailIcon,color: AppColors.primaryColor),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Obx(() {
                                return DropdownButton<String>(
                                  value: signupController.selectedRole.isEmpty ? null : signupController.selectedRole.value,
                                  borderRadius: BorderRadius.circular(8.r),
                                  hint: Text(
                                    signupController.selectedRole.isEmpty ? "Select Role" : signupController.selectedRole.value,
                                    style: AppStyles.fontSize16(color: AppColors.blackColor),
                                  ),
                                  icon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.primaryColor),
                                  ),
                                  isExpanded: true,
                                  items: signupController.userRole.map((role) {
                                    return DropdownMenuItem<String>(
                                      value: role,
                                      child: Text(
                                        role,
                                        style: AppStyles.fontSize18(color: AppColors.blackColor),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newRole) {
                                    signupController.selectedRole.value = newRole ?? '';
                                    setState(() {
                                      isSupervisorSelected = newRole == "Project Supervisor";
                                    });
                                  },
                                );
                              }),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  //==================== Selected Manager ====================
                  if (isSupervisorSelected)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        height: 60.h,
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        decoration: BoxDecoration(
                          color: AppColors.fillUpColor,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: AppColors.primaryColor, width: 1),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: Row(
                            children: [
                              SvgPicture.asset(AppIcons.emailIcon,color: AppColors.primaryColor),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Obx(() {
                                  return DropdownButton<String>(
                                    value: signupController.selectedManagerRole.isEmpty ? null : signupController.selectedManagerRole.value,
                                    borderRadius: BorderRadius.circular(8.r),
                                    hint: Text(
                                      signupController.selectedManagerRole.isEmpty ? "Select Manager" : signupController.selectedManagerRole.value,
                                      style: AppStyles.fontSize16(color: AppColors.blackColor),
                                    ),
                                    icon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.primaryColor),
                                    ),
                                    isExpanded: true,
                                    items: signupController.managerRole.map((role) {
                                      return DropdownMenuItem<String>(
                                        value: role,
                                        child: Text(
                                          role,
                                          style: AppStyles.fontSize18(color: AppColors.blackColor),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (newRole) {
                                      signupController.selectedManagerRole.value = newRole ?? '';
                                    },
                                  );
                                }),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),

                  //==================== Password & Confirm Password ====================
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextField(
                      filColor: AppColors.white,
                      isPassword: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(AppIcons.lockIcon, color: AppColors.primaryColor),
                      ),
                      hintText: AppString.enterPasswordText.tr,
                      controller: signupController.signUpPassCtrl,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextField(
                      filColor: AppColors.fillUpColor,
                      isPassword: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(AppIcons.lockIcon, color: AppColors.primaryColor),
                      ),
                      hintText: AppString.enterConfirmPasswordText.tr,
                      controller: signupController.signUpConfrimPassCtrl,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Confirm password";
                        } else if (value != signupController.signUpPassCtrl.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),

                  _checkboxSection(),

                  //==================== Sign Up Button ====================
                  SizedBox(height: 16.h),
                  CustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {

                      }
                    },
                    text: AppString.signUpText.tr,
                  ),
                  SizedBox(height: 10.h),

                  //==================== Already Have Account ====================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: AppString.alreadyHaveAccount.tr,
                        fontWeight: FontWeight.w400,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.SIGN_IN);
                        },
                        child: CustomText(
                          text: AppString.signInText.tr,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _checkboxSection() {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          activeColor: AppColors.primaryColor,
          focusColor: AppColors.greyColor,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
          side: BorderSide(color: AppColors.primaryColor, width: 1.w),
        ),
        Text.rich(
          maxLines: 2,
          TextSpan(
            text: AppString.byCreating.tr,
            style: TextStyle(fontSize: 14.w, fontWeight: FontWeight.w500,color: AppColors.color878787),
            children: [
              TextSpan(
                text: AppString.termsConditions.tr,
                style: TextStyle(color: AppColors.primaryColor, fontSize: 14.w, fontWeight: FontWeight.w500),
                recognizer: TapGestureRecognizer()..onTap = () {
                    // Handle terms and conditions
                  },
              ),
              const TextSpan(text: ' & '),
              TextSpan(
                text: AppString.privacyPolicy.tr,
                style: TextStyle(color: AppColors.primaryColor, fontSize: 14.w, fontWeight: FontWeight.w500),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Handle privacy policy
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
