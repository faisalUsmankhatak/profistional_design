import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profistional_design/app_confiq/appColors.dart';
import 'package:profistional_design/app_confiq/styles.dart';
import 'package:profistional_design/widget/my_field_button.dart';
import 'package:profistional_design/widget/my_text_field.dart';

import '../../widget/alert_dialog.dart';
class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  RxBool isVisiblePassword=false.obs;
  RxBool isVisibleNewPassword=false.obs;
  RxBool isRemember=false.obs;
  TextEditingController password=TextEditingController();
  TextEditingController conformPassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 20.w,top: 26.w),
              child: Container(
                width: 24.w,height: 24.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("asset/icon/back.png"))
                ),
              ),
            ),
            SizedBox(height: 19.h,),
            Padding(
              padding:  EdgeInsets.only(left: 43.w,right: 46.w),
              child: Text("Create Your \nNew Password",style: AppStyles.titleTextStyle(),),
            ),
            SizedBox(height: 80.h,),
            Padding(
              padding:  EdgeInsets.only(left: 43.w,right: 46.w),
              child: Obx(() => MyTextField(controller: password, label: "New Password",prefixIcon: "asset/icon/lock.png",
                    suffixIcon:isVisiblePassword.value?"asset/icon/nonvisible.png":"asset/icon/visible.png",
                  obscureText: isVisiblePassword.value,
              suffixIconTab: (){
                isVisiblePassword.value=!isVisiblePassword.value;
              }),
              ),
            ),
           SizedBox(height: 30.h,),
           Padding(
             padding:  EdgeInsets.only(left: 43.w,right: 46.w),
             child: MyTextField(controller: conformPassword, label: "Confirm Password",prefixIcon: "asset/icon/lock.png",
             suffixIcon:isVisibleNewPassword.value?"asset/icon/nonvisible.png":"asset/icon/visible.png" ,
             ),
           ),
            SizedBox(height: 49.h,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    isRemember.value=!isRemember.value;
                  },
                  child: Obx(() => Container(
                      width: 19.w,height: 19.h,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.w),
                        border: Border.all(color: isRemember.value?AppColors.whiteColor:AppColors.blueColor),
                        color: isRemember.value?AppColors.blueColor:AppColors.whiteColor
                      ),
                    child:  Center(child: Icon(Icons.done,color:AppColors.whiteColor,size: 14.w),),
                    ),
                  ),
                ),
                SizedBox(width: 6.w,),
                Text("Remember Me",style: AppStyles.commonTextStyle(),)
              ],
            ),
            SizedBox(height: 31.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 44.w),
              child: MyFieldButton(buttonText: "Continue",radius: 100.w,height: 55.h,onTap: (){
                GetMyDialoge('fd');
              }),
            )
          ],
        ),
      ),
    ));
  }
}
