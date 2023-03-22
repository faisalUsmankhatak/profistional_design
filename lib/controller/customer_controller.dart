import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:profistional_design/app_confiq/appColors.dart';
import 'package:profistional_design/screen/customer_screen/customer_listing_screen.dart';
import 'package:profistional_design/services/http_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/customer_model.dart';
import '../widget/error_dialog.dart';

class CustomerController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingButton = false.obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  List <CustomerModel?> customerModelList = <CustomerModel>[];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCustomerData();
  }

  fetchCustomerData()async {

    isLoading.value=true;
    customerModelList=  await  HttpResponses.fetchCustomerData();
    isLoading.value=false;
  }

  addCustomerData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = await sharedPreferences.getString("id");
    isLoadingButton.value = true;
    var response = await HttpResponses.addCustomerData({
      "add_new_customer": "1",
      "user_id": userId,
      "name": nameController.value.text.trim(),
      "email": emailController.value.text.trim(),
      "phone": phoneController.value.text.trim(),
      "address": addressController.value.text.trim()
    });
    isLoadingButton.value = false;

    if (response['status'] == 'success') {
      nameController.value.clear();
      emailController.value.clear();
      phoneController.value.clear();
      addressController.value.clear();
      fetchCustomerData();
      Get.to(CustomerListingScreen());
      Fluttertoast.showToast(
          msg: response['msg'],
          textColor: AppColors.whiteColor,
          backgroundColor: AppColors.appColorGreen);
    }
    else{
      Fluttertoast.showToast(
          msg: response['msg'],
          textColor: AppColors.whiteColor,
          backgroundColor: AppColors.appColorGreen);
    }
  }

  bool formValidation(BuildContext context) {
    if (nameController.value.text.trim().length == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialoge(
              message: "Please Enter Name",
            );
          });
      return false;
    } else if (phoneController.value.text.trim().length == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialoge(
              message: "Please Enter Phone",
            );
          });
      return false;
    } else if (emailController.value.text.trim().length == 0) {
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
    } else if (addressController.value.text.trim().length == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialoge(
              message: "Please Enter Address",
            );
          });
      return false;
    }
    return true;
  }
}
