import 'package:aim_construction_app/service/filePicker_service.dart';
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
                    Text('Contract', style: AppStyles.fontSize20()),
                    SizedBox(height: 16.h),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${group['date']}',
                        style: TextStyle(fontWeight: FontWeight.w600,
                            color: AppColors.color323B4A),
                      ),
                    ),
                    ...List.generate(group['files'].length, (index) {
                      return GestureDetector(
                        onLongPress: () {
                          _removeFile(group['files'][index]);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  getFileIcon(group['files'][index]),
                                  SizedBox(width: 8.w),
                                  Text(group['files'][index]),
                                ],
                              ),
                              SvgPicture.asset(AppIcons.downloadIcon),
                            ],
                          ),
                        ),
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
        onPressed: () {
          _showTakeFileDialog();
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add),
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
                InkWell(
                  onTap: () async {
                    Navigator.of(context).pop();
                    String? fileName = await FilePickerService.pickFile();

                    if (fileName != null) {
                      setState(() {
                        groupedFiles[0]['files'].add(fileName);
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
                setState(() {
                  groupedFiles[0]['files'].remove(fileName);
                });
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