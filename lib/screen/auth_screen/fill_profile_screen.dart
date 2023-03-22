import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profistional_design/widget/my_field_button.dart';
import 'package:profistional_design/widget/my_text_field.dart';
class FillProfile extends StatefulWidget {
  const FillProfile({Key? key}) : super(key: key);

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {
  TextEditingController fullName=TextEditingController();
  TextEditingController userName=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 20.w,top:21.h, ),
              child: Row(children: [
                Container(
                  width: 24.w,height: 24.h,
                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("asset/icon/back.png"))),
                ),
                SizedBox(width: 18.w,),
                Text("Fill your Profile",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w700),)

              ],),
            ),
SizedBox(height: 25.h,),
            Stack(
              children: [
                Container(
                  width: 142.w,height: 142.h,
                  decoration:  const BoxDecoration(image: DecorationImage(image: AssetImage("asset/icon/profile.png"))),
                ),
               Padding(
               
                 padding: const EdgeInsets.only(left: 85,top: 85),
                 child: Container(
                   width: 24.w,height: 24.h,
                   decoration: const BoxDecoration(color: Colors.blue,
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5),bottomRight: Radius.circular(5))
                  ),
                 child: const Icon(Icons.edit_outlined,size: 15,color: Colors.white),),
               ),


              ],
            ),
            SizedBox(height: 25.h,),
            Padding(padding:const EdgeInsets.symmetric(horizontal: 43) ,
                child: MyTextField(controller: fullName, label: "Full name",prefixIcon: "asset/icon/fullName.png",)),
            SizedBox(height: 30.h,),
            Padding(padding:const EdgeInsets.symmetric(horizontal: 43) ,
                child: MyTextField(controller: userName, label: "User Name",prefixIcon: "asset/icon/person.png",)),
            SizedBox(height: 30.h,),
            Padding(padding:const EdgeInsets.symmetric(horizontal: 43) ,
                child: MyTextField(controller: userName, label: "Date of Birth",prefixIcon: "asset/icon/date.png",)),
            SizedBox(height: 30.h,),
            Padding(padding:const EdgeInsets.symmetric(horizontal: 43) ,
                child: MyTextField(controller: userName, label: "Email",prefixIcon: "asset/icon/email.png",)),
            SizedBox(height: 30.h,),
            Padding(padding:const EdgeInsets.symmetric(horizontal: 43) ,
                child: MyTextField(controller: userName, label: "phone Number",prefixIcon: "asset/icon/phone.png",)),
            SizedBox(height: 30.h,),
            Padding(padding:const EdgeInsets.symmetric(horizontal: 43) ,
                child: MyTextField(controller: userName, label: "Address",prefixIcon: "asset/icon/address.png",)),
            SizedBox(height: 40.h,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 42),
                child: MyFieldButton(radius: 100,height: 55.h,buttonText: "Continue",)),
            SizedBox(height: 32.h,),
          ],
        ),
      ),
    ));
  }
}
