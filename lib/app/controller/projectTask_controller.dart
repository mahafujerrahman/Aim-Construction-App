import 'dart:io';

import 'package:aim_construction_app/app/data/api_constants.dart';
import 'package:aim_construction_app/app/model/projectTask_details_model.dart';
import 'package:aim_construction_app/app/model/project_model.dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/service/api_checker.dart';
import 'package:aim_construction_app/service/api_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';


class ProjectTaskController extends GetxController {

//======================== Project Task Details ==========================
  RxList<ProjectTaskDetailsModel> projectTaskDetailsModel = <ProjectTaskDetailsModel>[].obs;
  var isLoading = false.obs;

  getAllProjectTaskDetails(
      {
        String? title,
        String? id,
        String? project,
        String? task_status,
        String? projectId}) async {
    isLoading(true);
    List<String> queryParams = [];
    if (title != null) queryParams.add('title=$title');
    if (id != null) queryParams.add('_id=$id');
    if (project != null) queryParams.add('project=$project');
    if (task_status != null) queryParams.add('task_status=$task_status');
    if (projectId != null) queryParams.add('projectStatus=$projectId');

    var url = ApiConstants.projectTaskDetailsEndPoint;

    if (queryParams.isNotEmpty) {
      url +='?${queryParams.join('&')}';
    }


    var response = await ApiClient.getData(url);

    // Handle response
    if (response.statusCode == 200) {
      projectTaskDetailsModel.value = List.from(response.body['data']['attributes'].map((x) => ProjectTaskDetailsModel.fromJson(x)));
      isLoading(false);
      update();
    } else {
      ApiChecker.checkApi(response);
      isLoading(false);
      update();
    }
  }

//================= pickImageFromDevice
  ImagePicker picker = ImagePicker();
  RxList<String> images = <String>[].obs;

  Future<void> pickImageFromDevice() async {
    try {
      // Pick multiple images
      final List<XFile>? returnImages = await picker.pickMultiImage();

      // Check if no images were selected
      if (returnImages == null || returnImages.isEmpty) {
        print("No images selected");
        Get.snackbar(
          "No Images Selected",
          "Please select valid image files (JPG or PNG).",
          colorText: Colors.red,
          backgroundColor: Colors.white,
        );
        return;
      }
      for (var img in returnImages) {
        final fileExtension = img.path.split('.').last.toLowerCase();
        if (fileExtension == 'jpg' || fileExtension == 'jpeg' || fileExtension == 'png') {
          // Add the image path to the list
          images.value.add(img.path);
        } else {
          print("Invalid file format: $fileExtension for file ${img.path}");
          Get.snackbar(
            "Invalid File Format",
            "File '${img.name}' is not a valid image format. Only JPG and PNG are allowed.",
            colorText: Colors.white,
            backgroundColor: Colors.red,
          );
        }
      }
      images.refresh();
    } catch (e) {
      // Handle unexpected errors gracefully
      print("Error while picking images: $e");
      Get.snackbar(
        "Error",
        "An error occurred while selecting images. Please try again.",
        colorText: Colors.red,
        backgroundColor: Colors.white,
      );
    }
  }




  removeImage(int index) {
    images.removeAt(index);
    refresh();
  }

  RxString assignToSupervisor = ''.obs;
  DateTime? selectedDate;

  TextEditingController taskTitelCTRl = TextEditingController();
  TextEditingController taskDescriptionCTRl = TextEditingController();
  //====================>> Manger Task Create

  managerTaskCreate({required String projectId}) async{

    List<MultipartBody> multipartAttachments = [];

    // Add multiple images to multipartList
    for (String imagePath in images) {
      multipartAttachments.add(
          MultipartBody(
              "attachments",File(imagePath)
          )
      );
    };

    Map<String, String> body = {
      "projectId": projectId,
      "title": taskTitelCTRl.text.trim(),
      "description": taskDescriptionCTRl.text.trim(),
      "assignedTo": assignToSupervisor.value,
      "dueDate": selectedDate.toString(),
    };

    var response = await ApiClient.postMultipartData(
      ApiConstants.projectTaskCreateEndPoint,
      body,
      multipartBody: multipartAttachments,
    );
    // Handle response
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.snackbar('Successfully', 'Task created successfully');
      update();
      clearTaskData();
      Get.toNamed(AppRoutes.managerHomeScreen);
    } else {
      ApiChecker.checkApi(response);
      update();

    }

  }

  void clearTaskData(){
    taskTitelCTRl.clear();
    taskDescriptionCTRl.clear();
    assignToSupervisor.value = '';
    selectedDate;
    clearImage();
  }

  void clearImage(){
    images.clear();
  }
}


