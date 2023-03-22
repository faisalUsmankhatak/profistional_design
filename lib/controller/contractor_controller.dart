import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:profistional_design/app_confiq/appColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/contractor_model.dart';
import '../screen/contractor_screen/contractor_listing_screen.dart';
import '../services/http_services.dart';
import '../widget/error_dialog.dart';

class ContractorController extends GetxController {
  RxBool isLoadingButton = false.obs;
  RxBool isLoading = false.obs;
  List<ContractorModel?> contractorList = <ContractorModel>[];
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> numberController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;

  onInit() {
    super.onInit();
    print("oninit");
    fetchContractor();
  }

  fetchContractor() async {
    isLoading.value = true;
    contractorList = await HttpResponses.fetchContractor();
    isLoading.value = false;
  }

  addContractor() async {
    isLoadingButton.value = true;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? id = await sharedPreferences.getString("id");
    var response = await HttpResponses.addContractor({
      "add_new_contractor": "1",
      "user_id": id,
      "name": nameController.value.text.trim(),
      "email": emailController.value.text.trim(),
      "phone": numberController.value.text.trim(),
      "address": addressController.value.text.trim()
    });
    isLoadingButton.value = false;

    if (response['status'] == 'success') {
      nameController.value.clear();
      emailController.value.clear();
      addressController.value.clear();
      numberController.value.clear();
      fetchContractor();
      Get.to(ContractorListingScreen());
      Fluttertoast.showToast(
          msg: response['msg'],
          backgroundColor: AppColors.blueColor,
          textColor: AppColors.whiteColor);
    }
  }

  bool formVailadation(BuildContext context) {
    if (nameController.value.text.trim().length == 0) {
      showDialog(
          context: context,
          builder: (context) {
            return ErrorDialoge(
              message: "Please Enter Contractor Name",
              onTapOk: () {
                Get.back();
              },
            );
          });
      return false;
    } else if (numberController.value.text.trim().length == 0) {
      showDialog(
          context: context,
          builder: (context) {
            return ErrorDialoge(
              message: "Please Enter Number",
              onTapOk: () {
                Get.back();
              },
            );
          });
      return false;
    } else if (emailController.value.text.trim().length == 0) {
      showDialog(
          context: context,
          builder: (context) {
            return ErrorDialoge(
              message: "Please Enter Email Name",
              onTapOk: () {
                Get.back();
              },
            );
          });
      return false;
    } else if (!GetUtils.isEmail(emailController.value.text.trim())) {
      showDialog(
          context: context,
          builder: (context) {
            return ErrorDialoge(
              message: "Email Not Valid",
              onTapOk: () {
                Get.back();
              },
            );
          });
      return false;
    } else if (addressController.value.text.trim().length == 0) {
      showDialog(
          context: context,
          builder: (context) {
            return ErrorDialoge(
              message: "Please Enter Address",
              onTapOk: () {
                Get.back();
              },
            );
          });
      return false;
    } else {
      return true;
    }
  }
}
