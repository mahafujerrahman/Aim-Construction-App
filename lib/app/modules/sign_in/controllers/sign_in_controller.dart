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
        PrefsHelper.setString(AppConstants.bearerToken, response.body['data']['token']);

        String userRole = response.body['data']['attributes']['userWithoutPassword']['role'];
        String userID = response.body['data']['attributes']['_id'];
        await PrefsHelper.setString(AppConstants.role, userRole);

        await PrefsHelper.setString(AppConstants.userId, userID);


        await PrefsHelper.setBool(AppConstants.isLogged, true);
        print('===================>> User Role: $userRole');
        print('===================>> User IDddddddddddddddddddd: $userID');
        //
        // final socketService = Get.find<UniversalSocketService>();
        // await socketService.reinitializeSocket();

        if (userRole == Role.projectManager.name) {
          Get.offAllNamed(AppRoutes.managerHomeScreen);
          Get.snackbar('Successfully', 'Logged in as User');
        } else if (userRole == Role.projectSupervisor.name) {
          Get.offAllNamed(AppRoutes.ROLE_SUPERVISOR_HOME_SCREEN);
          Get.snackbar('Successfully', 'Logged in as Driver');
        }
      }
      if ( response.statusCode == 401) {
        Get.snackbar('Error', response.body['message']);
      }
      if (response.statusCode == 404) {
        Get.snackbar('Error', response.body['message']);
      }
      else {
        ApiChecker.checkApi(response);
        print("=============================> Server Down");
      }
    } catch (e) {
      signInLoading(false);
      Get.snackbar('Error', 'An unexpected error occurred');
      print('Error: $e');
    } finally {
      signInLoading(false);
    }
  }

}
