import 'package:aim_construction_app/app/modules/bottom_menu/manager_bottom_menu..dart';
import 'package:aim_construction_app/common/widgets/custom_text_field.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ManagerActivityScreen extends StatelessWidget {
  const ManagerActivityScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();

    return Scaffold(
      bottomNavigationBar: const ManagerBottomMenu(1),
      appBar: AppBar(
        title: const Text('Manager Project'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Activity Log
            Text(
                'Activity',
                style: AppStyles.fontSize20(fontWeight: FontWeight.w700,color: AppColors.color323B4A)
            ),
            SizedBox(height: 16),
            // Search bar
            CustomTextField(
              controller: textEditingController,
              hintText: "Search",
            ),
            SizedBox(height: 16),
            // Activity List
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding:  EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.color323B4A),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Manager submitted a attachment in sample project',
                            style: AppStyles.fontSize16(fontWeight: FontWeight.w600,color: AppColors.color323B4A)
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            SvgPicture.asset(AppIcons.submittedIcon),
                            SizedBox(width: 4.w),
                            Text(
                              'Submitted: Sunday, February 23, 2025',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),

                      ],
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
