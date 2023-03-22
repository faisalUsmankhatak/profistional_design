import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/http_services.dart';
class ProjectController extends GetxController{

  RxBool isLoading=false.obs;
  RxBool isLoadingButton=false.obs;

@override
onInit(){
  super.onInit();
  fetchProject();

}
  fetchProject(){
    HttpResponses.fetchProjectData();
  }
}