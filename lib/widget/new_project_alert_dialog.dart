import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app_confiq/appColors.dart';
import '../app_confiq/styles.dart';
import '../screen/add_new_form_screen/tool_listing_screen.dart';
import '../screen/auth_screen/fill_profile_screen.dart';
import 'alert_dialog.dart';
import 'my_field_button.dart';

GetDialog(){
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
                    height: 453.h,
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
                          Text('New Project Add Successfully',style: AppStyles.commonTextStyle(), ),
                          SizedBox(height: 25.h,),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 10.w,),
                            child: ElevatedButton(onPressed: (){
                              Get.to(ToolListScreen());
                            }, child: Text("See Project List",style: TextStyle(color: AppColors.whiteColor)),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    backgroundColor: AppColors.blueColor,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))
                                )),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w,),
                              child: ElevatedButton(

                                  onPressed: (){}, child: Text("Back",style: TextStyle(color: AppColors.blueColor)),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                elevation: 0,
                                backgroundColor: AppColors.whiteColor,
                                shape: RoundedRectangleBorder(side: BorderSide(width: 2,color: Colors.black12),borderRadius: BorderRadius.circular(100))
                              )),
                          ),
                          SizedBox(height: 19.h,),

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