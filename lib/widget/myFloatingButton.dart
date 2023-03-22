import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_confiq/appColors.dart';

class MyFloationButton extends StatelessWidget {
  double? width;
  double? height;
  String label;
  GestureTapCallback? onPressFloating;

  MyFloationButton(
      {this.width, this.height, required this.label, this.onPressFloating});

  @override
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressFloating,

      child: Container(
        width: width ?? 120.w,
        height: height ?? 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.w),
          color: AppColors.blueColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 26.w,
                height: 26.h,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.whiteColor),
                child: const Center(
                  child: Icon(Icons.add, size: 22, color: AppColors.blueColor),
                ),
              ),
              width != null
                  ? SizedBox(
                      width: 12.w,
                    )
                  : SizedBox(
                      width: 10.w,
                    ),
              Text(
                label,
                style: const TextStyle(color: AppColors.whiteColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
