import 'package:aim_construction_app/app/data/api_constants.dart';
import 'package:aim_construction_app/app/modules/role/manager/more/model/useProfileDetailsModel.dart';
import 'package:aim_construction_app/common/prefs_helper/prefs_helpers.dart';
import 'package:aim_construction_app/service/api_checker.dart';
import 'package:aim_construction_app/service/api_client.dart';
import 'package:aim_construction_app/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileMoreController extends GetxController {

//============================> Get Profile Data <=============================

  Rx<UserProfileDetailsModel> userProfileDetailsModel = UserProfileDetailsModel().obs;
  var isLoading = false.obs;

  getProfileData(String userID) async {
    isLoading(true);

    var bearerToken = await PrefsHelper.getString(AppConstants.bearerToken);
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $bearerToken'
    };

    var response = await ApiClient.getData("${ApiConstants.userprofileDetailsEndPoint}/$userID", headers: headers);
    print("=============response : ${response.body}");
    if (response.statusCode == 200) {
      userProfileDetailsModel.value = UserProfileDetailsModel.fromJson(response.body['data']['attributes']);
      isLoading(false);
      update();
    }
    else{
      ApiChecker.checkApi(response);
      isLoading(false);
      update();
    }

  }

}
