// import 'package:digi_accounting/app_config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import 'appColors.dart';

class AppStyles{



  static TextStyle titleTextStyle() {
    return TextStyle(
        fontSize: 38.sp,
        fontWeight: FontWeight.w700,
         color: AppColors.textColor
    );
  }
static TextStyle listingStyle(){
    return TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp);
}
static TextStyle formLabelStyle(){
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor
    );
}
  static TextStyle blueTextStyle(){
    return TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.blueColor,
    );
  }

  static TextStyle commonTextStyle(){
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor,
    );
  }
}