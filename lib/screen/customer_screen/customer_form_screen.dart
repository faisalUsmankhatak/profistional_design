import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:profistional_design/app_confiq/appColors.dart';
import 'package:profistional_design/widget/my_field_button.dart';

import '../../controller/customer_controller.dart';
import '../../widget/form_apbar.dart';
import '../../widget/my_second_text_field.dart';

class CustomerFormScreen extends StatelessWidget {
  CustomerController customerController=Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             FormApbar(label: "Add New Customer"),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(
                height: 48.h,
                width: 380.w,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.blueColor),
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 15.h),
                child: Text("Customer",style: TextStyle(fontSize: 14.sp,color: AppColors.whiteColor)),),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: MySecondTextField(
                lablel: "Customer Name",
                textController: customerController.nameController.value,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: MySecondTextField(
                lablel: "Phone",
                textController: customerController.phoneController.value,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: MySecondTextField(
                lablel: "Email",
                textController: customerController.emailController.value,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: MySecondTextField(
                lablel: "Adress",
                height: 23,
                textController: customerController.addressController.value,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44.w),
              child: Obx(()=>customerController.isLoadingButton.value?const Center(child: CircularProgressIndicator(),):
                 MyFieldButton(
                  height: 55,
                  buttonText: "Add new customer",
                  radius: 100,
                  onTap: (){
                  if(  customerController.formValidation(context)){
customerController.addCustomerData();
                  }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
