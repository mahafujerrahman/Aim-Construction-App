import 'package:aim_construction_app/app/controller/image_and_document_controller.dart';
import 'package:aim_construction_app/common/prefs_helper/prefs_helpers.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_constant.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';


class ProjectSupervisorDoumentScreen extends StatefulWidget {
  const ProjectSupervisorDoumentScreen({super.key});

  @override
  State<ProjectSupervisorDoumentScreen> createState() => _ProjectSupervisorDoumentScreenState();
}

class _ProjectSupervisorDoumentScreenState extends State<ProjectSupervisorDoumentScreen> {
  final ProjectImageAndDocumentController projectImageAndDocumentController = Get.put(ProjectImageAndDocumentController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var projectId = await PrefsHelper.getString(AppConstants.projectID);
      projectImageAndDocumentController.getAllImageAndDocument(
        projectId: projectId,
        imageOrDocument: 'document',
        uploaderRole: 'projectSupervisor',
      );
    });
  }

  Widget getFileIcon(String fileName) {
    if (fileName.endsWith('.pdf')) {
      return SvgPicture.asset(AppIcons.pdfIcon);
    } else if (fileName.endsWith('.xlsx') || fileName.endsWith('.xls')) {
      return SvgPicture.asset(AppIcons.excelFileIcon,height: 20.h);
    }
    else if (fileName.endsWith('.doc') || fileName.endsWith('.docx')) {
      return SvgPicture.asset(AppIcons.documentsIcon,height: 20.h,color: Colors.black87);
    }
    else {
      return SvgPicture.asset(AppIcons.documentsIcon,height: 20.h,color: Colors.black87);
    }
  }

  Widget getFileName(String imageUrl) {

    final uri = Uri.parse(imageUrl);
    final fileName = uri.pathSegments.isNotEmpty ? uri.pathSegments.last : '';
    return Text(fileName);
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
                  if (projectImageAndDocumentController.isLoading.value) {
                    return Center(
                      child: CupertinoActivityIndicator(
                        radius: 32.r,
                        color: AppColors.primaryColor,
                      ),
                    );
                  }

                  // Show content when loading is complete
                  if (projectImageAndDocumentController.getAllImageAndDocumentModel.isEmpty) {
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
                      children: projectImageAndDocumentController.getAllImageAndDocumentModel.map((group) {
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
                                  final fileUrl = group.attachments?[index].attachment ?? '';
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.r),
                                        child: Row(
                                          children: [
                                            getFileIcon(fileUrl), // Pass correct imageUrl
                                            SizedBox(width: 8.w),
                                            getFileName(fileUrl),
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
}

