import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/appColors.dart';
import '../../controller/supplier_controller.dart';
import '../../widget/form_apbar.dart';
import '../../widget/my_field_button.dart';
import '../../widget/my_second_text_field.dart';

class SupplierFormScreen extends StatefulWidget {
  const SupplierFormScreen({Key? key}) : super(key: key);

  @override
  State<SupplierFormScreen> createState() => _SupplierFormScreenState();
}

class _SupplierFormScreenState extends State<SupplierFormScreen> {
  SupplierController supplierController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormApbar(label: "Add New Supplier"),
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                  child: Text("Supplier",
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
                  lablel: "Supplier Name",
                  textController: supplierController.nameController.value),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: MySecondTextField(
                  lablel: "Phone",
                  textController: supplierController.phoneController.value),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: MySecondTextField(
                  lablel: "Email",
                  textController: supplierController.emailController.value),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: MySecondTextField(
                  lablel: "Address",
                  height: 22,
                  textController: supplierController.addressController.value),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44.w),
              child: Obx(() => supplierController.isLoadingButton.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : MyFieldButton(
                      buttonText: "Add new Supplier", height: 55, radius: 100,onTap: (){
                       if( supplierController.formValidation(context)){
                         supplierController.addSupplierData();
                       }
              }),),
            )
          ],
        ),
      ),
    ));
  }
}
