import 'package:aim_construction_app/common/prefs_helper/prefs_helpers.dart';
import 'package:aim_construction_app/utils/app_constant.dart';
import 'package:get/get.dart';


class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false}) async {
    if (response.statusCode != 200) {
      if (response.statusCode == 401) {
        await PrefsHelper.remove(AppConstants.isLogged);
        await PrefsHelper.remove(AppConstants.bearerToken);
       // Get.offAllNamed(AppRoutes.logInScreen);
       // Get.offAllNamed(AppRoutes.logInScreen);
      } else {
        // showCustomSnackBar(response.statusText!, getXSnackBar: getXSnackBar);
      }
    }
  }
}
