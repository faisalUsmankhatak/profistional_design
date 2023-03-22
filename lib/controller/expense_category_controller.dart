import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:profistional_design/app_confiq/appColors.dart';
import 'package:profistional_design/services/http_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/expense_category_model.dart';
import '../widget/error_dialog.dart';


class ExpenseCategory extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingButton = false.obs;
  Rx<TextEditingController> expenseCategoryController = TextEditingController()
      .obs;
  List<ExpenseCategoryModel?> expenseCategoryList = <ExpenseCategoryModel>[];
@override
  onInit(){
    super.onInit();
    fetchExpenseCategory();

  }

  fetchExpenseCategory() async {
    isLoading.value = true;
    expenseCategoryList = await HttpResponses.fetchExpenseCategory();
    isLoading.value = false;
  }

  addExpenseCategory() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try{
      String? userId = await sharedPreferences.getString("id");
      isLoadingButton.value = true;
      var reponse = await HttpResponses.addExpenseCategory({
        "add_new_category": "1",
        "user_id": userId,
        "title": expenseCategoryController.value.text.trim()
      });
      isLoadingButton.value = false;
      Fluttertoast.showToast(msg: reponse['msg'],
          textColor: AppColors.whiteColor,
          backgroundColor: AppColors.appColorGreen);
      if (reponse['status'] == 'success') {
        expenseCategoryController.value.clear();
        fetchExpenseCategory();
        Get.back();
      }
    }catch(e){
      print(e);
    }

  }

  bool formValidation(BuildContext context) {
    if (expenseCategoryController.value.text
        .trim()
        .length == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialoge(
              message: "Please Enter Category",
            );
          });
      return false;
    }
    return true;
  }
}
