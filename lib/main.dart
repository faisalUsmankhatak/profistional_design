import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profistional_design/screen/add_new_form_screen/tool_listing_screen.dart';
import 'package:profistional_design/screen/splash_scree.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_confiq/common.dart';
import 'controller/authController.dart';
void main() async{
  final authController = Get.put(AuthController());
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  authController.isLogin.value=await sharedPreferences.getBool("isLogin")??false;

  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              backgroundColor: Colors.white,
              colorScheme: ThemeData().colorScheme.copyWith(primary: const Color(0xff246BFD)),
            ),
            home: child,
          );
        },
        child:  SplashScreen(),
      );

  }
}
