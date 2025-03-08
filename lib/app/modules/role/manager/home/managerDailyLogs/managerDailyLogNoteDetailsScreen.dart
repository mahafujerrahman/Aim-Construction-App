import 'package:aim_construction_app/common/widgets/custom_button.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ManagerProjectReportDetailsScreen extends StatefulWidget {
  @override
  State<ManagerProjectReportDetailsScreen> createState() => _ManagerProjectReportDetailsScreenState();
}

class _ManagerProjectReportDetailsScreenState extends State<ManagerProjectReportDetailsScreen> {
  List<Map<String, dynamic>> groupedFiles = [
    {
      'images': [
        'assets/image/workImage.jpg',
        'assets/image/work1.jpg',
      ],
    },
  ];
  List<Map<String, dynamic>> documentFiles = [
    {
      'date': 'Monday, February 24, 2025',
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

  void _showImagePreview(String imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View report'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Project name: sample project',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Road number: 10 Dhaka, Dhaka division'),
                  Text('Date: 28/02/2025'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text('Sunday, February 23, 2025',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Column(
              children: [

              ],
            ),

            Divider(),
            Row(
              children: [
                Expanded(child: CustomButton(onTap: () {}, text: 'Preview Report')),
                SizedBox(width: 4.w),
                Expanded(child: CustomButton(onTap: () {}, text: 'Add Note')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
