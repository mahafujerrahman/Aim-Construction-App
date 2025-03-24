import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:aim_construction_app/common/custom_text/custom_text.dart';
import 'package:aim_construction_app/common/widgets/custom_button.dart';
import 'package:aim_construction_app/common/widgets/custom_text_field.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/style.dart';

class ProjectCreateScreen extends StatefulWidget {
  @override
  _ProjectCreateScreenState createState() => _ProjectCreateScreenState();
}

class _ProjectCreateScreenState extends State<ProjectCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  List<String> userRole = ['Default template', 'Project Manager', 'Project Supervisor'];
  RxString selectedRole = ''.obs;
  Uint8List? _profileImage;
  File? _selectedProfileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Project', style: AppStyles.fontSize18()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    _profileImage != null
                        ? Padding(
                            padding: EdgeInsets.all(8.r),
                            child: Container(
                              height: 200.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  width: 1.w,
                                  color: AppColors.white,
                                ),
                                image: DecorationImage(
                                  image: MemoryImage(_profileImage!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            height: 200.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/image/work1.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                    Positioned(
                      bottom: 30,
                      right: 180,
                      child: GestureDetector(
                        onTap: () {
                          showImagePickerOption(context);
                        },
                        child: Icon(
                          Icons.image_outlined,
                          size: 25,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: projectNameController,
                hintText: 'Project Name',
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: streetAddressController,
                hintText: 'Street Address',
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: cityController,
                hintText: 'City',
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: zipCodeController,
                hintText: 'Zip Code',
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: countryController,
                hintText: 'Country',
              ),
              SizedBox(height: 20),
              Text('Project Deadline'),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: startDateController,
                      hintText: 'Start Date',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      controller: endDateController,
                      hintText: 'End Date',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Assign Supervisor',
                  border: OutlineInputBorder(),
                ),
                items: [
                  'Shohan Hossion (Own CEO)',
                  'Supervisor 2',
                  'Supervisor 3'
                ].map((supervisor) {
                  return DropdownMenuItem<String>(
                    value: supervisor,
                    child: Text(supervisor),
                  );
                }).toList(),
                onChanged: (value) {
                  // Handle supervisor selection
                },
              ),
              SizedBox(height: 16),
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
                        Expanded(
                          child: Obx(() {
                            return DropdownButton<String>(
                              value: selectedRole.value.isEmpty
                                  ? null
                                  : selectedRole.value,
                              borderRadius: BorderRadius.circular(8.r),
                              hint: Text(
                                selectedRole.isEmpty
                                    ? "Select Template"
                                    : selectedRole.value,
                                style: AppStyles.fontSize16(color: AppColors.blackColor),
                              ),
                              icon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              isExpanded: true,
                              items: userRole.map((role) {
                                return DropdownMenuItem<String>(
                                  value: role == 'Project Manager'
                                      ? 'projectManager'
                                      : 'projectSupervisor',
                                  child: Text(
                                    role,
                                    style: AppStyles.fontSize18(color: AppColors.blackColor),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newRole) {
                                selectedRole.value = newRole!;
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              CustomButton(
                onTap: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    // Process the data (e.g., send to API)
                    print('Project Created');
                  }
                },
                text: 'Create Project',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Show image picker option
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
                // Gallery Option
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          size: 50.w,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(height: 8.h),
                        CustomText(text: 'Gallery'),
                      ],
                    ),
                  ),
                ),
                // Camera Option
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromCamera();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 50.w,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(height: 8.h),
                        CustomText(text: 'Camera'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Pick image function
  Future<void> _pickImage(ImageSource source) async {
    final returnImage = await ImagePicker().pickImage(source: source);
    if (returnImage == null) return;

    setState(() {
      _selectedProfileImage = File(returnImage.path);
      _profileImage = File(returnImage.path).readAsBytesSync();
    });
    Get.back();
  }

  // Pick image from gallery
  Future<void> _pickImageFromGallery() async {
    await _pickImage(ImageSource.gallery);
  }

  // Pick image from camera
  Future<void> _pickImageFromCamera() async {
    await _pickImage(ImageSource.camera);
  }
}
