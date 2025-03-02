import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {

  ///<=============================== Sign Up Method ===========================>
  TextEditingController signUpFullNameCtrl = TextEditingController();
  TextEditingController signUpEmailCtrl = TextEditingController();
  TextEditingController signUpPassCtrl = TextEditingController();
  TextEditingController signUpConfrimPassCtrl = TextEditingController();
  TextEditingController signUpBirthday = TextEditingController();
  TextEditingController signUpAddressCtrl = TextEditingController();
  TextEditingController signUpCompanyCtrl = TextEditingController();
  List<String> userRole = ['Project Manager','Project Supervisor'];
  RxString selectedRole = ''.obs;

}
