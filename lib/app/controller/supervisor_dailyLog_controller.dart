import 'package:aim_construction_app/app/data/api_constants.dart';
import 'package:aim_construction_app/app/model/getAllImageOrDocumentUnderNoteModel.dart';
import 'package:aim_construction_app/app/model/getNoteByDate_model.dart';
import 'package:aim_construction_app/service/api_checker.dart';
import 'package:aim_construction_app/service/api_client.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';



class SupervisorDailyLogController extends GetxController {
  var isLoading = false.obs;

  var noteCount=''.obs;
  var imageCount=''.obs;
  var documentCount=''.obs;
  RxString selectedDate = ''.obs ;


//=================== Daily Log By Date and Project Id Get all Note ====================
  RxList<GetAllNoteByDateModel> getAllNoteByDateModel = <GetAllNoteByDateModel>[].obs;


 getNoteByDate({String? projectId, String? date}) async {

   isLoading(true);
   List<String> queryParams = [];
   if (projectId != null) queryParams.add('projectId=$projectId');
   if (date != null) queryParams.add('date=$date');
   var url = ApiConstants.supervisorNoteByDateEndPoint;

   if (queryParams.isNotEmpty) {
     url +='?${queryParams.join('&')}';
   }

   var response = await ApiClient.getData(url);
    if (response.statusCode == 200) {
      getAllNoteByDateModel.value = List.from(response.body['data']['attributes']['notes'].map((x) => GetAllNoteByDateModel.fromJson(x)));
      isLoading(false);

      imageCount.value= response.body['data']['attributes']['imageCount'].toString();
      documentCount.value= response.body['data']['attributes']['documentCount'].toString();
      noteCount.value= response.body['data']['attributes']['totalNoteCount'].toString();



      update();
    }
    else {
      ApiChecker.checkApi(response);
      isLoading(false);
      update();
    }
  }



  //=============================================>> Get Image/Document under date <<=========================

  RxList<GetAllImageOrDocumentUnderNoteModel> getAllImageOrDocumentUnderNoteModel = <GetAllImageOrDocumentUnderNoteModel>[].obs;
  var dateOfData=''.obs;

  getAllImageOrDocumentUnderNote({
    String? projectId,
    String? date,
    String? noteOrTaskOrProject,
    String? imageOrDocument,
    String? uploaderRole,
  }) async {

    isLoading(true);
    List<String> queryParams = [];
    if (projectId != null) queryParams.add('projectId=$projectId');
    if (date != null) queryParams.add('date=$date');
    if (noteOrTaskOrProject != null) queryParams.add('noteOrTaskOrProject=$noteOrTaskOrProject');
    if (imageOrDocument != null) queryParams.add('imageOrDocument=$imageOrDocument');
    if (uploaderRole != null) queryParams.add('uploaderRole=$uploaderRole');

    var url = ApiConstants.getAllImagesOfAllNotesEndPoint;

    if (queryParams.isNotEmpty) {
      url +='?${queryParams.join('&')}';
    }

    var response = await ApiClient.getData(url);
    if (response.statusCode == 200) {
      getAllImageOrDocumentUnderNoteModel.value = List.from(response.body['data']['attributes'].map((x) => GetAllImageOrDocumentUnderNoteModel.fromJson(x)));
      isLoading(false);
      dateOfData.value= response.body['data']['attributes']['date'];


      update();
    }
    else {
      ApiChecker.checkApi(response);
      isLoading(false);
      update();
    }
  }
}

