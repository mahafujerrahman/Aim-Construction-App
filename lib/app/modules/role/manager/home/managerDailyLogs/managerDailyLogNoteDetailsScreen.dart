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
      return SvgPicture.asset(AppIcons.pdfIcon, width: 24, height: 24);
    } else if (fileName.endsWith('.xlsx')) {
      return SvgPicture.asset(AppIcons.excelFileIcon, width: 24, height: 24);
    } else {
      return SvgPicture.asset(AppIcons.documentsIcon, width: 24, height: 24);
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

            // Display images
            Row(
              children: groupedFiles[0]['images'].map<Widget>((image) {
                return GestureDetector(
                  onTap: () => _showImagePreview(image),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(image, width: 80, height: 80, fit: BoxFit.cover),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16.h),
            // Display documents
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: documentFiles.map((doc) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doc['date'], style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    ...doc['files'].map<Widget>((file) {
                      return ListTile(
                        leading: getFileIcon(file),
                        title: Text(file),
                        trailing:SvgPicture.asset(AppIcons.downloadIcon),
                        onTap: () {},
                      );
                    }).toList(),
                  ],
                );
              }).toList(),
            ),

            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 16),
            CustomButton(onTap: () {}, text: 'Accept')
          ],
        ),
      ),
    );
  }
}
