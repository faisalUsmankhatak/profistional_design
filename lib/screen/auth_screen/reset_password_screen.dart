import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:profistional_design/app_confiq/appColors.dart';
import 'package:profistional_design/app_confiq/styles.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:profistional_design/widget/my_field_button.dart';
import 'package:profistional_design/widget/my_text_field.dart';

import 'create_new_password_screen.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
  body: SingleChildScrollView(
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
Padding(
    padding:  EdgeInsets.only(left: 20.w,top:21.h, ),
    child:   Container(
      width: 24.w,height: 24.h,
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("asset/icon/back.png"))),
    ),
),
        SizedBox(height: 24.h,),
        Padding(
          padding:  EdgeInsets.only(left:45.w),
          child: Text("Forgot \nPassword",style: AppStyles.titleTextStyle(),),
        ),
        SizedBox(height: 115.h,),
        Padding(
          padding:  EdgeInsets.only(left: 45.w),
          child: Text("Code has been send to",style: AppStyles.commonTextStyle(),),
        ),
        SizedBox(height: 80.h,),
        OtpTextField(
          numberOfFields: 5,
          borderColor: Color(0xFF512DA8),
          //set to true to show as box or false to show as dash
          showFieldAsBox: true,
          //runs when a code is typed in
          onCodeChanged: (String code) {
            //handle validation or checks here
          },
          //runs when every textfield is filled
          onSubmit: (String verificationCode){
            showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: const Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                  );
                }
            );
          }, // end onSubmit
        ),
    SizedBox(height: 336.h,),
      Padding(
        padding:  EdgeInsets.only(left: 39.h,right: 50.h,),
        child: MyFieldButton(buttonText: "Verify",height: 55.h,radius: 100.w,onTap: (){
         Get.to(const NewPasswordScreen());
        }, ),
      )
      ],
    ),
  ),
    ));
  }
}
