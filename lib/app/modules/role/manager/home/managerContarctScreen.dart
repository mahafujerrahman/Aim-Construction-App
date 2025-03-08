import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ManagerContactScreen extends StatefulWidget {
  const ManagerContactScreen({super.key});

  @override
  State<ManagerContactScreen> createState() => _ManagerContactScreenState();
}

class _ManagerContactScreenState extends State<ManagerContactScreen> {

  List<Map<String, dynamic>> groupedFiles = [
    {
      'date': 'Monday, February 24, 2025',
      'files': [
        'building_structure_2025.pdf',
        'building_structure_2025.pdf',
        'building_structure_2025.xlsx',
      ],
    },
  ];

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Project Name',
          style: AppStyles.fontSize18(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
                    Text('Contract',style: AppStyles.fontSize20()),
                    SizedBox(height: 16.h),
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showTakePhotoDialog();
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add),
      ),
    );
  }
  void _showTakePhotoDialog() {
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
                  "Select an Option",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.h),
                TextButton(
                  onPressed: () {
                    // Add functionality to take a photo using device camera
                    // You can integrate camera plugin here
                    Navigator.of(context).pop();
                  },
                  child: Text("Take Photo"),
                ),
                SizedBox(height: 8.h),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
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
