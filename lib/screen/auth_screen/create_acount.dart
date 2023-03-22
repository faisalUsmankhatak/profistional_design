import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profistional_design/app_confiq/styles.dart';
import 'package:profistional_design/widget/my_text_field.dart';

import '../../widget/my_field_button.dart';
class CreateAcount extends StatefulWidget {
  const CreateAcount({Key? key}) : super(key: key);

  @override
  State<CreateAcount> createState() => _CreateAcountState();
}

class _CreateAcountState extends State<CreateAcount> {
  RxBool isVisiblePassword=false.obs;
  RxBool isVisiConfirmPassword=false.obs;
  TextEditingController fullName=TextEditingController();
  TextEditingController phoneNumber=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController confirmPassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Scaffold(
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 20.w,top: 21.w),
                child: Container(
                  width: 24.w,height: 24.h,
                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("asset/icon/back.png"))),
                ),
              ),
              SizedBox(height: 18.h,),
              Padding(
                padding:  EdgeInsets.only(left: 43.w,right: 48.w),
                child: Text("Create Your \nAccount",style: AppStyles.titleTextStyle(),),
              ),
              SizedBox(height: 53.h,),
             Padding(
               padding:  EdgeInsets.only(left: 41.w,right: 48.w),
               child: MyTextField(controller: fullName, label: "Full Name",prefixIcon: "asset/icon/fullName.png",
               ),
             ),
              SizedBox(height: 30.h,),
              Padding(
                padding:  EdgeInsets.only(left: 41.w,right: 48.w),
                child: MyTextField(controller: phoneNumber, label: "Phone Number",prefixIcon: "asset/icon/phone.png",
                ),
              ),
              SizedBox(height: 30.h,),
              Padding(
                padding:  EdgeInsets.only(left: 41.w,right: 48.w),
                child: MyTextField(controller: address, label: "Address",prefixIcon: "asset/icon/address.png",
                ),
              ),
              SizedBox(height: 30.h,),
              Padding(
                padding:  EdgeInsets.only(left: 41.w,right: 48.w),
                child: Obx(() => MyTextField(controller: password, label: "Password",prefixIcon: "asset/icon/lock.png",
                    suffixIcon:isVisiblePassword.value? "asset/icon/nonvisible.png":"asset/icon/visible.png",
                    obscureText: isVisiblePassword.value,
                    suffixIconTab: (){
                    isVisiblePassword.value=!isVisiblePassword.value;
                    },
                  ),
                ),
              ),
              SizedBox(height: 30.h,),
              Padding(
                padding:  EdgeInsets.only(left: 41.w,right: 48.w),
                child: Obx(() => MyTextField(controller: confirmPassword, label: "Confirm Password",prefixIcon: "asset/icon/lock.png",
                  suffixIcon:isVisiConfirmPassword.value? "asset/icon/nonvisible.png":"asset/icon/visible.png",
                  obscureText: isVisiConfirmPassword.value,
                  suffixIconTab: (){
                    isVisiConfirmPassword.value=!isVisiConfirmPassword.value;
                  },

                ),

                ),
              ),
              SizedBox(height: 30.h,),
              Padding(
                padding:  EdgeInsets.only(left: 41.w,right: 48.w),
                child: MyFieldButton(buttonText: "Sign Up",radius: 100,height: 55),
              ),
              SizedBox(height: 25.h,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                   Text("Already have an account?",style: AppStyles.commonTextStyle()),
                  InkWell(child: Text(" Sign in",style: AppStyles.blueTextStyle()))
                ],
              )

            ],
          ),
        ),
      ),)
    );
  }
}
