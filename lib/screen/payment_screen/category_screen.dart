import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:profistional_design/widget/my_field_button.dart';

import '../../app_confiq/appColors.dart';
import '../../widget/form_apbar.dart';
import '../../widget/my_second_text_field.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          FormApbar(label: "Category"),
          SizedBox(
            height: 24.h,
          ),
          Scrollbar(
            controller: controller2,
            child: SingleChildScrollView(
              controller: controller2,
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      tableHead(),
                      //myTableRow(1),
                      SizedBox(
                        height: Get.height*0.8,
                        width:  555.w,
                        child: ListView.separated(
                          shrinkWrap: true,
                          //physics: const NeverScrollableScrollPhysics(),
                          itemCount: 30,
                          itemBuilder: (context, index) {
                            return myTableRow(index);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 2.h,);
                          },
                        ),
                      )
                    ],
                  )),
            ),
          )
        ],
      ),
    ));
  }
  Widget tableHead() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 10),
      child: Container(
        height: 40.h,
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 2.w),
              child: SizedBox(
                width: 43.w,
                child: Center(
                  child: Text(
                    "S.No",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp),
                  ),
                ),
              ),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Center(
                child: Text("Payment Method",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Center(
                child: Text("Created Date",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Center(
                child: Text("Action",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myTableRow(int count) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 5.h),
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 1.w)),
        child: Row(
          children: [
            Container(width: 43.w, child:  Center(child: Text(count.toString()))),
            myVerticalDivider(Colors.black54),
            SizedBox(width: 150.w, child: const Center(child: Text("cash"))),
            myVerticalDivider(Colors.black54),
            SizedBox(
                width: 150.w,
                child: const Center(child: Text("18/10/2022 10 AM"))),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 150.w,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 7.w,),
                    InkWell(
                      child: Container(
                        width: 60.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                            color: AppColors.appColorGreen,
                            borderRadius: BorderRadius.circular(5.sp)
                        ),
                        child: const Center(
                          child: Text('Edit',style: TextStyle(color: AppColors.whiteColor),),
                        ),
                      ),
                    ),
                    SizedBox(width: 7.w,),
                    InkWell(
                      child: Container(
                        width: 60.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                            color: AppColors.appColorRed,
                            borderRadius: BorderRadius.circular(5.sp)
                        ),
                        child: const Center(
                          child: Text('Delete',style: TextStyle(color:AppColors.whiteColor ), ),
                        ),
                      ),
                    ),
                  ],
                ),),
            ),
          ],
        ),
      ),
    );
  }

  Widget myVerticalDivider(Color mycolor) {
    return VerticalDivider(
      color: mycolor,
      thickness: 1.5,
    );
  }
}
