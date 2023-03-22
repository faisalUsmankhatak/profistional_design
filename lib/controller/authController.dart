import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_confiq/appColors.dart';
import '../model/login_model.dart';
import '../screen/home_screen/main_screen.dart';
import '../services/http_services.dart';

class AuthController extends GetxController {
  RxBool isLoadingButton = false.obs;
  RxBool isLogin = false.obs;
  LoginModel? authInfo = LoginModel();

  //Rx<User> user=User().obs;
  void login(String? email, String password) async {
    try {
      isLoadingButton.value = true;
      authInfo = await HttpResponses.loginUser(
          {"user_login": "1", "email": email, "password": password});
      isLoadingButton.value = false;

      if (authInfo!.status == "success") {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
      await  sharedPreferences.setBool("isLogin", true);
     await   sharedPreferences.setString("name", authInfo!.record!.name!);
     await   sharedPreferences.setString("email", authInfo!.record!.email!);
     await   sharedPreferences.setString("id", authInfo!.record!.id!);
        isLogin.value = true;
        Fluttertoast.showToast(
            msg: authInfo!.msg!,
            textColor: Colors.white,
            backgroundColor: AppColors.blueColor);
        Get.offAll(const MainScreen());
      }
      else{
        Fluttertoast.showToast(
            msg: authInfo!.msg!,
            textColor: Colors.white,
            backgroundColor: AppColors.blueColor);
      }
    } catch (e) {}
  }
}
