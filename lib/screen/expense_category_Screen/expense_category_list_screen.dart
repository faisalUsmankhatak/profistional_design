import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/styles.dart';
import '../../controller/expense_category_controller.dart';
import '../../model/expense_category_model.dart';
import '../../widget/form_apbar.dart';
import '../../widget/myFloatingButton.dart';
import '../../widget/my_field_button.dart';
import '../../widget/my_second_text_field.dart';
class ExpenseCategoryList extends StatelessWidget {
  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();
  ExpenseCategory expenseCategory=Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: MyFloationButton(
              width: 210.w,
              height: 50.h,
              label: "Add New Category",
              onPressFloating: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.w)),
                    isScrollControlled: true,
                    constraints: BoxConstraints(
                      maxWidth: Get.width * 0.97,
                      // maxHeight: Get.height*0.4.h
                    ),
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: Container(
                          height: 200.h,
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(10.w)
                          // ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.h),
                                child: MySecondTextField(
                                    lablel: "Category",
                                    textController:expenseCategory.expenseCategoryController.value
                                   ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.h),
                                child: Obx(
                                      () =>expenseCategory.isLoadingButton.value?
                                       const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                      : MyFieldButton(
                                      buttonText: "Add Category",
                                      onTap: () async {
                                        if(expenseCategory.formValidation(context)){
                                          await expenseCategory.addExpenseCategory();

                                        }

                                      }),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
                // Get.to(const ContractorFormScreen());
              }),
          body: Obx(
                () => expenseCategory.isLoading.value
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : SingleChildScrollView(
              child: Column(
                children: [
                  FormApbar(label: "Payment Methods"),
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
                                width: 263.w,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  //physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                  expenseCategory.expenseCategoryList.length!,
                                  itemBuilder: (context, index) {
                                    return myTableRow(
                                        index,
                                        expenseCategory
                                            .expenseCategoryList[index]!,
                                       );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 2.h,
                                    );
                                  },
                                ),
                              ),
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
        height: 50.h,
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
              width: 180.w,
              child: Text("Payment Method",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp),),
            ),


          ],
        ),
      ),
    );
  }

  Widget myTableRow(int count, ExpenseCategoryModel expenseCategoryModel) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 5.h, right: 10.w),
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 1.w)),
        child: Row(
          children: [
            Container(
                width: 43.w, child: Center(child: Text(count.toString(),style: AppStyles.listingStyle(),))),
            myVerticalDivider(Colors.black54),
            SizedBox(width: 150.w, child: Text(expenseCategoryModel.title!,style: AppStyles.listingStyle(),)),


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

