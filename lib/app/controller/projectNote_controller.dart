import 'dart:io';

import 'package:aim_construction_app/app/data/api_constants.dart';
import 'package:aim_construction_app/app/model/getNoteDetailById_model.dart';
import 'package:aim_construction_app/app/routes/app_pages.dart';
import 'package:aim_construction_app/service/api_checker.dart';
import 'package:aim_construction_app/service/api_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class ProjectNoteController extends GetxController {


//================= pickFileFromDevice
  ImagePicker picker = ImagePicker();
  RxList<String> images = <String>[].obs;
  RxList<String> file = <String>[].obs;

  Future<void> pickFileFromDevice() async {
    try {
      // Pick multiple images or files (assuming you are using an image picker that supports multiple media)
      final List<XFile>? returnFiles = await picker
          .pickMultipleMedia(); // This needs the correct package

      // Check if no files were selected
      if (returnFiles == null || returnFiles.isEmpty) {
        print("No files selected");
        Get.snackbar(
          "No Files Selected",
          "Please select valid image files (JPG, PNG) or PDF files.",
          colorText: Colors.red,
          backgroundColor: Colors.white,
        );
        return;
      }

      // Iterate through each selected file
      for (var img in returnFiles) {
        final fileExtension = img.path
            .split('.')
            .last
            .toLowerCase();

        if (fileExtension == 'jpg' || fileExtension == 'jpeg' ||
            fileExtension == 'png') {
          images.value.add(img.path);
        }
        // If it's a file (PDF, DOCX, XLSX), add it to the file list
        else if (fileExtension == 'pdf' || fileExtension == 'docx' ||
            fileExtension == 'doc' || fileExtension == 'xls' ||
            fileExtension == 'xlsx') {
          file.value.add(img.path);
        } else {
          // Handle invalid file formats
          print("Invalid file format: $fileExtension for file ${img.path}");
          Get.snackbar(
            "Invalid File Format",
            "File '${img
                .name}' is not a valid format. Allowed formats: JPG, PNG, PDF, DOCX, XLSX.",
            colorText: Colors.white,
            backgroundColor: Colors.red,
          );
        }
      }

      images.refresh();
      file.refresh();
    } catch (e) {
      // Handle unexpected errors gracefully
      print("Error while picking files: $e");
      Get.snackbar(
        "Error",
        "An error occurred while selecting files. Please try again.",
        colorText: Colors.red,
        backgroundColor: Colors.white,
      );
    }
  }

  removeImage(int index) {
    images.removeAt(index);
    refresh();
  }

  removeFile(int index) {
    file.removeAt(index);
    refresh();
  }

  //================= Add new note ================================
  TextEditingController noteName = TextEditingController();
  TextEditingController noteDescription = TextEditingController();


  supervisorNewNoteCreate({required String projectId}) async{

    List<MultipartBody> multipartAttachments = [];


    // Add multiple images to multipartList
    for (String imagePath in images) {
      multipartAttachments.add(MultipartBody("attachments", File(imagePath)));
    }

    // Add multiple files (PDF, DOCX, XLSX) to multipartList
    for (String filePath in file) {
      multipartAttachments.add(MultipartBody("attachments", File(filePath)));
    }


    Map<String, String> body = {
      "projectId": projectId,
      "title": noteName.text.trim(),
      "description": noteDescription.text.trim(),
    };

    var response = await ApiClient.postMultipartFileData(
      ApiConstants.supervisorAddNewNoteEndPoint,
      body,
      multipartBody: multipartAttachments,
    );
    // Handle response
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.snackbar('Successfully','Note created successfully');
      update();
      clearTaskData();
      Get.toNamed(AppRoutes.supervisorProjectTools);
    } else {
      ApiChecker.checkApi(response);
      update();

    }

  }

  void clearTaskData(){
    noteName.clear();
    noteDescription.clear();
    clearImage();
    clearFile();
  }

  void clearImage(){
    images.clear();
  }
  void clearFile(){
    file.clear();
  }

  //============================>> Note Details by ID <<==============================
  Rx<GetNoteDetailByIdModel> getNoteDetailByIdModel = GetNoteDetailByIdModel().obs;
  RxBool isLoadingBooking=false.obs;

  getNoteDetailsByID(String noteID)async{
    isLoadingBooking.value=true;
    var response = await ApiClient.getData(
      "${ApiConstants.noteDetailsEndPoint}/noteID",);
    if (response.statusCode == 200) {
      getNoteDetailByIdModel.value = GetNoteDetailByIdModel.fromJson(response.body['data']['attributes']);
      isLoadingBooking.value=false;


      update();

    }else {
      isLoadingBooking.value=false;
      ApiChecker.checkApi(response);
      update();

    }


  }
}