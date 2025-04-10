import 'package:aim_construction_app/app/data/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/prefs_helper/prefs_helpers.dart' show PrefsHelper;
import '../../../../service/api_checker.dart' show ApiChecker;
import '../../../../service/api_client.dart' show ApiClient;
import '../../../../utils/app_constant.dart' show AppConstants, Role;
import '../../../routes/app_pages.dart' show AppRoutes;

class SignInController extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  ///<=============================== Sign In Method ===========================>


  var signInLoading = false.obs;

  signInMethod() async {
    signInLoading(true);
    var fcmToken = await PrefsHelper.getString(AppConstants.fcmToken);
    var headers = {
      'Content-Type': 'application/json'
    };

    Map<String, dynamic> body = {
      "email": emailCtrl.text.trim(),
      "password": passCtrl.text.trim(),
      "fcmToken": fcmToken,

    };

    print("===================> $body");

    try {
      Response response = await ApiClient.postData(
        ApiConstants.signInEndPoint,
        body,
        headers: headers,
      );

      print("============> Response Body: ${response.body}, Status Code: ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {

        PrefsHelper.setString(AppConstants.fcmToken, response.body['data']['fcmToken']);
        PrefsHelper.setString(AppConstants.bearerToken, response.body['data']['attributes']['tokens']['accessToken']);
        print('===================>> Check error');
        var userRole = response.body['data']['attributes']['userWithoutPassword']['role'].toString();
        var userID = response.body['data']['attributes']['userWithoutPassword']['id'];

       if(userRole.isNotEmpty){
         await PrefsHelper.setString(AppConstants.role, userRole);
       }
        if(userID !=  null){
          await PrefsHelper.setString(AppConstants.userId, userID);
        }
       await PrefsHelper.setBool(AppConstants.isLogged, true);

       String userId = await PrefsHelper.getString(AppConstants.userId);

        print('===================>> User Role: $userRole');
        print('===================>> UserId: $userId');




        if (userRole == Role.projectManager.name) {
          Get.offAllNamed(AppRoutes.managerHomeScreen);
          Get.snackbar('Successfully', response.body['message']);
        } else if (userRole == Role.projectSupervisor.name) {
          Get.offAllNamed(AppRoutes.ROLE_SUPERVISOR_HOME_SCREEN);
          Get.snackbar('Successfully', response.body['message']);
        }
      }
      else if (response.statusCode! >= 401 && response.statusCode! <= 430) {
        Get.snackbar('Error', response.body['message']);
      }
    } catch (e) {
      signInLoading(false);
      print('Error: $e');
    } finally {
      signInLoading(false);
    }
  }
}
