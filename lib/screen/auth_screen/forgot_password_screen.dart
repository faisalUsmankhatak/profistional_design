import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profistional_design/app_confiq/appColors.dart';
import 'package:profistional_design/app_confiq/styles.dart';
import 'package:profistional_design/screen/auth_screen/reset_password_screen.dart';
import 'package:profistional_design/widget/my_field_button.dart';
import 'package:profistional_design/widget/my_text_field.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  RxBool isClickEmail=false.obs;
  RxBool isClickSms=false.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Padding(
             padding:  EdgeInsets.only(left: 20.w,top: 26.h),
             child: InkWell(
               onTap: (){
                 Get.back();
               },
               child: Container(
                 width: 24.w,
                 height: 24.h,
                 decoration: const BoxDecoration(
                   image: DecorationImage(image: AssetImage("asset/icon/back.png"))
                 ),
               ),
             ),
           ),
            SizedBox(height: 24.h,),
            Padding(
              padding:  EdgeInsets.only(left: 45.w,right: 94.w),
              child: Text("Forgot \nPassword",style: AppStyles.titleTextStyle(),),
            ),
            SizedBox(height: 60.h,),
            Padding(
              padding:  EdgeInsets.only(left: 32.w,right: 108.w),
              child: Text("In which way you want to reset you\npassword",style: AppStyles.commonTextStyle(),),
            ),
            SizedBox(height: 25.h,),
            InkWell(
              onTap: (){
                isClickSms.value=!isClickSms.value;
                isClickEmail.value=false;
              },
                child: Obx(() => phoneAndEmailContainer("asset/icon/sms.png","Via SMS",isClickSms.value))),
            const SizedBox(height: 25,),
            InkWell(
              onTap: (){
                isClickEmail.value=!isClickEmail.value;
                isClickSms.value=false;
              },
                child: Obx(() => phoneAndEmailContainer("asset/icon/forgotEmail.png","Via Email",isClickEmail.value))),
Obx(() => isClickSms.value || isClickEmail.value? SizedBox(height: 25.h,):Container()),
            Obx(() =>isClickEmail.value? Padding(
                padding: const EdgeInsets.only(left: 24,right: 24),
                child: MyTextField(controller: email, label: "Email",prefixIcon: "asset/icon/email.png",),
              ):Container()
            ),
            Obx(() =>isClickSms.value? Padding(
              padding: const EdgeInsets.only(left: 24,right: 24),
              child: MyTextField(controller: password, label: "SMS",prefixIcon: "asset/icon/sms.png",),
            ):Container()
            ),
           SizedBox(height: 25.h,),
            Obx(() => Padding(
              padding:  EdgeInsets.only(left: 39.w,right: 50.w),
              child: MyFieldButton(height: 55.h,buttonText: "Continue",
                  bodyColor:isClickSms.value || isClickEmail.value?AppColors.blueColor:AppColors.gray,
                onTap:isClickSms.value || isClickEmail.value? (){
                Get.to(const ResetPasswordScreen());
                }:(){} ),
            )),

          ],
        ),
      ),
    ));
  }
  Widget phoneAndEmailContainer(String imageUrl,String context,bool isSalected){
    return  Padding(padding: EdgeInsets.only(left: 24.w,right: 24.w),
      child: Container(width: double.infinity,height: 127.h,
        decoration:  BoxDecoration(
            color: AppColors.texFieldColor,
                border: Border.all(color: isSalected?AppColors.blueColor:Colors.transparent,width: 2)
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 0.h,left: 19.w,),
          child: Row(
            children: [
             Container(
               width: 72.w,
               height: 72.h,
               decoration: const BoxDecoration(shape: BoxShape.circle,color: AppColors.blueColor),
               child: Center(child: Container(
width: 24.w,height: 24.w,
                 decoration:  BoxDecoration(image: DecorationImage(image: AssetImage(imageUrl))),
               ),),
             ),
              SizedBox(width: 20.w,),
 Text(context),
            ],
          ),
        ),
      ),);
  }
}
