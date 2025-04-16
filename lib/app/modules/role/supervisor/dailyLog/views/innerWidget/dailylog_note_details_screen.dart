import 'package:aim_construction_app/app/controller/projectNote_controller.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DailyNoteDetailsScreen extends StatefulWidget {
  @override
  State<DailyNoteDetailsScreen> createState() => _DailyNoteDetailsScreenState();
}

class _DailyNoteDetailsScreenState extends State<DailyNoteDetailsScreen> {
  final ProjectNoteController projectNoteController = Get.put(ProjectNoteController());

  var parameter = Get.parameters;

  List<Map<String, dynamic>> groupedFiles = [
    {
      'date': 'Sunday, February 14, 2025',
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

  List<Map<String, dynamic>> documentFiles = [
    {
      'files': [
        'building_structure_2025.pdf',
        'building_structure_2025.pdf',
        'building_structure_2025.xlsx',
        'building_structure_2025.pdf',
        'building_structure_2025.xlsx',
      ],
    },
  ];

  void initState()  {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String noteId = '${parameter['noteId']}';
      print('Fetching note details for ID: $noteId');
      projectNoteController.getNoteDetailsByID(noteId);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var group = groupedFiles[0];

    return Scaffold(
      appBar: AppBar(
        title: Text('Sample project'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Note Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Note', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Accepted',
                    style: AppStyles.fontSize14(color: AppColors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text('Sunday, February 23, 2025', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 10),
            Text('Note name', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(
              'Updated project timeline and resource allocation for Q1 2024. Key points discussed.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),

            // Attachments Section
            Text('Attachments', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            // Image Grid Section
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: group['images'].length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _showImagePreview(group['images'][index]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      group['images'][index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),

            // Document Files Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: documentFiles.map((docGroup) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(docGroup['files'].length, (index) {
                      return Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                getFileIcon(docGroup['files'][index]),
                                SizedBox(width: 8.w),
                                Text(docGroup['files'][index]),
                              ],
                            ),
                            SvgPicture.asset('assets/icons/download_icon.svg'),
                          ],
                        ),
                      );
                    }),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Function to handle image click (show preview dialog)
  void _showImagePreview(String image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  width: 350.w,
                  height: 500.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.redColor,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 30.sp,
                          color: AppColors.color323B4A,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          _deleteImage(image);
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.redColor,
                        ),
                        child: SvgPicture.asset(AppIcons.deletedIcon),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Function to delete the selected image
  void _deleteImage(String image) {
    setState(() {
      groupedFiles.forEach((group) {
        group['images'].remove(image); // Remove image from the group
      });
    });
  }

  // Function to return an appropriate icon based on file type
  Widget getFileIcon(String fileName) {
    if (fileName.endsWith('.pdf')) {
      return SvgPicture.asset(AppIcons.pdfIcon);
    } else if (fileName.endsWith('.xlsx')) {
      return SvgPicture.asset(AppIcons.excelFileIcon);
    } else {
      return SvgPicture.asset(AppIcons.documentsIcon);
    }
  }
}
