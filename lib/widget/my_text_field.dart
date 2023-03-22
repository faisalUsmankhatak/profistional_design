import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_confiq/appColors.dart';
import '../app_confiq/styles.dart';
class MyTextField extends StatelessWidget {
  TextEditingController controller;
  String label;
  String? suffixIcon;
  String? prefixIcon;
  Color? fillColor;
  GestureTapCallback? suffixIconTab;
  bool? obscureText;


  MyTextField({required this.controller, required this.label, this.suffixIcon, this.prefixIcon,
    this.fillColor,this.suffixIconTab,this.obscureText});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap:suffixIconTab ,
      child: TextFormField(
        controller: controller,
obscureText: obscureText??false,
        decoration: InputDecoration(
label: Text(label),
          //hintText: label,
          fillColor:AppColors.texFieldColor,

          filled: true,
          labelStyle: AppStyles.formLabelStyle(),
          prefixIcon: prefixIcon==null?const SizedBox(width: 2,height: 2,):Padding(
            padding:  EdgeInsets.only(bottom: 6.h),
            child: Container(
              width: 19.w,height: 15.h,
              decoration:  BoxDecoration(
                image: DecorationImage(image: AssetImage(prefixIcon!))
              ),
            ),
          ),
          suffixIcon: suffixIcon==null?const SizedBox(width: 2,height: 2,):GestureDetector(
             onTap: suffixIconTab,
            child: Container(
              width: 19.w,height: 15.h,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(suffixIcon!))),
            ),
          ),
          disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.w,),
          borderSide: const BorderSide(color: AppColors.texFieldColor)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.w,),
              borderSide: const BorderSide(color:AppColors.texFieldColor)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.w,),
              borderSide: const BorderSide(color: AppColors.texFieldColor)),

        )
      ),
    );
  }
}
