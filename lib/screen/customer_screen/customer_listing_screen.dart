import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:profistional_design/app_confiq/styles.dart';

import '../../app_confiq/appColors.dart';
import '../../controller/customer_controller.dart';
import '../../model/customer_model.dart';
import '../../widget/form_apbar.dart';
import '../../widget/myFloatingButton.dart';
import 'customer_form_screen.dart';

class CustomerListingScreen extends StatelessWidget {
  CustomerController customerController = Get.find();
  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();
  List<Color> towColor = [AppColors.appColorRed, AppColors.appColorGreen];
  int colorVariable = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyFloationButton(
          label: "Add New Customer",
          width: 210.w,
          height: 50.h,
          onPressFloating: () {
            Get.to(CustomerFormScreen());
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormApbar(label: "Cutomer List"),
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
                          width: 1055.w,
                          child: ListView.separated(
                            shrinkWrap: true,
                            //physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                customerController.customerModelList.length!,
                            itemBuilder: (context, index) {
                              if (colorVariable == 2) {
                                colorVariable = 0;
                              }
                              return myTableRow(index,
                                  customerController.customerModelList[index]!);
                            },
                            separatorBuilder: (context, index) {
                              colorVariable++;
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
              child: Center(
                child: Text("Owner Name",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 130.w,
              child: Center(
                child: Text("Tel. No",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 160.w,
              child: Center(
                child: Text("Email",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Center(
                child: Text("Created",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Center(
                child: Text("Address",
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

  Widget myTableRow(int count, CustomerModel customerModel) {
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
              padding: EdgeInsets.only(left: 5.sp),
              child: Text(
                (count + 1).toString(),
                style: AppStyles.listingStyle(),
              ),
            ),
            myVerticalDivider(Colors.black54),
            Container(
              width: 150.w,
              child: Text(customerModel.name!, style: AppStyles.listingStyle()),
            ),
            myVerticalDivider(Colors.black54),
            Container(
              width: 130.w,
              child: Text(
                customerModel.phone!,
                style: AppStyles.listingStyle(),
              ),
            ),
            myVerticalDivider(Colors.black54),
            Container(
              width: 160.w,
              child: Text(
                customerModel.email!,
                style: TextStyle(
                    color: AppColors.appColorGreen,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            myVerticalDivider(Colors.black54),
            Container(
              width: 150.w,
              child: Text(
                customerModel.createdDate!,
                style: TextStyle(
                    color: AppColors.appColorRed,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            myVerticalDivider(Colors.black54),
            Container(
              width: 150.w,
              child: Text(
                customerModel.address!,
                style: AppStyles.listingStyle(),
              ),
            ),
            myVerticalDivider(Colors.black54),
            SizedBox(
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
                          decoration: const BoxDecoration(
                              color: AppColors.appColorGreen),
                          child: const Center(
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
