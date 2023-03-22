import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:profistional_design/screen/project_screen/project_form_screen.dart';

import '../../app_confiq/appColors.dart';
import '../../controller/project_controller.dart';
import '../../widget/form_apbar.dart';
import '../../widget/myFloatingButton.dart';

class ProjectListingScreen extends StatefulWidget {
  const ProjectListingScreen({Key? key}) : super(key: key);

  @override
  State<ProjectListingScreen> createState() => _ProjectListingScreenState();
}

class _ProjectListingScreenState extends State<ProjectListingScreen> {
  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();
  ProjectController projectController=Get.find();
  List<Color> towColor = [AppColors.appColorRed, AppColors.appColorGreen];
  late int colorVariable;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    colorVariable = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyFloationButton(
          width: 250.w,
          height: 60.h,
          label: "Add New Project",
          onPressFloating: () {
            Get.to(const ProjectFormScreen());
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormApbar(label: "Project List"),
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
                          width: 1265.w,
                          child: ListView.separated(
                            shrinkWrap: true,
                            //physics: const NeverScrollableScrollPhysics(),
                            itemCount: 30,
                            itemBuilder: (context, index) {
                              if (colorVariable == 2) {
                                colorVariable = 0;
                              }
                              return myTableRow(index);
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
                child: Text("Project",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Center(
                child: Text("Customer Name",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Center(
                child: Text("Proj. Value",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Center(
                child: Text("Received",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Center(
                child: Text("Expense",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
            ),
            myVerticalDivider(Colors.white24),
            SizedBox(
              width: 150.w,
              child: Center(
                child: Text("Details",
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
      padding: EdgeInsets.only(left: 10.w, top: 5.h, right: 10.w),
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
                width: 150.w,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Project Name"),
                    SizedBox(
                      height: 5.h,
                    ),

                  ],
                ))),
            myVerticalDivider(Colors.black54),
            SizedBox(
                width: 150.w,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Gull Khan"),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "faisalusmankktk@gmail.com",
                      style: TextStyle(fontSize: 14.sp),
                    )
                  ],
                ))),
            myVerticalDivider(Colors.black54),
            SizedBox(width: 150.w, child: Center(child: Text("100000"))),
            myVerticalDivider(Colors.black54),
            SizedBox(
                width: 150.w,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Recevied"),

                  ],
                ))),
            myVerticalDivider(Colors.black54),
            SizedBox(width: 150.w, child: const Center(child: Text("100000"))),
            myVerticalDivider(Colors.black54),
            SizedBox(width: 150.w, child: const Center(child: Text("100000"))),

            myVerticalDivider(Colors.black54),
            SizedBox(
              width: 150.w,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 7.w,
                    ),
                    InkWell(
                      child: Container(
                        width: 80.w,
                        height: 29.h,
                        decoration: BoxDecoration(
                            color: AppColors.appColorRed,
                            borderRadius: BorderRadius.circular(5.sp)),
                        child: const Center(
                          child: Text(
                            'Action',
                            style: TextStyle(color: AppColors.whiteColor),
                          ),
                        ),
                      ),
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
