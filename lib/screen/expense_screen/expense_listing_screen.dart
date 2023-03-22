import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/appColors.dart';
import '../../widget/form_apbar.dart';
import '../../widget/myFloatingButton.dart';
import '../supplier_screen/SupplierFormScreen.dart';
import 'expense_form_screen.dart';

class ExpenseListingScreen extends StatefulWidget {
  const ExpenseListingScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseListingScreen> createState() => _ExpenseListingScreenState();
}

class _ExpenseListingScreenState extends State<ExpenseListingScreen> {
  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();

  // List<Color> towColor = [AppColors.appColorRed, AppColors.appColorGreen];
  // late int colorVariable;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // colorVariable = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: MyFloationButton(
              width: 210.w,
              height: 50.h,
              label: "Add New Expense",
              onPressFloating: () {
                Get.to(const ExpenseScreen());
              }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormApbar(label: "Expense List"),
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
                          width: 1234.w,
                          child: ListView.separated(
                            shrinkWrap: true,
                            //physics: const NeverScrollableScrollPhysics(),
                            itemCount: 30,
                            itemBuilder: (context, index) {
                              return myTableRow(index);
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
    ));
  }

  Widget tableHead() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 10.w,right: 10.w),
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
                child: Text("Project",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Center(
                child: Text("Contrator/Supplier",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Center(
                child: Text("Paid Via",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Center(
                child: Text("Exp. Date",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Center(
                child: Text("Type",
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
      padding: EdgeInsets.only(left: 10.w, top: 5.h,right: 10.w),
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 1.w)),
        child: Row(
          children: [
            Container(
                width: 43.w, child: Center(child: Text(count.toString()))),
            myVerticalDivider(Colors.black54),
            SizedBox(
                width: 150.w, child: Center(child: Text("My New Project"))),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 150.w,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New Supplier",
                      style: TextStyle(color: AppColors.appColorRed),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Electric",
                      style: TextStyle(
                        color: AppColors.appColorGreen,
                      ),
                    )
                  ],
                ),
              ),
            ),
            myVerticalDivider(Colors.black54),
            SizedBox(
                width: 150.w,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 2.w, color: Color(0xff476EBE))),
                      child: Center(
                        child: Text(
                          "Cash",
                          style: TextStyle(
                              color: Color(0xff476EBE),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      width: 100.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: Color(0xff476EBE),
                      ),
                      child: Center(
                        child: Text("Attachment",
                            style: TextStyle(color: AppColors.whiteColor)),
                      ),
                    )
                  ],
                ))),
            myVerticalDivider(Colors.black54),
            SizedBox(width: 150.w, child: Center(child: Text("13/03/2022"),),),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 150.w,
              child:  Center(
                  child: Container(
                width: 100.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: AppColors.appColorRed,
                ),
                child: Center(
                  child: Text("Attachment",
                      style: TextStyle(color: AppColors.whiteColor)),
                ),
              )),
            ),
            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 150.w,
              child:  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Rana Zain",
                      style: TextStyle(color: AppColors.appColorRed),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Created: 10/8/2022",
                      style: TextStyle(
                        color: AppColors.appColorGreen,
                      ),
                    )
                  ],
                ),
              ),
            ),

            myVerticalDivider(Colors.black54),
            Container(
              width: 150.w,
              child: Center(
                child: Container(
                  width: 80.w,
                  height: 27.h,
                  decoration: BoxDecoration(color: AppColors.appColorRed),
                  child: Center(
                    child: Text("Action"),
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
