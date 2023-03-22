import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profistional_design/screen/home_screen/home_screen.dart';
import 'package:profistional_design/screen/home_screen/report_screen.dart';

import '../../app_confiq/appColors.dart';
import '../../app_confiq/common.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages=[const ReportScreen(),const HomeScreen(),const ReportScreen()];
  RxInt currentPage=1.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
          body: Obx(()=> pages[currentPage.value]),

        bottomNavigationBar: Obx(()=>
           BottomNavigationBar(
              currentIndex: currentPage.value,
              onTap: (value){
                currentPage.value=value;
              },
               selectedItemColor: Colors.blue,
               unselectedItemColor: Colors.black12,
               type: BottomNavigationBarType.fixed,
              items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Report"),
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: "Setting"),

          ]),
        ),


      ),
    );
  }
}
