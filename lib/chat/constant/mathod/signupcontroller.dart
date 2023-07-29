import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mantravat_intern2/chat/constant/mathod/authentication.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

//  text field controllers to get data from textfields

  final email = TextEditingController();
  final password = TextEditingController();
   



  //creating a function to access authrepository method

  void registerUser(
     String email, String password, ) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password,);
  }
}





  // final phoneno = TextEditingController();


