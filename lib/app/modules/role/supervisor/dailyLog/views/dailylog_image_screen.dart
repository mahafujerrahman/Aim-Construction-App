import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DailyLogImageScreen extends StatefulWidget {
  DailyLogImageScreen({super.key});

  @override
  State<DailyLogImageScreen> createState() => _DailyLogImageScreenState();
}

class _DailyLogImageScreenState extends State<DailyLogImageScreen> {
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
                        style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.color323B4A),
                      ),
                    ),
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
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showTakePhotoDialog,
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add),
      ),
    );
  }

  // Function to show Take Photo dialog
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
}
