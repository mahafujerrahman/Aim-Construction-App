import 'dart:io';
import 'package:aim_construction_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/common/app_color/app_colors.dart';
import 'package:aim_construction_app/common/app_icons/app_icons.dart';
import 'package:aim_construction_app/common/app_string/app_string.dart';
import 'package:aim_construction_app/common/app_text_style/style.dart';
import 'package:aim_construction_app/common/custom_text/custom_text.dart';
import 'package:aim_construction_app/common/widgets/custom_button.dart';
import 'package:aim_construction_app/common/widgets/custom_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Uint8List? _image;
  File? selectedImage;
  bool isChecked = false;
  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
         'Sign Up to Join',
          style: AppStyles.fontSize18(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w,),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text sections
                  Text(
                    AppString.signUpText.tr,
                    style: AppStyles.fontSize16(color: AppColors.blackColor),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 20.h),


                  /* Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Profile picture
                        _image != null
                            ? Container(
                          width: 115.w,
                          height: 115.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2.w, color: AppColors.whiteColor),
                              image: DecorationImage(
                                  image: MemoryImage(_image!),
                                  fit: BoxFit.cover)),
                        )
                            : CircleAvatar(
                            radius: 50,
                            backgroundColor: AppColors.whiteColor,
                            backgroundImage: AssetImage(AppImages.defaultImage)),
                        Positioned(
                          bottom: 0,
                          right: 5,
                          child: GestureDetector(
                            onTap: () {
                              showImagePickerOption(context);
                            },
                            child: Container(
                              height: 25.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                color: AppColors.color1E66CA,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.add,size: 20,color: AppColors.whiteColor,),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),*/
                  ///============================> Full Name List Tile <=================
                  SizedBox(height: 16.h),
                  CustomTextField(
                      prefixIcon: SvgPicture.asset(AppIcons.profileIcon),
                      hintText: AppString.fullName.tr,
                      controller: signupController.signUpFullNameCtrl),
                  SizedBox(height: 16.h),
                  ///============================> Email List Tile <=================
                  CustomTextField(
                      prefixIcon: SvgPicture.asset(AppIcons.massageIcon),
                      hintText: AppString.enterEmailText.tr,
                      controller: signupController.signUpEmailCtrl),
                  SizedBox(height: 16.h),
                  /*///============================> Birthday List Tile <=================
                  BorderlessCustomTextField(
                    onTab: (){
                      _pickBirthDate(context);
                    },
                    keyboardType: TextInputType.datetime,
                    readOnly: true,
                    suffixIcons: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                      child: const Icon(Icons.calendar_month_sharp),
                    ),
                    controller: _authController.signUpBirthday,
                    hintText: AppStrings.enterBirthday.tr,
                    prefixIcon: SvgPicture.asset(AppIcons.birthday,color: AppColors.iconGrayColor,height: 20.h,width: 20.w),
                  ),
                  SizedBox(height: 16.h),
                  ///============================> Address List Tile <=================
                  BorderlessCustomTextField(
                    controller: _authController.signUpAddressCtrl,
                    hintText: AppStrings.enterAddress.tr,
                    prefixIcon: SvgPicture.asset(AppIcons.location,color: AppColors.iconGrayColor,height: 20.h,width: 20.w),
                  ),*/
                  ///============================> Password List Tile <=================
                 CustomTextField(
                      isPassword: true,
                      prefixIcon: SvgPicture.asset(AppIcons.lockIcon),
                      hintText: AppString.enterPasswordText.tr,
                      controller: signupController.signUpPassCtrl),

                  ///============================> Confirm Password List Tile <=================
                  SizedBox(height: 16.h),
                 CustomTextField(
                    isPassword: true,
                    prefixIcon: SvgPicture.asset(AppIcons.lockIcon),
                    hintText: AppString.enterConfirmPasswordText.tr,
                    controller: signupController.signUpConfrimPassCtrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Confirm password";
                      }
                      else if(value !=signupController.signUpPassCtrl.text){
                        return 'Passwords do not match';
                      }
                      return null;
                    },),

                  SizedBox(height: 16.h),
                  _checkboxSection(),


                  /// =================>>>>> Sign Up Button
                  SizedBox(height: 16.h),
                  CustomButton(
                    onTap: () {},
                    text: AppString.signUpText.tr,
                  ),
                  SizedBox(height: 10.h),

                  ///=================>>>>> Have Account Row
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
                            color: AppColors.secondatyColor,
                            fontWeight: FontWeight.w600,
                          ))
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

  //==========================> Show Calender Function <=======================
  Future<void> _pickBirthDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(3050),
    );
    if (pickedDate != null) {
      setState(() {
        signupController.signUpBirthday.text = "${pickedDate.month}-${pickedDate.day}-${pickedDate.year}";
      });
    }
  }

  //==================================> ShowImagePickerOption Function <===============================
  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: AppColors.white,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 50.w,
                              color: AppColors.primaryColor,
                            ),
                            CustomText(text: AppString.galleryText.tr)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(Icons.camera_alt,
                                size: 50.w, color: AppColors.primaryColor),
                            CustomText(text:  AppString.cameraText.tr)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
  //==================================> Gallery <===============================
  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Get.back();
  }
//==================================> Camera <===============================
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Get.back();
  }
  //==========================> Checkbox Section Widget <=======================
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
          side: BorderSide(
            color: isChecked ? AppColors.primaryColor : AppColors.primaryColor,
            width: 1.w,
          ),
        ),
        Text.rich(
          maxLines: 2,
          TextSpan(
            text: AppString.byCreating.tr,
            style: TextStyle(fontSize: 14.w, fontWeight: FontWeight.w500),
            children: [
              TextSpan(
                text: AppString.termsConditions.tr,
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14.w,
                    fontWeight: FontWeight.w500),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Get.toNamed(AppRoutes.termsConditionScreen);
                  },
              ),
              const TextSpan(text: ' & '),
              TextSpan(
                text: AppString.privacyPolicy.tr,
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14.w,
                    fontWeight: FontWeight.w500),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Get.toNamed(AppRoutes.privacyPolicyScreen);
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }

}