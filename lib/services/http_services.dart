
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../app_confiq/app_api.dart';

import '../model/contractor_model.dart';
import '../model/customer_model.dart';
import '../model/expense_category_model.dart';
import '../model/login_model.dart';

import '../model/getPaymentModel.dart';
import '../model/project_model.dart';
import '../model/staff_user_model.dart';
import '../model/supplier_model.dart';

class HttpResponses {
 static Uri uri = Uri.parse("https://imrans32.sg-host.com/app/app.php");
  static Future<LoginModel?> loginUser(Map login) async {
    LoginModel? loginModel=LoginModel();
    try {
      var response = await http.post(uri, body: login);

      return LoginModel.fromJson(jsonDecode(response.body));

    } catch (e) {
return null;
    }
  }

  static Future<dynamic?> addPaymentData(String payment) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Uri uri = Uri.parse(AppApi.payment_Url);
    try {
      String? userId = await sharedPreferences.getString("id");
      var response = await http.post(uri, body: {
        "add_new_payment_method": "1",
        "user_id": userId,
        "title": payment
      });
      if (response.statusCode == 200) {
       var map=jsonDecode(response.body);
       print(map['msg']);

        return jsonDecode(response.body);
      } else {
      return null;
      }
    } catch (e) {
   return null;
    }
  }

  static Future<List<GetPaymentModel?>> fetchPaymentData() async {
    List <GetPaymentModel?> productModel = <GetPaymentModel>[];
    try {
      var response = await http.post(
          uri, body: {"get_payment_methods_list": "1"});
      if (response.statusCode == 200) {

        List data = jsonDecode(response.body);
        return data.map((json) {
          return GetPaymentModel.fromJson(json);
        }).toList();
      } else {
        return productModel;
      }
    } catch (e) {
      return productModel;
    }
  }

static Future<dynamic?> addContractor(Map data) async {
   try{
     var response = await http.post(uri, body: data);
     if (response.statusCode == 200) {
       return jsonDecode(response.body);
     }
     return null;
   }catch(e){
     return null;
   }

  }
static Future<List<ContractorModel?>>  fetchContractor()async{
  List <ContractorModel?> contractorList = <ContractorModel>[];
    try{
      var response=await http.post(uri,body: {"get_contractors_list":"1"});
      List data=jsonDecode(response.body);
      if(data.isNotEmpty){
       return data.map((json){
          return ContractorModel.fromJson(json);
        }).toList();
      }
     return contractorList;


    }catch(e){
      return contractorList;
    }
}
 static Future<List<StaffUserModel?>> fetchStaffUserData()async{
   List <StaffUserModel?> staffUserModel = <StaffUserModel>[];
   try {
     var response = await http.post(uri, body: {"get_user_accounts_list": "1"});
     print(response.body);
     if (response.statusCode == 200) {
       List data = jsonDecode(response.body);
       return data!.map((json) {
         return StaffUserModel.fromJson(json);
       }).toList();
     } else {
       return staffUserModel;
     }

   }catch(e){
     print(e.toString());
  return   staffUserModel;
   }
   }
 static Future<dynamic?> addStaffUserData(Map map)async{
    try{
      var response=  await http.post(uri,body:map );
      if(response.statusCode==200){
return jsonDecode(response.body);
      }
      return null;
    }catch(e){
      return null;
    }

 }
 static Future<List<SupplierModel?>> fetchSupplierData()async{
   List <SupplierModel?> supplierModel = <SupplierModel>[];
   try{
     var response= await  http.post(uri,body: {"get_suppliers_list":"1"});
     if(response.statusCode==200){
       List data=jsonDecode(response.body);
       return data.map((json) {
      return   SupplierModel.fromJson(json);
       }).toList();
     }
     return supplierModel;
   }catch(e){
     return supplierModel;
   }
   }

static Future<dynamic?> addSupplierData(Map data)async{
    try{
      var response=await http.post(uri,body:data );
      if(response.statusCode==200){
        return jsonDecode(response.body);
      }
      return null;
    }catch(e){
      return null;
    }

 }
 static Future<dynamic?> addCustomerData(Map map)async{
    try{
      var response=  await  http.post(uri,body:map );
      if(response.statusCode==200){
        return jsonDecode(response.body);
      }
      return null;
    }catch(e){
      return null;
    }

 }
 static Future<List<CustomerModel?>> fetchCustomerData()async{
   List <CustomerModel?> supplierModel = <CustomerModel>[];
   try{
     var response=await http.post(uri,body: {"get_customers_list":"1"});
     if(response.statusCode==200){
       List data=jsonDecode(response.body);
       return  data.map((json) {
         return   CustomerModel.fromJson(json);
       }).toList();
     }
     return supplierModel;
   }catch(e){
     return supplierModel;
   }

 }
 static Future<List<ExpenseCategoryModel?>> fetchExpenseCategory()async{
   List <ExpenseCategoryModel?> expenseCategoryModel=<ExpenseCategoryModel>[];
   try{
     var response=  await http.post(uri,body: {"get_expense_categories_list":"1"});

     if(response.statusCode==200){
       List data=jsonDecode(response.body);
return data.map((json) {
  return ExpenseCategoryModel.fromJson(json);
}).toList();
     }
     return expenseCategoryModel;
   }catch(e) {
     return expenseCategoryModel;
   }

 }
 static Future<dynamic?> addExpenseCategory(Map map)async{
    try{
      var reponse=  await http.post(uri,body: map);
      if(reponse.statusCode==200){
        return jsonDecode(reponse.body);
      }
      return null;
    }catch(e){
      return null;
    }


 }
static Future<List<ProjectModel?>> fetchProjectData()async{
  List <ProjectModel?> projectModel=<ProjectModel>[];
    try{

      var response= await  http.post(uri,body: {"get_projects_list":"1"});
      if(response.statusCode==200){
        List data=  jsonDecode(response.body);
        return data.map((e){
          return ProjectModel.fromJson(e);
        }).toList();
      }else{
        return  projectModel;
      }
    }catch(e){
      return projectModel;
    }

    
}
}