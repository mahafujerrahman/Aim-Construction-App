import 'package:aim_construction_app/app/data/api_constants.dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/common/prefs_helper/prefs_helpers.dart';
import 'package:aim_construction_app/service/api_checker.dart';
import 'package:aim_construction_app/service/api_client.dart';
import 'package:aim_construction_app/utils/app_constant.dart';
import 'package:aim_construction_app/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {

  ///==================>>  Forgot pass word   <<<===============
  TextEditingController forgetEmailTextCtrl = TextEditingController();

  var forgotLoading = false.obs;

  handleForget() async {
    forgotLoading(true);
    var body = {
      "email": forgetEmailTextCtrl.text.trim(),
    };
    var headers = {
      'Content-Type': 'application/json'
    };
    var response = await ApiClient.postData(ApiConstants.forgotPasswordEndPoint, body,
        headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      PrefsHelper.setString(AppConstants.verificationToken, response.body['data']['attributes']['resetPasswordToken']);


      Get.toNamed(AppRoutes.VERIFY_EMAIL, parameters: {
        "email": forgetEmailTextCtrl.text.trim(),
        "screenType": "forgetPasswordScreen",
      });
      Get.snackbar("Done", 'OTP Send your email');
    }
    if (response.statusCode == 400 || response.statusCode == 404) {
      Get.snackbar('Error', response.body['message']);
    }

    else {
      ApiChecker.checkApi(response);

    }
    forgotLoading(false);
  }
}
