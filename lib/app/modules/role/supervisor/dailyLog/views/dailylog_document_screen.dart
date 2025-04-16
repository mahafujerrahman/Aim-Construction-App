import 'package:aim_construction_app/app/controller/supervisor_dailyLog_controller.dart';
import 'package:aim_construction_app/common/prefs_helper/prefs_helpers.dart';
import 'package:aim_construction_app/service/fileName.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_constant.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class DailyLogDocumentScreen extends StatefulWidget {
  DailyLogDocumentScreen({super.key});

  @override
  State<DailyLogDocumentScreen> createState() => _DailyLogDocumentScreenState();
}

class _DailyLogDocumentScreenState extends State<DailyLogDocumentScreen> {
  final SupervisorDailyLogController supervisorDailyLogController = Get.put(SupervisorDailyLogController());

  String projectId = '';
  String selectDate = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Loading projectId and image data
  void _loadData() async {
    projectId = await PrefsHelper.getString(AppConstants.projectID);
    setState(() {
      selectDate = supervisorDailyLogController.selectedDate.value;
    });
    _fetchData();
  }

  void _fetchData() {
    supervisorDailyLogController.getAllImageOrDocumentUnderNote(
      projectId: projectId,
      date: selectDate,
      noteOrTaskOrProject: 'note',
      imageOrDocument: 'image',
      uploaderRole: 'projectSupervisor',
    );
  }

  // Function to get the appropriate icon based on file extension
  Widget getFileIcon(String fileName) {
    if (fileName.endsWith('.pdf')) {
      return SvgPicture.asset(AppIcons.pdfIcon);
    } else if (fileName.endsWith('.xlsx')) {
      return SvgPicture.asset(AppIcons.excelFileIcon);
    } else {
      return SvgPicture.asset(AppIcons.documentsIcon);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
              children:[
                Obx(() {
                  if (supervisorDailyLogController.isLoading.value) {
                    return Center(
                      child: CupertinoActivityIndicator(
                        radius: 32.r,
                        color: AppColors.primaryColor,
                      ),
                    );
                  }

                  // Show content when loading is complete
                  if (supervisorDailyLogController.getAllImageOrDocumentUnderNoteModel.isEmpty) {
                    return Center(
                      child: Text(
                        'No Document available',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.color323B4A,
                        ),
                      ),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: supervisorDailyLogController.getAllImageOrDocumentUnderNoteModel.map((group) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  group.date ?? '',
                                  style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.color323B4A),
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: group.attachments?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final imageUrl = group.attachments?[index].attachment ?? '';
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.r),
                                        child: Row(
                                          children: [
                                            FileUtils.getFileIcon(imageUrl), // Pass correct imageUrl
                                            SizedBox(width: 8.w),
                                            FileUtils.getFileName(imageUrl),
                                          ],
                                        ),
                                      ),
                                      SvgPicture.asset(AppIcons.downloadIcon),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  }
                }),
              ]
          ),
        ),
      ),
    );
  }
  void _showTakeDocumentDialog() {
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
              children: [
                Text(
                  "Add a attachment",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.h),
                TextButton(
                  onPressed: () {
                  // //Navigator.of(context).pop();
                  },
                  child: Text("Select file"),
                ),
                SizedBox(height: 8.h),
                TextButton(
                  onPressed: () {
                   //    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
