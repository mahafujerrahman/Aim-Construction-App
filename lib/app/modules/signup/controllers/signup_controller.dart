import 'package:aim_construction_app/app/data/api_constants.dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/common/prefs_helper/prefs_helpers.dart';
import 'package:aim_construction_app/service/api_checker.dart';
import 'package:aim_construction_app/service/api_client.dart';
import 'package:aim_construction_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  List<String> managerRole = ['Project Manager 1','Project Manager 2'];
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

      "fcmToken": fcmToken,
     // if (role.value == 'driver') 'agencyId': agencyId.value,
    //  if (role.value == 'agency') 'city': signUpCityCtrl.text.trim(),
    };

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    var response = await ApiClient.postData(
      ApiConstants.signUpEndPoint, body,
      headers: headers,
    );

    if(response.statusCode==200 || response.statusCode==201){
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
    if(response.statusCode==409){
      Get.snackbar('Error', 'Email Already in Use');
      signUpLoading(false);
      update();
    }
    else{
      ApiChecker.checkApi(response);
      signUpLoading(false);
      update();
    }
  }

  clearData(){
    signUpFirstNameCtrl.clear();
    signUpLastNameCtrl.clear();
    signUpEmailCtrl.clear();
    signUpPassCtrl.clear();
    userRole.clear();
  }


  //===================================

}
