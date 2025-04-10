import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class TaskStatusScreen extends StatefulWidget {
  const TaskStatusScreen({Key? key}) : super(key: key);

  @override
  _TaskStatusScreenState createState() => _TaskStatusScreenState();
}

class _TaskStatusScreenState extends State<TaskStatusScreen> {
  final List<String> _taskStatus = ['Open', 'Complete'];
  String? _selectedStatus;

  List<Map<String, dynamic>> groupedFiles = [
    {
      'files': [
        'building_structure_2025.pdf',
        'building_structure_2025.pdf',
        'building_structure_2025.xlsx',
      ],
    }
  ];

  List<Map<String, dynamic>> images = [
    {
      'images': [
        'assets/image/workImage.jpg',
        'assets/image/work1.jpg',
        'assets/image/work2.jpg',
        'assets/image/work3.jpg',
        'assets/image/workImage.jpg',
        'assets/image/workImage.jpg',
        'assets/image/work4.jpg',
      ],
    },
  ];

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
      appBar: AppBar(
        title: Text(
          'Project Name',
          style: AppStyles.fontSize18(fontWeight: FontWeight.w600, color: AppColors.color323B4A),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text('Task', style: AppStyles.fontSize20(fontWeight: FontWeight.w600, color: AppColors.color323B4A)),
              ),

              // Task Status
              Text('Task status', style: AppStyles.fontSize16(color: AppColors.color323B4A)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: InputDecorator(
                  decoration: InputDecoration(
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.color323B4A, width: 1.w),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.color323B4A, width: 1.w),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.color323B4A, width: 1.w),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedStatus,
                      isExpanded: true,
                      style: AppStyles.fontSize18(color: AppColors.blackColor),
                      hint: Text('Select'),
                      icon: SvgPicture.asset(AppIcons.arrowRight, width: 16.w, color: AppColors.color323B4A),
                      items: _taskStatus.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedStatus = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // Due Date
              Text('Due date', style: AppStyles.fontSize16(color: AppColors.color323B4A)),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.calender),
                  SizedBox(width: 8),
                  Text('Tuesday, 25 February, 2025', style: AppStyles.fontSize16(color: AppColors.color323B4A)),
                ],
              ),

              SizedBox(height: 20.h),

              // Description
              Text('Description', style: AppStyles.fontSize16(color: AppColors.color323B4A)),
              SizedBox(height: 12.h),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.color5F6774),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Description is a detailed explanation or portrayal of something specific.'),
                ),
              ),

              SizedBox(height: 20.h),

              // Attachments
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppIcons.attachmentIcon, height: 20.h, width: 14.w),
                    SizedBox(width: 8.w),
                    Text('Attachment', style: AppStyles.fontSize16(color: AppColors.color323B4A)),
                  ],
                ),
              ),

              // Display Images
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: images[0]['images'].length, // Access the correct images list
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      images[0]['images'][index], // Access the images list correctly
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),

              // Display Files
              Column(
                children: groupedFiles.map((group) {
                  return Column(
                    children: List.generate(group['files'].length, (index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.r),
                            child: Row(
                              children: [
                                getFileIcon(group['files'][index]),
                                SizedBox(width: 8.w),
                                Text(group['files'][index]),
                              ],
                            ),
                          ),
                          SvgPicture.asset(AppIcons.downloadIcon),
                        ],
                      );
                    }),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
