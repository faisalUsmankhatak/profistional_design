import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:profistional_design/screen/payment_screen/payment_listing_screen.dart';

import '../../app_confiq/appColors.dart';
import '../../controller/contractor_controller.dart';
import '../../controller/customer_controller.dart';
import '../../controller/expense_category_controller.dart';
import '../../controller/project_controller.dart';
import '../../controller/staff_user_controller.dart';
import '../../controller/supplier_controller.dart';
import '../../controller/tool_listing_controller.dart';

class ToolListScreen extends StatelessWidget {
  StaffUserController staffUserController = Get.put(StaffUserController());
  ToolListingController  toolListingController=Get.put(ToolListingController());
  SupplierController supplierController=Get.put(SupplierController());
  CustomerController customerController=Get.put(CustomerController());
  ContractorController contractorController=Get.put(ContractorController());
  ExpenseCategory expenseCategory=Get.put(ExpenseCategory());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          body: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation: 0.5,
                  child: Container(
                    height: 89.h,
                    decoration: const BoxDecoration(
                      color: AppColors.appBarColor,
                    ),
                    child: Center(
                        child: Row(
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            width: 24.w,
                            height: 24.h,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("asset/icon/back.png"))),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 29.w,
                          height: 29.h,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("asset/image/icon.png"))),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "MSP",
                          style: TextStyle(
                              fontSize: 24.sp, color: const Color(0xff2B3D5F)),
                        ),
                        const Expanded(child: SizedBox()),
                        Container(
                          width: 16.w,
                          height: 20.h,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("asset/icon/apbarIcon3.png"))),
                        ),
                        SizedBox(
                          width: 27.w,
                        ),
                      ],
                    )),
                  ),
                ),
               Container(
                 height: Get.height*8,
                 padding: EdgeInsets.symmetric(horizontal: 10.h),
                 child: ListView.separated(
                   physics:const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                     itemCount: toolListingController.toolData.length,
                   itemBuilder: (context,index){
                   return  containerFunction(toolListingController.toolData[index],index);
                 },

                     separatorBuilder: (context,index){
                  return     SizedBox(height: 5.h,);
                }

                ),
               )
              ],
            ),
          )),
    );
  }

  Widget containerFunction(Map map,index) {
    return Card(
      elevation: 2,
      child: Container(
        height: 162.h,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0xffD9D9D9),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 27.w),
          child: Row(
            children: [
              Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(map['imagePath']))),
              ),
              SizedBox(
                width: 25.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 37.h),
                    child: Text(
                      map['title'],
                      style: TextStyle(fontSize: 24.sp),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 93.w,
                        height: 35.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff37B899),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.w))),
                          onPressed: () {
                            toolListingController.gotoListingScreen(index);
                          },
                          child: Text("${map['title']} List",
                              style: TextStyle(fontSize: 10.sp)),
                        ),
                      ),

                      SizedBox(
                        width: 5.w,
                      ),

                      SizedBox(
                        width: 93.w,
                        height: 35.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blueColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.w))),
                          onPressed: () {
                            toolListingController.goToAddScreen(index);
                          },
                          child: Text(
                            "Add ${map['title']}",
                            style: TextStyle(fontSize: 10.sp),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
