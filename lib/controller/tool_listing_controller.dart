import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profistional_design/screen/contractor_screen/contractor_form_screen.dart';
import 'package:profistional_design/screen/contractor_screen/contractor_listing_screen.dart';
import 'package:profistional_design/screen/customer_screen/customer_form_screen.dart';
import 'package:profistional_design/screen/customer_screen/customer_listing_screen.dart';
import 'package:profistional_design/screen/expense_screen/expense_form_screen.dart';
import 'package:profistional_design/screen/expense_screen/expense_listing_screen.dart';
import 'package:profistional_design/screen/payment_screen/payment_listing_screen.dart';
import 'package:profistional_design/screen/project_screen/project_form_screen.dart';
import 'package:profistional_design/screen/project_screen/project_listing_screen.dart';
import 'package:profistional_design/screen/staff_user_screen/staff_form_screen.dart';
import 'package:profistional_design/screen/staff_user_screen/staff_user_listing_screen.dart';
import 'package:profistional_design/screen/supplier_screen/SupplierFormScreen.dart';
import 'package:profistional_design/screen/supplier_screen/supplier_listing_Screen.dart';

import '../screen/expense_category_Screen/expense_category_list_screen.dart';
class ToolListingController extends GetxController{
  List<Map> toolData=[
    // {
    //   "title":"Project",
    //   "imagePath":"asset/icon/project.png"
    //
    // },
    {
      "title":"Customer",
      "imagePath":"asset/icon/customers.png"
    },
    {
      "title":"Supplier",
      "imagePath":"asset/icon/supliers.png"
    },
    {
      "title":"Sub-Contractor",
      "imagePath":"asset/icon/contractor.png"
    },
    {
      "title":"Payment Methods",
      "imagePath":"asset/icon/payment.png"
    },
    {
      "title":" Expense Category",
      "imagePath":"asset/icon/expense.png"
    },
    // {
    //   "title":"Expense",
    //   "imagePath":"asset/icon/expense1.png",
    // },
    {
      "title":"Staff Users",
      "imagePath":"asset/icon/staffUsers.png"
    },




  ];
  gotoListingScreen(index){
    switch(index){
     //  case 0:{
     // Get.to(const ProjectListingScreen());
     //
     //  }
     //  break;
      case 0:{
      Get.to(CustomerListingScreen()) ;
      }
      break;

      case 1:{
       Get.to( SupplierListingScreen())  ;
      }
      break;
      case 2:{
        Get.to(ContractorListingScreen())  ;
      }
      break;
      case 3:{
        Get.to(PaymentScreen())  ;
      }
      break;
      case 4:{
       Get.to(ExpenseCategoryList()) ;
      }
      break;
      case 5:{
       Get.to(StaffListingScreen()) ;
      }
      break;



    }
  }
  goToAddScreen(index){
    switch(index){
      // case 0:{
      //   Get.to(const ProjectFormScreen());
      // }
      // break;
      case 0:{
        Get.to(CustomerFormScreen());
      }
      break;
      case 1:{
        Get.to(const SupplierFormScreen());
      }
      break;
      case 2:{
        Get.to( ContractorFormScreen());
      }
      break;
      case 3:{
        Get.to( PaymentScreen());
      }
      break;
      case 4:{
        Get.to(ExpenseCategoryList());
      }
      break;
      case 5:{
        Get.to(StaffFormScreen());
      }
      break;


    }
  }
}