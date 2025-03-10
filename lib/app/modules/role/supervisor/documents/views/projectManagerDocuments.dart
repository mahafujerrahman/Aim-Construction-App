import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectManagerDoumentScreen extends StatefulWidget {
  const ProjectManagerDoumentScreen({super.key});

  @override
  State<ProjectManagerDoumentScreen> createState() => _ProjectManagerDoumentScreenState();
}

class _ProjectManagerDoumentScreenState extends State<ProjectManagerDoumentScreen> {
  List<Map<String, dynamic>> groupedFiles = [
    {
      'date': 'Sunday, February 14, 2025',
      'files': [
        'building_structure_2025.xlsx',
        'building_structure_2025.pdf',
        'building_structure_2025.xlsx',
        'building_structure_2025.pdf',
      ],
    },
    {
      'date': 'Monday, February 15, 2025',
      'files': [
        'building_structure_2025.pdf',
        'building_structure_2025.xlsx',
        'building_structure_2025.pdf',
        'building_structure_2025.pdf',
        'building_structure_2025.xlsx',
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: groupedFiles.map((group) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${group['date']}',
                        style: TextStyle(fontWeight: FontWeight.w600,color: AppColors.color323B4A),
                      ),
                    ),
                    ...List.generate(group['files'].length, (index) {
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
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}