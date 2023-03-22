import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:profistional_design/app_confiq/styles.dart';

import '../../app_confiq/appColors.dart';
import '../../controller/supplier_controller.dart';
import '../../model/supplier_model.dart';
import '../../widget/form_apbar.dart';
import '../../widget/myFloatingButton.dart';
import 'SupplierFormScreen.dart';

class SupplierListingScreen extends StatelessWidget {
  SupplierController supplierController = Get.find();
  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();

  List<Color> towColor = [AppColors.appColorRed, AppColors.appColorGreen];
  late int colorVariable;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: MyFloationButton(
            width: 210.w,
            height: 50.h,
            label: "Add New Supplier",
            onPressFloating: () {
              Get.to(const SupplierFormScreen());
            }),
        body: Obx(
          () => supplierController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      FormApbar(label: "Supplier List"),
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
                                  SizedBox(
                                    height: Get.height * 0.8,
                                    width: 1096.w,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      //physics: const NeverScrollableScrollPhysics(),
                                      itemCount: supplierController
                                          .supplierList.length!,
                                      itemBuilder: (context, index) {
                                        return myTableRow(
                                            index,
                                            supplierController
                                                .supplierList[index]!);
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
              child: Text("Supplier Name",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp)),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Text("Tel. No",
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
              child: Text("Created",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp)),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 180.w,
              child: Text("Action",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp)),
            ),
          ],
        ),
      ),
    );
  }

  Widget myTableRow(int count, SupplierModel supplierModel) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 5.h, right: 10.w),
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 1.w)),
        child: Row(
          children: [
            Container(
              width: 43.w,
              child: Text(
                count.toString(),
                style: AppStyles.listingStyle(),
              ),
            ),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 150.w,
              child: Text(supplierModel.name!, style: AppStyles.listingStyle()),
            ),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 150.w,
              child:
                  Text(supplierModel.phone!, style: AppStyles.listingStyle()),
            ),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 150.w,
              child: Text(supplierModel.email!,
                  style:  TextStyle(
                      color: AppColors.appColorGreen,
                      fontWeight: FontWeight.bold,fontSize: 12.sp)),
            ),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 150.w,
              child: Text(supplierModel.address!,style:  TextStyle(
                  color: AppColors.appColorGreen,
                  fontWeight: FontWeight.bold,fontSize: 12.sp)),
            ),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 150.w,
              child: Text(supplierModel.createdDate!,style:  TextStyle(
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.bold,fontSize: 12.sp)),
            ),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 180.w,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: 20.w,
                          height: 27.h,
                          decoration: const BoxDecoration(
                              color: AppColors.appColorGreen),
                          child: const Center(
                            child: Text("Edit"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Expanded(
                        child: Container(
                          width: 20.w,
                          height: 27.h,
                          decoration:
                              const BoxDecoration(color: AppColors.appColorRed),
                          child: const Center(
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
