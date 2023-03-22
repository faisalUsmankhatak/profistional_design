import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySecondTextField extends StatelessWidget {
  bool? isPasswordVisible;
  String? suffixIcon;
  double? height;
  String lablel;
  TextEditingController? textController;
  GestureTapCallback? suffixIconTab;

  MySecondTextField(
      {required this.lablel,
      this.isPasswordVisible,
      this.height,
      this.suffixIcon,
      this.suffixIconTab,
      this.textController});

  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPasswordVisible ?? false,
      controller: textController,
      decoration: InputDecoration(
          suffixIcon: suffixIcon == null
              ? SizedBox(
                  width: 2,
                  height: 2,
                )
              : InkWell(
                  onTap: suffixIconTab,
                  child: Container(
                    width: 16.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(suffixIcon!))),
                  ),
                ),
          labelText: lablel,
          contentPadding: EdgeInsets.symmetric(
              vertical: height == null ? 19.h : height!.h, horizontal: 10.w),
          isDense: true,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.w))),
    );
  }
}
