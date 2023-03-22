import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/appColors.dart';
import '../../controller/contractor_controller.dart';
import '../../widget/error_dialog.dart';
import '../../widget/form_apbar.dart';
import '../../widget/my_field_button.dart';
import '../../widget/my_second_text_field.dart';
class ContractorFormScreen extends StatelessWidget {
  ContractorController contractorController=Get.find<ContractorController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body:
           SingleChildScrollView(
              child: Column(
                children: [
                  FormApbar(label: "Add New Contractor"),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Container(
                      height: 48.h,
                      width: 380.w,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.w),
                          color: AppColors.blueColor),
                      child: Padding(padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 15.h),
                        child: Text("Sub-Contractor", style: TextStyle(
                            fontSize: 14.sp, color: AppColors.whiteColor)),),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: MySecondTextField(
                      lablel: "Contractor Name",
                      textController: contractorController.nameController.value,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: MySecondTextField(
                      lablel: "Number",
                      textController: contractorController.numberController.value,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: MySecondTextField(
                      lablel: "Email",
                      textController: contractorController.emailController.value,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: MySecondTextField(
                      lablel: "Address",
                      height: 25,
                      textController: contractorController.addressController.value,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44.w),
                    child: Obx(()=>contractorController.isLoadingButton.value?const Center(child: CircularProgressIndicator(),):
                      MyFieldButton(
                        height: 55,
                        buttonText: "Add new customer",
                        radius: 100,
                        onTap: () {
                        if(contractorController.formVailadation(context)){
                          contractorController.addContractor();
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
