import 'package:aim_construction_app/app/modules/role/supervisor/task/views/allTaskScreen.dart';
import 'package:aim_construction_app/app/modules/role/supervisor/task/views/completedTaskScreen.dart';
import 'package:aim_construction_app/app/modules/role/supervisor/task/views/openTaskScreen.dart';
import 'package:aim_construction_app/common/widgets/custom_text_field.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoleSupervisorTaskView extends StatefulWidget {
  const RoleSupervisorTaskView({super.key});

  @override
  _RoleSupervisorTaskViewState createState() => _RoleSupervisorTaskViewState();
}

class _RoleSupervisorTaskViewState
    extends State<RoleSupervisorTaskView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      setState(() {});
    });
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Project Name',
          style: AppStyles.fontSize18(fontWeight: FontWeight.w600,color: AppColors.color323B4A),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Task'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
              controller: textEditingController,
              hintText: "Search",
            ),
          ),
          // TabBar Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              indicator: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              indicatorPadding: EdgeInsets.only(top: 40),
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: AppColors.primaryColor,
              tabs: [
                Tab(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Open',
                        style: TextStyle(
                          color: _tabController.index == 0
                              ? AppColors.blackColor
                              : AppColors.greyColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Completed',
                        style: TextStyle(
                          color: _tabController.index == 1
                              ? AppColors.blackColor
                              : AppColors.greyColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'All',
                        style: TextStyle(
                          color: _tabController.index == 2
                              ? AppColors.blackColor
                              : AppColors.greyColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children:  [
                SupervisorOpenTaskScreen(),
                SupervisorCompletedTaskScreen(),
                SupervisorAllTaskScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
