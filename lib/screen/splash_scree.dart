import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_confiq/common.dart';
import '../controller/authController.dart';
import 'auth_screen/login_screen.dart';
import 'home_screen/home_screen.dart';
import 'home_screen/main_screen.dart';
class SplashScreen extends StatelessWidget {

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    navigate();
    return Scaffold(
        body: Center(child: Image.asset("asset/image/icon.png", scale: 1),)
    );
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Get.to(authController.isLogin.value ? const HomeScreen() : const LoginScreen());
    },);
  }

}
