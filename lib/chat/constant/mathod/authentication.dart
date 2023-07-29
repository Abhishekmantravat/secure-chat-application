import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mantravat_intern2/chat/chathome1.dart';
import 'package:mantravat_intern2/chat/chatlogin.dart';
import 'package:mantravat_intern2/chat/constant/mathod/exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AuthenticationRepository extends GetxController {
static AuthenticationRepository get instance => Get.find();
final _auth= FirebaseAuth.instance;
User? currentUser = FirebaseAuth.instance.currentUser;
  //defining method to authenticate the user
  Future<void> createUserWithEmailAndPassword(
     String email, String password,) async {
    try {
      //query for the authentication
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // print("user created");
      Get.snackbar('successful', 'you logged in successfully',snackPosition: SnackPosition.TOP    );
      //query to store user data in firestore

      Get.off(() => const chathome1());
     

      try {
        await FirebaseFirestore.instance
                .collection('user')
                .doc(_auth.currentUser!.uid)
                .set({
          "id": _auth.currentUser!.uid,
          "email": email,
          "Password": password,
        });

      } catch (exception) {
        Get.snackbar("error", "error in saving data",
         snackPosition: SnackPosition.BOTTOM ,        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Error", "weak password",
            snackPosition: SnackPosition.TOP);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Error", "Email alredy exist",
            snackPosition: SnackPosition.TOP);
      }
    }
  }

 







 
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print("signin");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error",
          "No user found",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Error",
          "wrong password",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  Future<void> logout() async => _auth.signOut();
}
