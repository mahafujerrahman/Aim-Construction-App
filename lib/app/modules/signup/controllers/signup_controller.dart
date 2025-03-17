import 'package:aim_construction_app/app/data/api_constants.dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/common/prefs_helper/prefs_helpers.dart';
import 'package:aim_construction_app/service/api_checker.dart';
import 'package:aim_construction_app/service/api_client.dart';
import 'package:aim_construction_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/all_manager_model.dart';

class SignupController extends GetxController {

  ///<=============================== Sign Up Method ===========================>
  TextEditingController signUpFirstNameCtrl = TextEditingController();
  TextEditingController signUpLastNameCtrl = TextEditingController();
  TextEditingController signUpEmailCtrl = TextEditingController();
  TextEditingController signUpPassCtrl = TextEditingController();
  TextEditingController signUpConfirmPassCtrl = TextEditingController();

  TextEditingController signUpBirthday = TextEditingController();
  TextEditingController signUpAddressCtrl = TextEditingController();
  TextEditingController signUpCompanyCtrl = TextEditingController();
  List<String> userRole = ['Project Manager','Project Supervisor'];
  RxString selectedRole = ''.obs;

  RxString selectedManagerRole = ''.obs;
  var signUpLoading = false.obs;


  signUpMethod() async {
    signUpLoading.value = true;
    var fcmToken = await PrefsHelper.getString(AppConstants.fcmToken);
    Map<String, dynamic> body = {
      "fname": signUpFirstNameCtrl.text.trim(),
      "lname": signUpLastNameCtrl.text.trim(),
      "password": signUpPassCtrl.text,
      "email": signUpEmailCtrl.text.trim(),
      "role": selectedRole.value,
      "superVisorsManagerId": selectedManagerRole.value,

      "fcmToken": fcmToken,
    };

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    var response = await ApiClient.postData(
      ApiConstants.signUpEndPoint, body,
      headers: headers,
    );

    if(response.statusCode==200 || response.statusCode==201){
      PrefsHelper.setString(AppConstants.verificationToken, response.body['data']['attributes']['verificationToken']);
      print('Hera is your fcmToken : $fcmToken');
      Get.toNamed(AppRoutes.VERIFY_EMAIL, parameters: {
        "email": signUpEmailCtrl.text.trim(),
        "screenType": "signupScreen",
      },
      );
      clearData();
      signUpLoading(false);
      update();
    }
    else{
      ApiChecker.checkApi(response);
      Get.snackbar('Error', response.body['message']);
      signUpLoading(false);
      update();
    }
  }

  clearData(){
    signUpFirstNameCtrl.clear();
    signUpLastNameCtrl.clear();
    signUpEmailCtrl.clear();
    signUpPassCtrl.clear();
    signUpConfirmPassCtrl.clear();
    selectedRole.value = "";
  }



  //=========================>> Get All Manager  <<============================

  RxList<GetAllManagerModel> getAllManagerModel = <GetAllManagerModel>[].obs;
  var loading = false.obs;

  getAllManager() async {
    loading(true);
    var response = await ApiClient.getData("${ApiConstants.getAllManagerEndPoint}");
    if (response.statusCode == 200) {
      getAllManagerModel.value = List.from(response.body['data']['attributes'].map((x) => GetAllManagerModel.fromJson(x)));
      loading(false);
      update();
    }
    else {
      ApiChecker.checkApi(response);
      loading(false);
      update();
    }
  }
}
