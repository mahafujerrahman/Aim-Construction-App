import 'package:aim_construction_app/app/modules/role/supervisor/dailyLog/views/innerWidget/note_card_widget.dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DailyLogNoteScreen extends StatelessWidget {
  DailyLogNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2, // Adjust based on actual notes count
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.dailyNoteDetailsScreen);
                        },
                        child: NoteCard(
                          title: "Name of notes",
                          description:
                          "This note structure ensures clear communication of the day's events.",
                          status: "Pending",
                          notesCount: 2,
                          attachmentsCount: 2,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      NoteCard(
                        title: "Name of notes",
                        description:
                        "This note structure ensures clear communication of the day's events.",
                        status: "Accepted",
                        notesCount: 2,
                        attachmentsCount: 2,
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addNewNoteScreen);
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
      ),

    );
  }

}
