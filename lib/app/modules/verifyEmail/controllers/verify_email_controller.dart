import 'package:flutter/cupertino.dart' show TextEditingController;
import 'package:get/get.dart';

import '../../../../common/prefs_helper/prefs_helpers.dart' show PrefsHelper;
import '../../../../service/api_checker.dart' show ApiChecker;
import '../../../../service/api_client.dart' show ApiClient;
import '../../../../utils/app_constant.dart';
import '../../../data/api_constants.dart' show ApiConstants;
import '../../../routes/app_pages.dart' show AppRoutes;

class VerifyEmailController extends GetxController {

  ///<=================================== verifyOTP Method==================================================>
  var verifyOTPLoading = false.obs;

  TextEditingController verifyCodeCtrl = TextEditingController();
  verifyCode({
    required String email,
    required String otp,
    required String type,
  }) async {
    var verificationToken = await PrefsHelper.getString(AppConstants.verificationToken);
    verifyOTPLoading(true);
    try {
      Map<String, dynamic> body = {
        "email": email,
        "otp": otp,
        "token": verificationToken,
      };
      var headers = {'Content-Type': 'application/json'};
      Response response = await ApiClient.postData(
          ApiConstants.verifyCodeEndPoint, body,
          headers: headers);

      print("============> Response Body ${response.body} and ==> ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Done', response.body['message']);


        if (type == "signupScreen") {
          Get.offAllNamed(AppRoutes.successfullScreen);
        } else if(type == "forgetPasswordScreen") {
          Get.offAllNamed(AppRoutes.resetPasswordScreen,
            parameters: {
              "email": email,
              "otp": otp,
            },

          );
        }

      } else if (response.statusCode == 400 || response.statusCode == 401) {
        Get.snackbar('Error', response.body['message']);
      } else {
        ApiChecker.checkApi(response);
      }
    } catch (e) {
      print("===> error : $e");
    }
    verifyOTPLoading(false);
  }
}
