import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:profistional_design/app_confiq/styles.dart';

import '../../app_confiq/appColors.dart';
import '../../controller/contractor_controller.dart';
import '../../model/contractor_model.dart';
import '../../widget/form_apbar.dart';
import '../../widget/myFloatingButton.dart';
import 'contractor_form_screen.dart';

class ContractorListingScreen extends StatelessWidget {
  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();
  List<Color> towColor = [AppColors.appColorRed, AppColors.appColorGreen];
  late int colorVariable;
  ContractorController contractorController = Get.put(ContractorController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: MyFloationButton(
            width: 210.w,
            height: 50.h,
            label: "Add New Contractor",
            onPressFloating: () {
              Get.to(ContractorFormScreen());
            }),
        body: Obx(
          () => contractorController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      FormApbar(
                        label: "Sub-Contractor List",
                      ),
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
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  //myTableRow(1),
                                  SizedBox(
                                    height: Get.height * 0.8,
                                    width: 1065.w,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      //physics: const NeverScrollableScrollPhysics(),
                                      itemCount: contractorController
                                          .contractorList!.length!,
                                      itemBuilder: (context, index) {
                                        return myTableRow(
                                            index,
                                            contractorController
                                                .contractorList![index]!);
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
      ),
    );
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
                child: Text(
                  "S.No",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp),
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
              child: Text("Tel. Number",
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
              child: Text("Address",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp)),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Text("created",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp)),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Text("Action",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp)),
            ),
          ],
        ),
      ),
    );
  }

  Widget myTableRow(int count, ContractorModel contractor) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 5.h, right: 10.w),
      child: Container(
        height: 45.h,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 1.w)),
        child: Row(
          children: [
            Container(
              width: 43.w,
              padding: EdgeInsets.only(left: 3.sp),
              child: Text(
                count.toString(),
                style: AppStyles.listingStyle(),
              ),
            ),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 150.w,
              child: Text(contractor.name!, style: AppStyles.listingStyle()),
            ),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 150.w,
              child: Text(contractor.phone!, style: AppStyles.listingStyle()),
            ),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 150.w,
              child: Text(
                contractor.email!,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.appColorGreen,
                ),
              ),
            ),
            myVerticalDivider(Colors.black54),
            Container(
              width: 150.w,
              padding: EdgeInsets.only(top: 3.h),
              child: Text(
                contractor.address!,
                  style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.appColorGreen,
              ),
              ),
            ),
            myVerticalDivider(Colors.black54),
            Container(
              width: 150.w,
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Text(
                contractor.createdDate!,
                style: TextStyle(color: AppColors.blueColor),
              ),
            ),
            myVerticalDivider(Colors.black54),
            Container(
              width: 150.w,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: 80.w,
                          height: 27.h,
                          decoration:
                              BoxDecoration(color: AppColors.appColorGreen),
                          child: Center(
                            child: Text("Edit"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: Container(
                          width: 80.w,
                          height: 27.h,
                          decoration:
                              BoxDecoration(color: AppColors.appColorRed),
                          child: Center(
                            child: Text("Delete"),
                          ),
                        ),
                      ),
                    ],
                  ),
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
