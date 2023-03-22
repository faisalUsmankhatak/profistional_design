import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/appColors.dart';
import '../../controller/staff_user_controller.dart';
import '../../widget/form_apbar.dart';
import '../../widget/my_field_button.dart';
import '../../widget/my_second_text_field.dart';
import '../../widget/new_project_alert_dialog.dart';

class StaffFormScreen extends StatelessWidget {
  StaffUserController staffUserController = Get.find();

  List<String> customerLIst = ['Select Role', "Faisal", "Kamal", "Akmal"];
  String defaultValue = "Select Role";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          FormApbar(label: "Add New User"),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Container(
              height: 48.h,
              width: 380.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: AppColors.blueColor),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                child: Text("Staff User",
                    style: TextStyle(
                        fontSize: 14.sp, color: AppColors.whiteColor)),
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: MySecondTextField(
                lablel: "Name",
                textController: staffUserController.nameController.value),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: MySecondTextField(
              lablel: "Phone",
              textController: staffUserController.phoneController.value,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: MySecondTextField(
              lablel: "Amount No",
              textController: staffUserController.amountController.value,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: MySecondTextField(lablel: "Email",textController: staffUserController.emailController.value),
          ),
          SizedBox(
            height: 24.h,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44.w),
            child: Obx(()=>staffUserController.isLoadingButton.value? const Center(child: CircularProgressIndicator(),):
               MyFieldButton(
                  buttonText: "Add User",
                  height: 55,
                  radius: 100,
                  onTap: () {
if(staffUserController.formValidation(context)){
 staffUserController.addStaffUserData();
}
                  },
                  bodyColor: AppColors.blueColor),
            ),
          ),
        ]),
      ),
    ));
  }
}
