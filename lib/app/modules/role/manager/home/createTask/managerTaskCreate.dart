import 'package:aim_construction_app/app/controller/project_controller.dart';
import 'package:aim_construction_app/common/widgets/custom_button.dart';
import 'package:aim_construction_app/common/widgets/custom_text_field.dart';
import 'package:aim_construction_app/service/filePicker_service.dart';
import 'package:intl/intl.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../more/controller/profile_more_controller.dart';

class ManagerTaskCreate extends StatefulWidget {
  const ManagerTaskCreate({Key? key}) : super(key: key);

  @override
  _ManagerTaskCreateState createState() => _ManagerTaskCreateState();
}

class _ManagerTaskCreateState extends State<ManagerTaskCreate> {
  final ProfileMoreController profileMoreController = Get.put(ProfileMoreController());
  final ProjectController projectController = Get.put(ProjectController());


  DateTime? selectedDate;

  Widget getFileIcon(String fileName) {
    if (fileName.endsWith('.pdf')) {
      return SvgPicture.asset(AppIcons.pdfIcon);
    } else if (fileName.endsWith('.xlsx')) {
      return SvgPicture.asset(AppIcons.excelFileIcon);
    } else {
      return SvgPicture.asset(AppIcons.documentsIcon);
    }
  }
  
  var parameter = Get.parameters;
  String projectId = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      profileMoreController.getAllSupervisorByManger();
      projectId = parameter['projectId'] ?? '';
      print( "Project Id : $projectId");
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Project Name Manager',
          style: AppStyles.fontSize18(fontWeight: FontWeight.w600, color: AppColors.color323B4A),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text('Assign To', style: AppStyles.fontSize20(fontWeight: FontWeight.w600, color: AppColors.color323B4A)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: InputDecorator(
                  decoration: InputDecoration(
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor, width: 1.w),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor, width: 1.w),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor, width: 1.w),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: Obx(() {
                      return DropdownButton<String>(
                        value: projectController.assignToSupervisor.isEmpty
                            ? null
                            : projectController.assignToSupervisor.value,
                        borderRadius: BorderRadius.circular(8.r),
                        hint: Text(
                          projectController.assignToSupervisor.isEmpty
                              ? "Select Supervisor"
                              : projectController.assignToSupervisor.value,
                          style: AppStyles.fontSize16(color: AppColors.primaryColor),
                        ),
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        isExpanded: true,
                        items: profileMoreController.getAllSupervisorByManagerModel.map((supervisor) {
                          return DropdownMenuItem<String>(
                            value: supervisor.userId,
                            child: Text(
                              '${supervisor.fname} ${supervisor.lname}',
                              style: AppStyles.fontSize18(color: AppColors.blackColor),
                            ),
                          );
                        }).toList(),
                        onChanged: (newRole) {
                          projectController.assignToSupervisor.value = newRole ?? '';
                          print('===========>>Selected Supervisor Id : $newRole');
                        },
                      );
                    }),
                  ),
                ),
              ),

              SizedBox(height: 8.h),
              CustomTextField(
                controller: projectController.taskTitelCTRl,
                hintText: "Type here",

              ),
              SizedBox(height: 8.h),
              // Due Date
              Text('Due date', style: AppStyles.fontSize16(color: AppColors.color323B4A)),
              SizedBox(height: 8.h),
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2201),
                      );

                      if (pickedDate != null && pickedDate != selectedDate) {
                        setState(() {
                          selectedDate = pickedDate;
                          print('===========>>Picked Date : $pickedDate');
                        });
                      }
                    },
                    child: SvgPicture.asset(AppIcons.calender,height: 20.h),
                  ),
                  SizedBox(width: 8),

                  Text(
                    selectedDate == null
                        ? 'Select Date'
                        : DateFormat('EEEE, dd MMMM, yyyy').format(selectedDate!),
                    style: AppStyles.fontSize16(color: AppColors.color323B4A),
                  ),
                ],
              ),


              SizedBox(height: 20.h),

              // Description
              Text('Description', style: AppStyles.fontSize16(color: AppColors.color323B4A)),
              SizedBox(height: 12.h),
              CustomTextField(
                maxLines: 3,
                controller: projectController.taskDescriptionCTRl,
              ),

              SizedBox(height: 20.h),

              // Attachments
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        _showTakeFileDialog();
                      },child: Text('Add Attachment', style: AppStyles.fontSize16(color: AppColors.color323B4A))),
                  ],
                ),
              ),

              Row(
                children: [
                  SvgPicture.asset(AppIcons.attachmentIcon, height: 18.h),
                  SizedBox(width: 4.w),
                  const Text("2"),
                  SizedBox(width: 16.w),
                  SvgPicture.asset(AppIcons.imageIcon, height: 16.h, color: AppColors.color323B4A),
                  SizedBox(width: 4.w),
                  const Text("2"),
                ],
              ),
              SizedBox(height: 20.h),
              CustomButton(onTap: (){
                projectController.managerTaskCreate(
                  projectId: '${parameter['projectId']}'

                );

              }, text: 'Save')

            ],
          ),
        ),
      ),
    );
  }
  void _showTakeFileDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add a attachment",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      Navigator.of(context).pop();
                    },

                    borderRadius: BorderRadius.circular(8.r),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(AppIcons.imageIcon, height: 20,color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "Select Photo",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      Navigator.of(context).pop();
                      String? fileName = await FilePickerService.pickFile();

                      if (fileName != null) {
                        setState(() {

                        });
                      }
                    },

                    borderRadius: BorderRadius.circular(8.r),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(AppIcons.documentsIcon, height: 20,color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "Select File",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
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
  // Function to remove a file with confirmation
  void _removeFile(String fileName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Remove File"),
          content: Text("Are you sure you want to remove this file?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Yes", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
