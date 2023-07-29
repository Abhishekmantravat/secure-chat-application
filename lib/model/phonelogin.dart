import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:mantravat_intern2/chat/chathome1.dart';
import 'package:mantravat_intern2/chat/constant/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mantravat_intern2/chat/constant/mathod/phoneotp.dart';

import '../chat/constant/mathod/phonesigncontroller.dart';
import '../chat/constant/mathod/signupcontroller.dart';

class phonelogin extends StatefulWidget {
   phonelogin({super.key});

  static  String result1="";

  @override
  State<phonelogin> createState() => _phoneloginState();
}

class _phoneloginState extends State<phonelogin> {
  TextEditingController countryController = TextEditingController();
    // TextEditingController phonenoController = TextEditingController();
        // TextEditingController otpController = TextEditingController();

  
 @override
  void dispose() {
                        // controller.phoneno
// .dispose();
    // otpController.dispose();
    super.dispose();
  }


  @override
   void initState() {
    countryController.text = "+91";
    super.initState();
  }
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: primarycolor,
        leading: BackButton(
          color: secondarycolor,
        ),
        
      ),
      
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 140),
            child: Column(
              children: [
                //
                // 
                SizedBox(height: 15),    
                
                    Text("Verification", style: TextStyle(fontSize: 30 ,fontWeight: FontWeight.bold, color: secondarycolor),textAlign: TextAlign.center,),
                SizedBox(height: 30,),
                
                    Text("We need to register your phone before getting started!", style: TextStyle( color: Color.fromARGB(255, 231, 226, 226)),textAlign: TextAlign.center,),
                
                 SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                   TextButton(onPressed: (){
                    Navigator.pop(context);
                   }, child: Text("Another method",style: TextStyle( color: secondarycolor)))
                  ]
                ),

                SizedBox(height: 80),   

               Container(
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all( color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        style: TextStyle(color: grey),
                        // controller: countryController,
                                           controller: countryController,

                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                                                  style: TextStyle(color: grey),
                                                  controller: phoneno,


                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone no",
                        hintStyle:  TextStyle(color: grey),
                      ),
                    ))
                  ],
                ),
              ),
                    SizedBox(height: 25),   

                
                    SizedBox(
                      height: 45,
                                        width: double.infinity,
                
                                        child: DecoratedBox(decoration: BoxDecoration(color: secondarycolor,
                                                      borderRadius: BorderRadius.circular(100)
                ),
                
                      child: ElevatedButton(
                          onPressed: () async {
                             temp = await FirebaseAuthentication().sendOTP(phoneno.text).whenComplete((){  
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> phoneotp(Phonenumber: phoneno.text.trim(),)));
                              // print('+91$phonenoController');
                              });

                            
                          },
                          child: Text(
                            "Verify Phone Number",
                            style: TextStyle(color: secondarycolor),
                          ))),
                    ),

                   
                
               
              ],
            ),
          
        ),
      ),
    );
  }


  // Widget SendOTPButton(String text) => ElevatedButton(
  //   onPressed: () async {
  //     temp = await FirebaseAuthentication().sendOTP(phonenoController.text);
  //   },
  //   child: Text(text),
  // );


}

final result ="";


class FirebaseAuthentication {
  String phoneno = "";
  
  sendOTP(String phoneno) async {
    this.phoneno = phoneno;
    FirebaseAuth auth = FirebaseAuth.instance;
    ConfirmationResult result = await auth.signInWithPhoneNumber(
      '+91$phoneno',
      
//  (phonelogin.result1=result as String) as RecaptchaVerifier?  
  );
    print("OTP Sent to +91 $result");
    Get.snackbar("OTP Sent to", "+91 $phoneno",snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
    return result;
    

  }
  

   authenticate(ConfirmationResult confirmationResult, String otp) async {
    print(confirmationResult);
    UserCredential userCredential = await confirmationResult.confirm(otp);
    userCredential.additionalUserInfo!.isNewUser
        ? Get.off(() => const chathome1())
        : Get.snackbar("Error", "User already exists",snackPosition: SnackPosition.TOP , backgroundColor: Colors.white);
  }

  printMessage(String msg) {
    debugPrint(msg);
  }                        
}

        // ? printMessage("Authentication Successful")


//  Get.snackbar("Phone no", "Login Successful",snackPosition: SnackPosition.TOP , backgroundColor: Colors.white)
