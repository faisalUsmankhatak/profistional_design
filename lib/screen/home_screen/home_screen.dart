import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profistional_design/widget/my_field_button.dart';

import '../../app_confiq/appColors.dart';
import '../../controller/project_controller.dart';
import '../../widget/myFloatingButton.dart';
import '../add_new_form_screen/tool_listing_screen.dart';
import '../expense_screen/expense_listing_screen.dart';
import '../project_screen/project_form_screen.dart';
import '../project_screen/project_listing_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProjectController projectController=Get.put(ProjectController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          appBar: PreferredSize(
            preferredSize: Size.fromHeight(89.h),
            child: AppBar(
              backgroundColor: AppColors.appBarColor,
              elevation: 0,
              leading: Padding(
                padding: EdgeInsets.only(left: 28.w, top: 20.h),
                child: Container(
                  width: 29.w,
                  height: 29.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/image/icon.png"))),
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Text(
                  "MSP",
                  style: TextStyle(
                      fontSize: 24.sp, color: const Color(0xff2B3D5F)),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Container(
                    width: 16.w,
                    height: 20.h,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("asset/icon/profile.png"))),
                  ),
                ),
                SizedBox(
                  width: 27.w,
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(26.w, 20.h, 26.w, 16.h),
                  child: InkWell(
                    onTap: () {
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
                                height: 170.h,
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
                                      child:
                                      MyFieldButton(
                                          buttonText: "Add New Project",fontSize: 20.sp,
                                          bodyColor: AppColors.blueColor,
                                          onTap: () async {
Get.to(ProjectFormScreen());

                                          }

                                      ),

                                    ),
                                    SizedBox(height: 12.h,),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                                      child:
                                      MyFieldButton(
                                          buttonText: "Project Listing",fontSize: 20.sp,
                                          bodyColor: AppColors.blueColor,
                                          onTap: () async {
Get.to(const ProjectListingScreen());

                                          }

                                      ),

                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: myList("asset/icon/project_image.png", "Project",
                        AppColors.blueColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 16.h),
                  child: InkWell(
                    onTap: (){
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
                                height: 170.h,
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
                                      child:
                                          MyFieldButton(
                                            buttonText: "Add New Expense",fontSize: 20.sp,
                                              bodyColor: AppColors.appColorRed,
                                            onTap: () async {


                                              }

                                            ),

                                    ),
                                    SizedBox(height: 12.h,),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                                      child:
                                      MyFieldButton(
                                          buttonText: "Expense Listing",fontSize: 20.sp,
                                          bodyColor: AppColors.appColorRed,
                                          onTap: () async {


                                          }

                                      ),

                                    )
                                  ],
                                ),
                              ),
                            );
                          });


                    },
                    child: myList("asset/icon/expense_image.png", "Expense",
                        const Color(0xffD45757)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 16.h),
                  child: InkWell(
                    onTap: (){
                      Get.to( ToolListScreen());
                    },
                    child: myList("asset/icon/tool_image.png", "Tools",
                        const Color(0xff37B899)),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  // Widget containerFunction(String imageUrl, String name, Widget navigate,
  //     String firstButtonTitle, String secondButtonTitle) {
  //   return Container(
  //     height: 162.h,
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(width: 2, color: Colors.blue)),
  //     child: Padding(
  //       padding: EdgeInsets.only(left: 27.w),
  //       child: Row(
  //         children: [
  //           Container(
  //             width: 80.w,
  //             height: 80.h,
  //             decoration: BoxDecoration(
  //                 image: DecorationImage(image: AssetImage(imageUrl))),
  //           ),
  //           SizedBox(
  //             width: 25.w,
  //           ),
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               Padding(
  //                 padding: EdgeInsets.only(top: 37.h),
  //                 child: Text(
  //                   name,
  //                   style: TextStyle(fontSize: 24.sp),
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 12.h,
  //               ),
  //               Row(
  //                 children: [
  //                   // MyFieldButton(bodyColor: Color(0x246BFD),buttonText: "Add Project",),
  //                   MyFieldButton(
  //                       bodyColor: Color(0xff37B899),
  //                       buttonText: firstButtonTitle,
  //                       width: 88,
  //                       height: 27,
  //                       radius: 10,
  //                       onTap: () {
  //                         Get.to(navigate);
  //                       }),
  //                   SizedBox(
  //                     width: 5.w,
  //                   ),
  //                   MyFieldButton(
  //                       bodyColor: Color(0xff246BFD),
  //                       buttonText: secondButtonTitle,
  //                       width: 88,
  //                       height: 27,
  //                       radius: 10),
  //                 ],
  //               )
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget myList(String url, String name, Color myColor) {
    return Container(
      height: 162.h,
      decoration: BoxDecoration(
          color: myColor,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Center(
        child: Row(
          children: [
            Container(
                width: 158.w,
                height: 158.h,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(url)))),
            SizedBox(
              height: 12.h,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 50.sp, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
