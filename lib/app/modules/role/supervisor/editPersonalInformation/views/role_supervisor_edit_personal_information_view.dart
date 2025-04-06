import 'dart:io';

import 'package:aim_construction_app/common/custom_text/custom_text.dart';
import 'package:aim_construction_app/common/widgets/custom_button.dart';
import 'package:aim_construction_app/common/widgets/custom_text_field.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:aim_construction_app/utils/app_string.dart';
import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';



class EditPersonalInformationScreen extends StatefulWidget {
  const EditPersonalInformationScreen({super.key});

  @override
  State<EditPersonalInformationScreen> createState() => _EditPersonalInformationScreenState();
}

class _EditPersonalInformationScreenState extends State<EditPersonalInformationScreen> {

  TextEditingController nameCTRl = TextEditingController();
  TextEditingController emailCTRl = TextEditingController();
  TextEditingController phoneCTRl = TextEditingController();
  TextEditingController birthdayCTRl = TextEditingController();
  TextEditingController addressCTRl = TextEditingController();
  Uint8List? _image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(AppString.editPersonalInfo.tr,
          style: AppStyles.fontSize18(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height :102.h,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(8.r))
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            // Profile picture
                            _image != null
                                ? Padding(
                              padding:  EdgeInsets.all(8.0.r),
                              child: Container(
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(width: 1.w, color: AppColors.white),
                                      image: DecorationImage(
                                          image: MemoryImage(_image!),
                                          fit: BoxFit.cover))),
                            ) : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                ),
                                child: Image.network(
                                  'http://www.clker.com/cliparts/Z/J/g/U/V/b/avatar-male-silhouette-md.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 35,
                              child: GestureDetector(
                                onTap: () {
                                  showImagePickerOption(context);
                                },
                                child: Icon(Icons.image_outlined,size: 25,color: AppColors.white,),
                              ),
                            ),

                          ],
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
                //============================> Name List Tile <=================
                CustomTextField(
                  controller: nameCTRl,
                  hintText: AppString.enterName.tr,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppIcons.profileIcon,color: AppColors.primaryColor,height: 20.h,width: 20.w),
                  ),
                ),
                SizedBox(height: 16.h),
                //============================> Chat History List Tile <=================
                CustomTextField(
                  controller: emailCTRl,
                  hintText:  AppString.enterEmail.tr,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppIcons.emailIcon,color: AppColors.primaryColor,height: 20.h,width: 20.w),
                  ),
                ),
                SizedBox(height: 16.h),

                //============================> Settings List Tile <=================
                CustomTextField(
                  controller: phoneCTRl,
                  hintText: AppString.enterPhone.tr,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppIcons.phoneIcon,color: AppColors.primaryColor,height: 20.h,width: 20.w),
                  ),
                ),
                SizedBox(height: 16.h),
                //============================> BirthDay List Tile <=================
                CustomTextField(
                  controller: birthdayCTRl,
                  hintText: AppString.enterBirthday.tr,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppIcons.birthday,color: AppColors.primaryColor,height: 20.h,width: 20.w),
                  ),
                ),
                SizedBox(height: 16.h),
                //============================> Address List Tile <=================
                CustomTextField(
                  controller: addressCTRl,
                  hintText: AppString.enterAddress.tr,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppIcons.location,color: AppColors.primaryColor,height: 20.h,width: 20.w),
                  ),
                ),

                SizedBox(height: 50.h),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    onTap: () {
                     // Get.toNamed(AppRoutes.greatFullScreen);
                    },
                    text: AppString.updateText.tr,
                  ),
                ),
              ]
          ),
        ),
      ),
    );
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
}