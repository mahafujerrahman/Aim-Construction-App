import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FileUtils {

  static SvgPicture getFileIcon(String fileName) {
    if (fileName.endsWith('.pdf')) {
      return SvgPicture.asset(AppIcons.pdfIcon);
    } else if (fileName.endsWith('.xlsx') || fileName.endsWith('.xls')) {
      return SvgPicture.asset(AppIcons.excelFileIcon, height: 20.h);
    } else if (fileName.endsWith('.docx') || fileName.endsWith('.doc')) {
      return SvgPicture.asset(AppIcons.documentsIcon, height: 20.h, color: Colors.black87);
    } else {
      return SvgPicture.asset(AppIcons.documentsIcon, height: 20.h, color: Colors.black87);
    }
  }
}
