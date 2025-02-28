import 'package:aim_construction_app/common/app_color/app_colors.dart';
import 'package:aim_construction_app/common/app_constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final String? obscure;
  final Color? filColor;
  final Color? suffixIconColor;
  final Widget? prefixIcon;
  final String? labelText;
  final String? hintText;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final Widget? suffixIcon;
  final FormFieldValidator? validator;
  final bool isPassword;
  final int? maxLine;
  final bool? isEmail;
  final TextStyle? labelTextStyle;
  final Function(String?)? onChange;

  const CustomTextField(
      {super.key,
        this.suffixIconColor,
        this.labelTextStyle,
      this.contentPaddingHorizontal,
      this.contentPaddingVertical,
      this.hintText,
        this.maxLine,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.isEmail,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.isObscureText = false,
      this.obscure = '*',
      this.filColor,
      this.labelText,
      this.isPassword = false,
        this.onChange});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscuringCharacter: widget.obscure!,
      maxLines: widget.maxLine??1,
      onChanged: widget.onChange,
      // validator: widget.validator,
      validator: widget.validator ??
          (value) {
            if (widget.isEmail == null) {
              if (value!.isEmpty) {
                return "Please ${widget.hintText!.toLowerCase()}";
              } else if (widget.isPassword) {
                bool data = AppConstants.passwordValidator.hasMatch(value);
                if (value.isEmpty) {
                  return "Please ${widget.hintText!.toLowerCase()}";
                } else if (!data) {
                  return "Password hint: [A-Z],[a-z],[!-*],[1-8]";
                }
              }
            } else {
              bool data = AppConstants.emailValidator.hasMatch(value!);
              if (value.isEmpty) {
                return "Please enter ${widget.hintText!.toLowerCase()}";
              } else if (!data) {
                return "Please check your email!";
              }
            }
            return null;
          },
      cursorColor: AppColors.primaryColor,
      obscureText: widget.isPassword ? obscureText : false,
      style: TextStyle(color: AppColors.textColor, fontSize: 16.sp),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: widget.contentPaddingHorizontal ?? 20.w,
            vertical: widget.contentPaddingVertical ?? 20.w),
        fillColor: widget.filColor,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: toggle,
                child: _suffixIcon(
                    obscureText ? Icons.visibility_off : Icons.visibility),
              )
            : widget.suffixIcon,
        prefixIconConstraints: BoxConstraints(minHeight: 24.w, minWidth: 24.w),
        labelText: widget.labelText,
        hintText: widget.hintText,
        labelStyle: widget.labelTextStyle,
          enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
      borderRadius: BorderRadius.circular(8.r),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
    borderRadius: BorderRadius.circular(8.r),
    ),
      ),
    );
  }

  _suffixIcon(IconData icon) {
    return Padding(padding: const EdgeInsets.all(12.0), child: Icon(icon,color: widget.suffixIconColor?? AppColors.primaryColor,size: 20.sp,));
  }
}

