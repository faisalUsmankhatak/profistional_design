import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profistional_design/widget/my_field_button.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: Scrollbar(
          controller: controller2,

          child: SingleChildScrollView(
            controller: controller2,
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Padding(
                      padding: EdgeInsets.only(top: 20.h, left: 10),
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.blue,

                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 2.w),
                              child: Container(

                                child: Center(child: Text("S.No",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp),),),
                              ),
                            ),
                            const VerticalDivider(

                              color: Colors.black,
                              thickness: 0.3,
                            ),
                            Container(
                              width: 70.w,
                              child: Center(child: Text("Project",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp)),),
                            ),
                            const VerticalDivider(

                              color: Colors.black,
                              thickness: 0.5,
                            ),
                            Container(
                              width: 70.w,
                              child: Center(child: Text("Owner",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp)),),
                            ),
                            const VerticalDivider(

                              color: Colors.black,
                              thickness: 0.5,
                            ),
                            Container(
                              width: 70.w,
                              child: Center(child: Text("Proj.value",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp)),),
                            ),
                            const VerticalDivider(

                              color: Colors.black,
                              thickness: 0.7,
                            ),
                            Container(
                              width: 70.w,
                              child: Center(child: Text("Received",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp)),),
                            ),
                            const VerticalDivider(

                              color: Colors.black,
                              thickness: 0.5,
                            ),
                            Container(
                              width: 70.w,
                              child: Center(child: Text("Spents",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp)),),
                            ),
                            const VerticalDivider(

                              color: Colors.black,
                              thickness: 0.8,
                            ),
                            Container(
                              width: 70.w,
                              child: Center(child: Text("Balance",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp)),),
                            ),
                            const VerticalDivider(

                              color: Colors.black,
                              thickness: 0.5,
                            ),
                            Container(
                              width: 70.w,
                              child: Center(child: Text("Profit/Loss",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp)),),
                            ),
                            const VerticalDivider(

                              color: Colors.black,
                              thickness: 0.5,
                            ),
                            Container(
                              width: 70.w,
                              child: Center(child: Text("Action",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp)),),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h, left: 10),
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                         border: Border.all(color: Colors.black54,width: 1.w)

                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 2.w),
                              child: Container(

                                child: Center(child: Text("1",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp),),),
                              ),
                            ),
                            const VerticalDivider(

                              color: Colors.black,
                              thickness: 0.3,
                            ),
                            Container(
                              width: 70.w,
                              child: Center(child:Column(
                                children: [
                                  Text("My New Project"),
                                  MyFieldButton(buttonText: "2 contractor",)
                                ],
                              ),
                                  ),),
                           
                            const VerticalDivider(

                              color: Colors.black,
                              thickness: 0.5,
                            ),
                            Container(
                              width: 70.w,
                              child: Center(child: Text("Owner",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp)),),
                            ),
                            const VerticalDivider(

                              color: Colors.black,
                              thickness: 0.5,
                            ),
                            Container(
                              width: 70.w,
                              child: Center(child: Text("Proj.value",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp)),),
                            ),
                            const VerticalDivider(

                              color: Colors.black,
                              thickness: 0.7,
                            ),
                            Container(
                              width: 70.w,
                              child: Center(child: Text("Received",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp)),),
                            ),
                            const VerticalDivider(

                              color: Colors.black,
                              thickness: 0.5,
                            ),
                            Container(
                              width: 70.w,
                              child: Center(child: Text("Spents",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp)),),
                            ),
                            const VerticalDivider(

                              color: Colors.black,
                              thickness: 0.8,
                            ),
                            Container(
                              width: 70.w,
                              child: Center(child: Text("Balance",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp)),),
                            ),
                            const VerticalDivider(

                              color: Colors.black,
                              thickness: 0.5,
                            ),
                            Container(
                              width: 70.w,
                              child: Center(child: Text("Profit/Loss",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp)),),
                            ),
                            const VerticalDivider(

                              color: Colors.black,
                              thickness: 0.5,
                            ),
                            Container(
                              width: 70.w,
                              child: Center(child: Text("Action",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp)),),
                            ),

                          ],
                        ),
                      ),
                    ),





                  ],
                )
              // DataTable(
              //   columns: const [
              //     DataColumn(label: Text('Test')),
              //     DataColumn(label: Text('Test')),
              //     DataColumn(label: Text('Test')),
              //     DataColumn(label: Text('Test')),
              //     DataColumn(label: Text('Test')),
              //   ],
              //   rows: const [
              //     DataRow(
              //       cells: [
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //       ],
              //     ),
              //     DataRow(
              //       cells: [
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //       ],
              //     ),
              //     DataRow(
              //       cells: [
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //       ],
              //     ),
              //     DataRow(
              //       cells: [
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //       ],
              //     ),
              //     DataRow(
              //       cells: [
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //       ],
              //     ),
              //     DataRow(
              //       cells: [
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //       ],
              //     ),
              //     DataRow(
              //       cells: [
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //       ],
              //     ),
              //     DataRow(
              //       cells: [
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //       ],
              //     ),
              //     DataRow(
              //       cells: [
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //       ],
              //     ),
              //     DataRow(
              //       cells: [
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //       ],
              //     ),
              //     DataRow(
              //       cells: [
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //       ],
              //     ),
              //     DataRow(
              //       cells: [
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //       ],
              //     ),
              //     DataRow(
              //       cells: [
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //       ],
              //     ),
              //     DataRow(
              //       cells: [
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //       ],
              //     ),
              //     DataRow(
              //       cells: [
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //       ],
              //     ),
              //     DataRow(
              //       cells: [
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //         DataCell(
              //           Text('tesssssssssssssssssssssssssssssssssst'),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
            ),
          ),
        )
    ));
  }


}