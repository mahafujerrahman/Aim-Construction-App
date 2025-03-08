import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddNewNoteScreen extends StatelessWidget {
  AddNewNoteScreen({super.key});

  final TextEditingController noteNameController =
  TextEditingController(text: "This is sample note");
  final TextEditingController descriptionController =
  TextEditingController(text: "Lorem ipsum dolor sit amet consectetur. Arcu magna nisl faucibus eu non.");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Add new note",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabelWithAddButton("Add note name"),
            TextField(
              controller: noteNameController,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
            SizedBox(height: 16.h),

            _buildLabelWithAddButton("Add description"),
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
            SizedBox(height: 16.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Attachment', style: TextStyle(fontSize: 16.sp)),
                InkWell(
                  onTap: () {
                    _showTakeDocumentDialog(context);
                  },
                  child: SvgPicture.asset(AppIcons.attachmentIcon, height: 20.h),
                )
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(AppIcons.attachmentIcon, height: 18.h),
                SizedBox(width: 4.w),
                const Text("2"),
                SizedBox(width: 16.w),
                SvgPicture.asset(AppIcons.imageIcon, height: 16.h, color: AppColors.color323B4A),
                SizedBox(width: 4.w),
                const Text("2"),
              ],
            ),
            const Spacer(),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Save functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabelWithAddButton(String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }

  void _showTakeDocumentDialog(BuildContext context) {
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
                  "Add an attachment",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.h),
                TextButton(
                  onPressed: () {
                    // Add functionality
                  },
                  child: Text("Select file"),
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
