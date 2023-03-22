import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../app_confiq/appColors.dart';
import '../model/staff_user_model.dart';
import '../screen/staff_user_screen/staff_user_listing_screen.dart';
import '../services/http_services.dart';
import '../widget/error_dialog.dart';
import 'authController.dart';

class StaffUserController extends GetxController {
  Rx<TextEditingController> nameController = TextEditingController().obs;

  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> amountController = TextEditingController().obs;

  RxBool isLoading = false.obs;
  RxBool isLoadingButton = false.obs;
  List<StaffUserModel?> contractorList = <StaffUserModel>[];
  AuthController authController = Get.find();

  @override
  onInit() {
    super.onInit();
    fetchStaffUserData();
  }

  fetchStaffUserData() async {
    isLoading.value = true;
    contractorList = await HttpResponses.fetchStaffUserData();
    isLoading.value = false;
  }

  addStaffUserData() async {
    isLoadingButton.value=false;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? UserId = await sharedPreferences.getString("id");
    isLoadingButton.value = true;

 var response=  await HttpResponses.addStaffUserData({
      "add_new_user_account": "1",
      "user_id": UserId,
      "account_no": amountController.value.text.trim(),
      "name":nameController.value.text.trim(),
      "email":emailController.value.text.trim(),
      "phone":phoneController.value.text.trim()
    });
    isLoadingButton.value=false;
    Fluttertoast.showToast(msg: response['msg'],textColor: AppColors.whiteColor,backgroundColor: AppColors.blueColor);
    if(response['status']=="success"){
      nameController.value.clear();
      amountController.value.clear();
      emailController.value.clear();
      phoneController.value.clear();
      fetchStaffUserData();
      Get.to(StaffListingScreen());
    }
  }

  bool formValidation(BuildContext context) {
    if (nameController.value.text.length == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialoge(
              message: "Please Enter Name",
            );
          });
      return false;
    } else if (phoneController.value.text.length == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialoge(
              message: "Please Enter Phone",
            );
          });
      return false;
    } else if (emailController.value.text.length == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialoge(
              message: "Please Enter Email",
            );
          });
      return false;
    } else if (!GetUtils.isEmail(emailController.value.text.trim())) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialoge(
              message: "Please Enter Valid Email",
            );
          });
      return false;
    } else if (amountController.value.text.length == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialoge(
              message: "Please Enter Password",
            );
          });
      return false;
    }
    return true;
  }
}
