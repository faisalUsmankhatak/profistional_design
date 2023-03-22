
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';

import '../app_confiq/appColors.dart';
import 'my_field_button.dart';



class ErrorDialoge extends StatelessWidget {
  String? message;
  Function? onTapOk;

  ErrorDialoge({this.message, this.onTapOk});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('ALERT', style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.textColor, fontSize: 18.sp),),
          Icon(Icons.error_outline_outlined, color: AppColors.blueColor, size: 25.sp,)
        ],
      ),
      content: Text(
        message!,
        style: TextStyle(fontWeight: FontWeight.w400, color: AppColors.textColor, fontSize: 16.sp),
      ),
      actions: <Widget>[
        MyFieldButton(
          bodyColor: AppColors.blueColor,
      onTap:() {
        Get.back();
      },
          width: 60,
          height: 35,
         buttonText:"OK" ,
         radius: 5,

        ),
      ],
    );
  }
}
