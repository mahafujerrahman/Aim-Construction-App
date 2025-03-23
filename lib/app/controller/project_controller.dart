import 'dart:io';

import 'package:aim_construction_app/app/data/api_constants.dart';
import 'package:aim_construction_app/service/api_checker.dart';
import 'package:aim_construction_app/service/api_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProjectController extends GetxController {
  //==================== >>>>   Project Create <<<<   ==========================

  TextEditingController projectNameController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  List<String> userRole = ['Default template', 'Project Manager', 'Project Supervisor'];
  RxString selectedRole = ''.obs;
  File? selectedProfileImage;


  projectCreate() async {

    List<MultipartBody> multipartBody = [];
    if (selectedProfileImage != null) {
       MultipartBody('projectLogo',selectedProfileImage!);
    }
    Map<String, String> body = {
      "projectName": projectNameController.text,
      "projectSuperVisorId": selectedRole.value,
      "streetAddress": streetAddressController.text,
      "city": cityController.text,
      "zipCode": zipCodeController.text,
      "country": countryController.text,
      "startDate": startDateController.text,
      "endDate": endDateController.text,

    };

    var response = await ApiClient.postMultipartData(
      ApiConstants.projectCreateEndPoint,
      body,
      multipartBody: multipartBody,
    );

    // Handle response
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.snackbar('Successfully', '${response.body['message']}');
      update();
      clearFromData();

    }
    else {
      ApiChecker.checkApi(response);
      update();
    }
  }
  void clearFromData(){
    projectNameController.clear();
    selectedRole.value = '';
    streetAddressController.clear();
    cityController.clear();
    zipCodeController.clear();
    countryController.clear();
    startDateController.clear();

  }

}