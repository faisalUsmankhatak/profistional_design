import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../app_confiq/appColors.dart';
import '../model/getPaymentModel.dart';
import '../services/http_services.dart';
import '../widget/error_dialog.dart';

class PaymentController extends GetxController{
RxBool isLoadingButton=false.obs;
RxBool isLoadingFetchData=false.obs;
List<GetPaymentModel?>  productModel =  <GetPaymentModel>[];
Rx<TextEditingController> paymentTextField=TextEditingController().obs;
// RxList<Product> product = (List<Product>.of([])).obs;
@override
 void onInit(){
  super.onInit();
  fetchPaymentData();
}
addPaymentMethod(String payment)async{
  isLoadingButton.value=true;
 var response=await HttpResponses.addPaymentData(payment);
 print(response);

  isLoadingButton.value=false;

  if(response['status']=='success'){
    Fluttertoast.showToast(msg: response['msg'],textColor: AppColors.whiteColor,backgroundColor: AppColors.blueColor);
    fetchPaymentData();
    Get.back();


  }else{
    Fluttertoast.showToast(msg: response['msg'],textColor: AppColors.whiteColor,backgroundColor: AppColors.blueColor);
  }


}

Future<void>   fetchPaymentData()async{

  isLoadingFetchData.value=true;
  productModel=await HttpResponses.fetchPaymentData();
  isLoadingFetchData.value=false;

}
bool paymentFormValidation(BuildContext context){
  if(paymentTextField.value.text.trim().length==0){
    showDialog(context: context, builder: (context){
      return ErrorDialoge(message: "Enter Payment",);

    });
    return false;
  }
  return true;
}
}