import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaskCard extends StatelessWidget {
  final String noteText;
  final int attachmentCount;
  final int commentCount;
  final String authorName;
  final String date;
  final VoidCallback onTap;

  const TaskCard({
    Key? key,
    required this.noteText,
    required this.attachmentCount,
    required this.commentCount,
    required this.authorName,
    required this.date,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 110.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.color5F6774),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noteText,
                    style: AppStyles.fontSize14(color: AppColors.color323B4A),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.attachmentIcon, height: 14.h,width: 14.w),
                      SizedBox(width: 4),
                      Text('$attachmentCount',style: AppStyles.fontSize14(color: AppColors.color323B4A)),
                      SizedBox(width: 12),
                      SvgPicture.asset(AppIcons.imageIcon, height: 14.h,width: 14.w,color: AppColors.color323B4A),
                      SizedBox(width: 4),
                      Text('$commentCount',style: AppStyles.fontSize14(color: AppColors.color323B4A)),
                      SizedBox(width: 12),
                      SvgPicture.asset(AppIcons.profileIcon, height: 14.h,width: 14.w),
                      SizedBox(width: 4),
                      Text(authorName,style: AppStyles.fontSize14(color: AppColors.color323B4A)),
                      SizedBox(width: 12),
                      SvgPicture.asset(AppIcons.calender, height: 14.h,width: 14.w),
                      SizedBox(width: 4),
                      Text(date,style: AppStyles.fontSize14(color: AppColors.color323B4A)),
                    ],
                  ),
                ],
              ),
            ),
            // Right side arrow
            IconButton(
              icon: Icon(Icons.arrow_forward_ios,color: AppColors.primaryColor),
              onPressed: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
