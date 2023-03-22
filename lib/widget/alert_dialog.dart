
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:profistional_design/app_confiq/styles.dart';
import 'package:profistional_design/widget/my_field_button.dart';

import '../app_confiq/appColors.dart';
import '../screen/auth_screen/fill_profile_screen.dart';


GetMyDialoge(String cancelledDate) {
  return Get.dialog(Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: Colors.transparent,
    body: Center(
      child: Stack(
        children: [
          GestureDetector(
            onTap:() {
              Get.back();
            },
            child: Container(
              color: Colors.transparent,
              width: Get.width,
              height: Get.height,

            ),
          ),
          Center(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.w),
                  child: Container(
                    height: 373.h,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xffFFFFFF)),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10.sp,),
                          Container(
                            height: 115.sp,
                            width: 115.sp,
                            decoration:  const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.blueColor,
                                image: DecorationImage(
                                    image: AssetImage("asset/icon/dialog_box.png"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          SizedBox(height: 60.h,),
                          Text('Congratulation!',style: AppStyles.blueTextStyle(), ),
                          SizedBox(height: 10.h,),
                          Text('Your Password is Successfully Changed',style: AppStyles.commonTextStyle(), ),
                          SizedBox(height: 25.h,),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 10.w,),
                            child:ElevatedButton(onPressed: (){
                           Get.to(FillProfile());
                            }, child: const Text("Go to Hom Page"))
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ));
}