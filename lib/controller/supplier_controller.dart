import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_confiq/appColors.dart';
import '../model/supplier_model.dart';
import '../screen/supplier_screen/supplier_listing_Screen.dart';
import '../services/http_services.dart';
import '../widget/error_dialog.dart';

class SupplierController extends GetxController {
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  RxBool isLoadingButton = false.obs;
  RxBool isLoading = false.obs;
  List<SupplierModel?> supplierList = <SupplierModel>[];


  @override
  onInit(){
    super.onInit();
    fetchSupplierData();

  }
  fetchSupplierData() async {
    isLoading.value = true;
    supplierList = await HttpResponses.fetchSupplierData();
// print(supplierList);
    isLoading.value = false;
  }

  addSupplierData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = await sharedPreferences.getString("id");
    isLoadingButton.value = true;
    var response = await HttpResponses.addSupplierData({
      "add_new_supplier": "1",
      "user_id": userId,
      "name": nameController.value.text.trim(),
      "email": emailController.value.text.trim(),
      "phone": phoneController.value.text.trim(),
      "address": addressController.value.text.trim()
    });
    isLoadingButton.value=false;
    if (response['status'] == 'success') {

      nameController.value.clear();
      emailController.value.clear();
      phoneController.value.clear();
      addressController.value.clear();
      fetchSupplierData();
      Get.to(SupplierListingScreen());
      Fluttertoast.showToast(
          msg: response['msg'],
          backgroundColor: AppColors.blueColor,
          textColor: AppColors.whiteColor);
    }else{
      Fluttertoast.showToast(
          msg: response['msg'],
          backgroundColor: AppColors.blueColor,
          textColor: AppColors.whiteColor);
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
