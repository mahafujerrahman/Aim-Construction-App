import 'package:aim_construction_app/common/widgets/custom_button.dart';
import 'package:aim_construction_app/common/widgets/custom_text_field.dart';
import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ProjectCreateScreen extends StatefulWidget {
  @override
  _ProjectCreateScreenState createState() => _ProjectCreateScreenState();
}

class _ProjectCreateScreenState extends State<ProjectCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController projectNameController = TextEditingController();
  List<String> userRole = ['Default template'];
  RxString selectedRole = ''.obs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Project',style: AppStyles.fontSize18()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/work1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
             CustomTextField(
               controller: projectNameController,
               hintText: 'Project Name',
             ),
              SizedBox(height: 16),
              CustomTextField(
                controller: projectNameController,
                hintText: 'Street Address',
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: projectNameController,
                hintText: 'City',
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: projectNameController,
                hintText: 'Zip Code',
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: projectNameController,
                hintText: 'Country',
              ),
              SizedBox(height: 20),
              Text('Project Deadline'),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child:  CustomTextField(
                      controller: projectNameController,
                      hintText: 'Start Date',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child:  CustomTextField(
                      controller: projectNameController,
                      hintText: 'End Date',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
              //  value: supervisor,
                decoration: InputDecoration(
                  labelText: 'Assign Supervisor',
                  border: OutlineInputBorder(),
                ),
                items: [
                  'Shohan Hossion (Own CEO)',
                  'Supervisor 2',
                  'Supervisor 3'
                ].map((supervisor) {
                  return DropdownMenuItem<String>(
                    value: supervisor,
                    child: Text(supervisor),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                  //  supervisor = value;
                  });
                },
               // onSaved: (value) => supervisor = value,
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  height: 60.h,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: AppColors.fillUpColor,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.primaryColor, width: 1),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: Row(
                      children: [
                        Expanded(
                          child: Obx(() {
                            return DropdownButton<String>(
                              value: selectedRole.value.isEmpty
                                  ? null
                                  : selectedRole.value,
                              borderRadius: BorderRadius.circular(8.r),
                              hint: Text(
                                selectedRole.isEmpty
                                    ? "Select Tempelet"
                                    :selectedRole.value,
                                style: AppStyles.fontSize16(color: AppColors.blackColor),
                              ),
                              icon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              isExpanded: true,
                              items: userRole.map((role) {
                                return DropdownMenuItem<String>(
                                  value: role == 'Project Manager'
                                      ? 'projectManager'
                                      : 'projectSupervisor',
                                  child: Text(
                                    role,
                                    style: AppStyles.fontSize18(color: AppColors.blackColor),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newRole) {

                              }
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              CustomButton(onTap: (){
                {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    // Process the data (e.g., send to API)
                  //  print('Project Created: $projectName');
                  }}

              }, text: 'Create Project'),
            ],
          ),
        ),
      ),
    );
  }
}
