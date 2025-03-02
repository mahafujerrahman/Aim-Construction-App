import 'package:aim_construction_app/common/app_color/app_colors.dart';
import 'package:aim_construction_app/common/widgets/custom_button.dart';
import 'package:aim_construction_app/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passCTRl = TextEditingController();
  final TextEditingController _confirmPassCTRl = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=============================> AppBar Section <=======================
      appBar: AppBar(
        title: Text('Reset Password'),
        centerTitle: true,
      ),
      //=============================> Body Section <========================
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //=======================> Password Text Field <======================
                    CustomTextField(
                      filColor: AppColors.fillUpColor,
                      controller: _passCTRl,
                      hintText: "Password",
                      isPassword: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 12.h),
                        child: Icon(Icons.lock,color: AppColors.primaryColor,),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    //=======================> Confirm Password Text Field <======================
                    CustomTextField(
                      filColor: AppColors.fillUpColor,
                      controller: _confirmPassCTRl,
                      hintText: "Confirm Password",
                      isPassword: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 12.h),
                        child: Icon(Icons.lock,color: AppColors.primaryColor,),
                      ),
                    ),
                    //====================> Continue Button <=============================
                    SizedBox(height: 425.h),
                    CustomButton(
                      onTap: () {
                        // Your functionality for setting a new password
                      },
                      text: "Set New Password",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
