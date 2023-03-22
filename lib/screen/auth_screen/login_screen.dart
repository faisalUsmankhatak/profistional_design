import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../app_confiq/appColors.dart';
import '../../app_confiq/styles.dart';
import '../../controller/authController.dart';
import '../../widget/error_dialog.dart';
import '../../widget/my_field_button.dart';
import '../../widget/my_text_field.dart';
import 'create_acount.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool passwordVisible = false.obs;
  RxBool isRemember = false.obs;
  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 24),
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                      "asset/icon/back.png",
                    )),
                  ),
                )),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 43.w),
              child: Text("Log Into Your \nAccount",
                  style: AppStyles.titleTextStyle()),
            ),
            SizedBox(
              height: 80.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 43.w, right: 46.w),
              child: MyTextField(
                controller: emailController,
                label: 'Email',
                prefixIcon: "asset/icon/email.png",
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 43.w, right: 46.w),
              child: Obx(
                () => MyTextField(
                  controller: passwordController,
                  label: "Password",
                  prefixIcon: "asset/icon/lock.png",
                  suffixIcon: passwordVisible.value
                      ? "asset/icon/nonvisible.png"
                      : "asset/icon/visible.png",
                  suffixIconTab: () {
                    passwordVisible.value = !passwordVisible.value;
                  },
                  obscureText: passwordVisible.value,
                ),
              ),
            ),
            SizedBox(
              height: 49.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    isRemember.value = !isRemember.value;
                  },
                  child: Obx(
                    () => Container(
                      width: 19.w,
                      height: 19.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.w),
                          border: Border.all(
                              width: 2.w, color: AppColors.blueColor),
                          color: isRemember.value
                              ? AppColors.blueColor
                              : Colors.transparent),
                      child: Center(
                        child:
                            Icon(Icons.done, color: Colors.white, size: 12.w),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 6.w,
                ),
                const Text("Remember Me")
              ],
            ),
            SizedBox(
              height: 31.h,
            ),
            Padding(
                padding: EdgeInsets.only(left: 45.w, right: 44.w),
                child: Obx(
                  () => authController.isLoadingButton.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : MyFieldButton(
                          height: 55.h,
                          radius: 100.h,
                          buttonText: "Login",
                          fontSize: 16.sp,
                          onTap: () async {
                            if(formValidation()){
                              authController.login(emailController.text.trim(), passwordController.text.trim());
                            }
                            // Get.to(MainScreen());
                          },
                        ),
                )),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 147.w, right: 120.w),
              child: InkWell(
                  onTap: () {
                    Get.to(const ForgotPasswordScreen());
                  },
                  child: Text(
                    "Forget the Password?",
                    style: AppStyles.blueTextStyle(),
                  )),
            ),
            SizedBox(height: 25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Do not have an account? "),
                InkWell(
                    onTap: () {
                      Get.to(const CreateAcount());
                    },
                    child: Text(
                      " Sign Up",
                      style: AppStyles.blueTextStyle(),
                    ))
              ],
            ),
          ],
        ),
      ),
    ));
  }

  bool formValidation() {
    if (emailController.text.trim().length == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialoge(message: 'Email Must Enterd');
          });
      return false;
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialoge(message: 'Invalid Email');
          });
      return false;
    } else if (passwordController.text.trim().length == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialoge(message: 'Enter Password');
          });
      return false;
    }
    return true;
  }
}
