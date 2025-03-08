import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String description;
  final String? status;
  final int notesCount;
  final int attachmentsCount;

  NoteCard({
    required this.title,
    required this.description,
    this.status,
    required this.notesCount,
    required this.attachmentsCount,
  });

  @override
  Widget build(BuildContext context) {
    Color? statusColor;
    if (status != null) {
      if (status!.toLowerCase() == 'pending') {
        statusColor = Color(0xFFE39CEA);
      } else if (status!.toLowerCase() == 'accepted') {
        statusColor = Colors.green;
      } else {
        statusColor = Colors.grey;
      }
    }

    return Container(
      height: 120.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.color5F6774),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Title and optional Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: AppStyles.fontSize16(color: AppColors.color323B4A),
                  ),
                ),
                if (status != null) // Show only if status is provided
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      status!,
                      style: AppStyles.fontSize14(color: AppColors.white),
                    ),
                  ),
              ],
            ),
            // Description
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      description,
                      style: AppStyles.fontSize14(color: AppColors.color323B4A),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 18.sp, color: Colors.orange),
                ],
              ),
            ),
            // Footer with icons
            SizedBox(height: 8.h),
            Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.attachmentIcon, height: 20.h),
                    SizedBox(width: 4),
                    Text('$attachmentsCount', style: TextStyle(fontSize: 12)),
                  ],
                ),
                SizedBox(width: 16),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.imageIcon, height: 16.h, color: AppColors.color323B4A),
                    SizedBox(width: 4),
                    Text('$notesCount', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
