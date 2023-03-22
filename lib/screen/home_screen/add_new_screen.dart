import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AddNewScreen extends StatefulWidget {
  const AddNewScreen({Key? key}) : super(key: key);

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  String defaultValue="Project";
  List<String> itemList=["Project","Customer","Supplier","Staff Users",];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(

      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 20.w,top: 16.h),
            child: Row(
              children: [
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: const BoxDecoration(
                      color: Color(0xffF5F5F5),
                      image: DecorationImage(image: AssetImage("asset/icon/back.png"))),
                ),
                SizedBox(width: 20.w,),
                Text("Add New",style: TextStyle(fontSize: 16.sp,color: Color(0xff2B3D5F)),),
              ],
            ),
          ),
          SizedBox(height: 24.h,),
        DropdownButton<String>(
            value: defaultValue,
isExpanded: true,
            icon: Icon(Icons.arrow_drop_down),
            items: itemList.map((itemValue){
return DropdownMenuItem<String>(value: itemValue,
child: Text(itemValue),);
            }).toList(),
            
            onChanged: (value){
              setState(() {
                defaultValue=value!;
              });
            })


        ],
      ),
      ),
    );
  }
}
