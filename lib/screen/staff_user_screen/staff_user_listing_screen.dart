import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:profistional_design/app_confiq/styles.dart';
import 'package:profistional_design/screen/staff_user_screen/staff_form_screen.dart';

import '../../app_confiq/appColors.dart';
import '../../controller/staff_user_controller.dart';
import '../../model/staff_user_model.dart';
import '../../widget/form_apbar.dart';
import '../../widget/myFloatingButton.dart';

class StaffListingScreen extends StatelessWidget {
  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();
  StaffUserController staffUserController = Get.find();
  List<Color> towColor = [AppColors.appColorGreen, Colors.yellow];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyFloationButton(
          width: 210.w,
          height: 50.h,
          label: "Add New User",
          onPressFloating: () {
            Get.to(StaffFormScreen());
          }),
      body: Obx(
        () => staffUserController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    FormApbar(label: "Staff User List"),
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
                                  height: Get.height * 0.8,
                                  width: 1085.w,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    //physics: const NeverScrollableScrollPhysics(),
                                    itemCount: staffUserController
                                        .contractorList.length,
                                    itemBuilder: (context, index) {
                                      return myTableRow(
                                          index,
                                          staffUserController
                                              .contractorList[index]);
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 2.h,
                                      );
                                    },
                                  ),
                                )
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
      ),
    ));
  }

  Widget tableHead() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
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
              child: Text("Name",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp)),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Text("Email",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp)),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Text("Phone",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp)),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Text("Reg Date",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp)),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 130.w,
              child: Text("Role",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp)),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 190.w,
              child: Text("Action",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp)),
            ),
          ],
        ),
      ),
    );
  }

  Widget myTableRow(int count, StaffUserModel? staffUserModel) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 5.h, right: 10.w),
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 1.w)),
        child: Row(
          children: [
            Container(
              width: 43.w,
              child: Center(
                child: Text(
                  count.toString(),
                ),
              ),
            ),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 150.w,
              child:
                  Text(staffUserModel!.name!, style: AppStyles.listingStyle()),
            ),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 150.w,
              child: Text(
                staffUserModel.email == null ? "Nlll" : staffUserModel.email!,
                style: AppStyles.listingStyle(),
              ),
            ),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 150.w,
              child: Text(
                staffUserModel.phone == null ? "Nlll" : staffUserModel.phone!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueColor,
                  fontSize: 12.sp,
                ),
              ),
            ),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 150.w,
              child: Center(
                  child: Text(
                staffUserModel.createdDate!,
                style: const TextStyle(color: AppColors.appColorGreen),
              )),
            ),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 130.w,
              child:
              Center(
                child: Container(
                  width: 80.w,
                  height: 22.h,
                  decoration:
                   BoxDecoration(color: count==0? AppColors.appColorGreen:Colors.yellow),
                  child:  Center(
                    child: Text(count==0?"Administrator":"Operator", style: TextStyle(
                        color: Colors.black, fontSize: 12.sp),),
                  ),
                ),
              ),
            ),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 190.w,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 80.w,
                      height: 22.h,
                      decoration:
                          const BoxDecoration(color: AppColors.appColorRed),
                      child:  Center(
                        child: Text("Accessibilities", style: TextStyle(
                            color: AppColors.whiteColor, fontSize: 12.sp),),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Container(
                        width: 40.w,
                        height: 22.h,
                        decoration: const BoxDecoration(
                            color: AppColors.appColorGreen),
                        child: Center(
                          child: Text(
                            "Edit",
                            style: TextStyle(
                                color: AppColors.whiteColor, fontSize: 12.sp),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Container(
                        width: 40.w,
                        height: 22.h,
                        decoration:
                            const BoxDecoration(color: AppColors.appColorRed),
                        child: Center(
                          child: Text(
                            "Delete",
                            style: TextStyle(
                                color: AppColors.whiteColor, fontSize: 12.sp),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                  ],
                ),
              ),
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
