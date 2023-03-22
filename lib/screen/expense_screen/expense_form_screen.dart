import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import '../../app_confiq/appColors.dart';
import '../../widget/form_apbar.dart';
import '../../widget/my_field_button.dart';
import '../../widget/my_second_text_field.dart';
import '../../widget/new_project_alert_dialog.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  List<String> customerLIst = ['Select Role', "Faisal", "Kamal", "Akmal"];
  String defaultRoleValue = "Select Role";
  List<String> paymentLIst = ['Select Payment', "Faisal", "Kamal", "Akmal"];
  String defaultPaymentValue = "Select Payment";
TextEditingController dateController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
        children: [
            FormApbar(label: "Add New Expense"),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(
                height: 48.h,
                width: 380.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.blueColor),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                  child: Text("Expense",
                      style: TextStyle(
                          fontSize: 14.sp, color: AppColors.whiteColor)),
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: MySecondTextField(lablel: "Name"),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: DropdownButtonFormField<String>(
                  isDense: true,
                  value: defaultRoleValue,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 2, color: Colors.black12),
                      )),
                  items: customerLIst.map((e) {
                    return DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      defaultRoleValue = value!;
                    });
                  },
                )),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  Expanded(
                      child: MySecondTextField(
                        textController: dateController,
                    lablel: 'Date',
                    suffixIcon: "asset/icon/date.png",
                    suffixIconTab: () async {
                      DateTime? datePicked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2025));
                      if(datePicked!=null){
                        setState(() {
                         // dateController.text=datePicked.toString()!;
                          dateController.text=   '$datePicked.toLocal()'.split(' ')[0].toString();
                        });
                      }
                    },
                  )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                      child: MySecondTextField(
                    lablel: 'Amount',
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: DropdownButtonFormField<String>(
                  isDense: true,
                  value: defaultPaymentValue,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 2, color: Colors.black12),
                      )),
                  items: paymentLIst.map((e) {
                    return DropdownMenuItem<String>(
                      child: Text(e),
                      value: e,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      defaultPaymentValue = value!;
                    });
                  },
                )),
            SizedBox(
              height: 24.h,
            ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: MySecondTextField(lablel: "Expense Attachment (optional)",
                suffixIcon: "asset/icon/file_upload.png",suffixIconTab: ()async{
                  FilePickerResult? result = await FilePicker.platform.pickFiles();

                }),

          ),
          SizedBox(
            height: 24.h,
          ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: MySecondTextField(lablel: "Expense Details",height: 30.h),
            ),
            SizedBox(height: 50.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 44.w),
              child: MyFieldButton(buttonText: "Add Expense",height: 55,radius: 100,onTap: (){GetDialog();},bodyColor: AppColors.blueColor),
            ),
        ],
      ),
          )),
    );
  }
}
