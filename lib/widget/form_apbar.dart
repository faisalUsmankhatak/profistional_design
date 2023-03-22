import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app_confiq/appColors.dart';
import '../controller/contractor_controller.dart';
class FormApbar extends StatelessWidget {
 String label;


 FormApbar({required this.label,});
 //ContractorController contractorController=Get.put(ContractorController());
  @override
  Widget build(BuildContext context) {
   return    Container(
     height: 48.h,
     color: AppColors.blueColor,
     child: Row(
       children: [
         SizedBox(width: 20.w,),
         InkWell(
           onTap:(){
              Get.back();

           },
           child: const Icon(Icons.arrow_back,size: 18,color: AppColors.whiteColor,)

         ),
         SizedBox(
           width: 20.w,
         ),
         Text(
           "$label",
           style: TextStyle(fontSize: 16.sp, color: AppColors.whiteColor),
         ),
         Expanded(child: SizedBox()),
         Container(
           width: 16.w,
           height: 16.h,
           decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/icon/square.png",))),
         ),
         SizedBox(width: 10.w,),
       ],
     ),
   );
  }
}

