import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MySupervisorListScreen extends StatelessWidget {
  final List<Map<String, String>> supervisors = [
    {
      "name": "Mr. Santa Cruz",
      "id": "1234567",
      "image": "https://randomuser.me/api/portraits/men/1.jpg"
    },
    {
      "name": "Mr. Santa Cruz",
      "id": "1234567",
      "image": "https://randomuser.me/api/portraits/men/2.jpg"
    },
    {
      "name": "Mr. Santa Cruz",
      "id": "1234567",
      "image": "https://randomuser.me/api/portraits/men/3.jpg"
    },
    {
      "name": "Mr. Santa Cruz",
      "id": "1234567",
      "image": "https://randomuser.me/api/portraits/men/4.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Supervisor",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: supervisors.length,
                itemBuilder: (context, index) {
                  final supervisor = supervisors[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: GestureDetector(
                      onTap: () {
                      Get.toNamed(AppRoutes.indivitualSupervisorInfoScreen);
                      },
                      child: Container(
                        height: 110.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: AppColors.color5F6774),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Profile Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: Image.network(
                                  supervisor["image"]!,
                                  width: 85.w,
                                  height: 85.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 15.w),

                              // Name and ID Text
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name: ${supervisor["name"]}",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      "Id: ${supervisor["id"]}",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Forward Arrow
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.sp,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
