import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:profistional_design/app_confiq/appColors.dart';

import '../../widget/alert_dialog.dart';
import '../../widget/my_field_button.dart';
import '../../widget/my_second_text_field.dart';
import '../../widget/my_text_field.dart';
import '../../widget/new_project_alert_dialog.dart';

class ProjectFormScreen extends StatefulWidget {
  const ProjectFormScreen({Key? key}) : super(key: key);

  @override
  State<ProjectFormScreen> createState() => _ProjectFormScreenState();
}

class _ProjectFormScreenState extends State<ProjectFormScreen> {
  String defaultValue = "Customer";
  TextEditingController projectController = TextEditingController();
  List<String> customerLIst = ['Customer', "Faisal", "Kamal", "Akmal"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(),
              child: Container(
                height: 48.h,
                color: AppColors.blueColor,
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child:  Padding(
                        padding:  EdgeInsets.only(left: 20.w),
                        child:const Icon(Icons.arrow_back,color: AppColors.whiteColor,size: 20),
                      ),

                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "Add New Project",
                      style: TextStyle(fontSize: 16.sp, color: AppColors.whiteColor),
                    ),
                    const Expanded(child: SizedBox()),
                    Container(width: 16.w,height: 16.h,decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("asset/icon/appProjectImage.png"))
                    ),),
                    SizedBox(width: 20.h,)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
             child: MySecondTextField(lablel: "Project"),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: DropdownButtonFormField<String>(
               
                  isDense: true,
                  value: defaultValue,
                  decoration:  const InputDecoration(
contentPadding: EdgeInsets.all(15),
                      border: OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2, color: Colors.black12),
                  )),
                  items: customerLIst.map((e) {

                    return DropdownMenuItem<String>(
                      child: Text(e),
                      value: e,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      defaultValue = value!;
                    });
                  },
                )),
            SizedBox(height: 24.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: MySecondTextField(lablel: "Project Value"),
            ),
            SizedBox(height: 24.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: MySecondTextField(lablel: "Details"),
            ),
            SizedBox(height: 50.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 44.w),
              child: MyFieldButton(buttonText: "Add new project",height: 55,radius: 100,onTap: (){GetDialog();},bodyColor: AppColors.blueColor),
            )
          ],
        ),
      ),
    ));
  }
}
