import 'package:aim_construction_app/app/modules/role/supervisor/images/views/projectManagerImage.dart';
import 'package:aim_construction_app/app/modules/role/supervisor/images/views/projectSupervisoImageScreen.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoleSupervisorImagesView extends StatefulWidget {
  const RoleSupervisorImagesView({super.key});

  @override
  _RoleSupervisorImagesViewState createState() =>
      _RoleSupervisorImagesViewState();
}

class _RoleSupervisorImagesViewState
    extends State<RoleSupervisorImagesView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

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
          'Image',
          style: AppStyles.fontSize18(fontWeight: FontWeight.w600,color: AppColors.color323B4A),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
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
                        'Project Supervisor',
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
                        'Project Manager',
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
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ProjectSupervisorImageScreen(),
                ProjectManagerImageScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
