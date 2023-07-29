import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mantravat_intern2/chat/chathome1.dart';
import 'package:mantravat_intern2/chat/constant/color.dart';
import 'package:mantravat_intern2/model/phonelogin.dart';
import 'package:pinput/pinput.dart';
import 'package:mantravat_intern2/chat/constant/mathod/phonesigncontroller.dart';


class phoneotp extends StatefulWidget {
   phoneotp({required this.Phonenumber  });
String Phonenumber ;

  @override
  State<phoneotp> createState() => _phoneotpState();
}

class _phoneotpState extends State<phoneotp> {
          // TextEditingController otpController = TextEditingController();


  @override
  // void dispose() {
  //   otp.dispose();
  //   super.dispose();
  // }
  
 Widget build(BuildContext context) {
  final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
    borderRadius: BorderRadius.circular(11),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: Color.fromRGBO(255, 255, 255, 1)),
  borderRadius: BorderRadius.circular(8),
);


    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        // backgroundColor: primarycolor,
        leading: BackButton(
          color: grey,
        ),
        
      ),
      
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 140),
            child: Column(
              children: [
                //
                
                    Text("Verification", style: TextStyle(fontSize: 30 ,fontWeight: FontWeight.bold, color: secondarycolor), textAlign: TextAlign.center,),
             
                SizedBox(height: 30,),
                
                    Text("Enter the code sent to the number", style: TextStyle( color: Color.fromARGB(255, 231, 226, 226)),textAlign: TextAlign.center,),
               SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text("+91", style: TextStyle(  color: Colors.white),),
                    SizedBox(width: 3,),
                    Text(widget.Phonenumber, style: TextStyle(  color: Colors.white),)
                  ]
                ),

                SizedBox(height: 80),      

             Pinput(
 length: 6,
 defaultPinTheme: defaultPinTheme,
  focusedPinTheme: focusedPinTheme,
 controller: otp,
  // onChanged: (value) {
  //   otp=value;
  // },
  
  //  androidSmsAutofillMethod:  AndroidSmsAutofillMethod.smsRetrieverApi,

  // validator: (s) {
  //   return s == '2222' ? null : 'Pin is incorrect';
  // },
  // pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
  showCursor: true,
  // onCompleted: (pin) => print(pin),
),
                    SizedBox(height: 25),
                
                    SizedBox(
                      height: 45,
                                        width: double.infinity,
                
                                        child: DecoratedBox(decoration: BoxDecoration(color: secondarycolor,
                                                      borderRadius: BorderRadius.circular(100)
                ),
                
                      child: ElevatedButton(
                          onPressed: () {
                          print(otp);
                            FirebaseAuthentication().authenticate(temp, otp.text);
                            
                            // .whenComplete((){  // print('+91$phonenoController');
                            //   });
                          },
                          child: Text(
                            "Verify Phone Number",
                            style: TextStyle(color: secondarycolor),
                          ))
                          ),
                    ),

                   
                
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(onPressed: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> forgotpassword()));
                    },
                         child: Text("Edit Phone Number. ?",
                        style: TextStyle(color: grey))),
                 ],
                ),
               
              ],
            ),
          
        ),
      ),
    );
  }
  


  
  
}










// class FirebaseAuthentication {
//   String phoneNumber = "";

//    sendOTP(String phoneNumber) async {
//     this.phoneNumber = phoneNumber;
//     FirebaseAuth auth = FirebaseAuth.instance;
//     ConfirmationResult result = await auth.signInWithPhoneNumber(
//       '+91$phoneNumber',
//     );
//     printMessage("OTP Sent to +91 $phoneNumber");
//     return result;
//   }

  // authenticate(ConfirmationResult confirmationResult, String otp) async {
  //   UserCredential userCredential = await confirmationResult.confirm(otp);
  //   userCredential.additionalUserInfo!.isNewUser
  //       ? printMessage("Authentication Successful")
  //       : printMessage("User already exists");
  // }
  // printMessage(String msg) {
  //   debugPrint(msg);
  // }
// }
















  
// > Task :app:signingReport
// Variant: debug
// Config: debug
// Store: C:\Users\Dell\.android\debug.keystore
// Alias: AndroidDebugKey
// MD5: B3:F4:5C:31:20:ED:3C:54:CE:23:E1:00:E1:3E:2D:A4
// SHA1: 4B:C2:4E:63:6D:44:F1:49:9E:84:44:4E:5B:5A:03:24:58:59:38:EF
// SHA-256: 7E:72:28:99:48:E6:56:42:75:75:FE:9E:F4:A4:E3:1F:23:C7:86:E2:B1:49:37:67:FB:00:05:BD:21:28:36:75
// Valid until: Monday, 8 July, 2052
// ----------
// Variant: release
// Config: debug
// Store: C:\Users\Dell\.android\debug.keystore
// Alias: AndroidDebugKey
// MD5: B3:F4:5C:31:20:ED:3C:54:CE:23:E1:00:E1:3E:2D:A4
// SHA1: 4B:C2:4E:63:6D:44:F1:49:9E:84:44:4E:5B:5A:03:24:58:59:38:EF
// SHA-256: 7E:72:28:99:48:E6:56:42:75:75:FE:9E:F4:A4:E3:1F:23:C7:86:E2:B1:49:37:67:FB:00:05:BD:21:28:36:75
// Valid until: Monday, 8 July, 2052
// ----------
// Variant: profile
// Config: debug
// Store: C:\Users\Dell\.android\debug.keystore
// Alias: AndroidDebugKey
// MD5: B3:F4:5C:31:20:ED:3C:54:CE:23:E1:00:E1:3E:2D:A4
// SHA1: 4B:C2:4E:63:6D:44:F1:49:9E:84:44:4E:5B:5A:03:24:58:59:38:EF
// SHA-256: 7E:72:28:99:48:E6:56:42:75:75:FE:9E:F4:A4:E3:1F:23:C7:86:E2:B1:49:37:67:FB:00:05:BD:21:28:36:75
// Valid until: Monday, 8 July, 2052
// ----------
// Variant: debugAndroidTest
// Config: debug
// Store: C:\Users\Dell\.android\debug.keystore
// Alias: AndroidDebugKey
// MD5: B3:F4:5C:31:20:ED:3C:54:CE:23:E1:00:E1:3E:2D:A4
// SHA1: 4B:C2:4E:63:6D:44:F1:49:9E:84:44:4E:5B:5A:03:24:58:59:38:EF
// SHA-256: 7E:72:28:99:48:E6:56:42:75:75:FE:9E:F4:A4:E3:1F:23:C7:86:E2:B1:49:37:67:FB:00:05:BD:21:28:36:75
// Valid until: Monday, 8 July, 2052
// ----------

// > Task :cloud_firestore:signingReport
// Variant: debugAndroidTest
// Config: debug
// Store: C:\Users\Dell\.android\debug.keystore
// Alias: AndroidDebugKey
// MD5: B3:F4:5C:31:20:ED:3C:54:CE:23:E1:00:E1:3E:2D:A4
// SHA1: 4B:C2:4E:63:6D:44:F1:49:9E:84:44:4E:5B:5A:03:24:58:59:38:EF
// SHA-256: 7E:72:28:99:48:E6:56:42:75:75:FE:9E:F4:A4:E3:1F:23:C7:86:E2:B1:49:37:67:FB:00:05:BD:21:28:36:75
// Valid until: Monday, 8 July, 2052
// ----------

// > Task :firebase_auth:signingReport
// Variant: debugAndroidTest
// Config: debug
// Store: C:\Users\Dell\.android\debug.keystore
// Alias: AndroidDebugKey
// MD5: B3:F4:5C:31:20:ED:3C:54:CE:23:E1:00:E1:3E:2D:A4
// SHA1: 4B:C2:4E:63:6D:44:F1:49:9E:84:44:4E:5B:5A:03:24:58:59:38:EF
// SHA-256: 7E:72:28:99:48:E6:56:42:75:75:FE:9E:F4:A4:E3:1F:23:C7:86:E2:B1:49:37:67:FB:00:05:BD:21:28:36:75
// Valid until: Monday, 8 July, 2052
// ----------

// > Task :firebase_core:signingReport
// Variant: debugAndroidTest
// Config: debug
// Store: C:\Users\Dell\.android\debug.keystore
// Alias: AndroidDebugKey
// MD5: B3:F4:5C:31:20:ED:3C:54:CE:23:E1:00:E1:3E:2D:A4
// SHA1: 4B:C2:4E:63:6D:44:F1:49:9E:84:44:4E:5B:5A:03:24:58:59:38:EF
// SHA-256: 7E:72:28:99:48:E6:56:42:75:75:FE:9E:F4:A4:E3:1F:23:C7:86:E2:B1:49:37:67:FB:00:05:BD:21:28:36:75
// Valid until: Monday, 8 July, 2052
// ----------

// > Task :fluttertoast:signingReport
// Variant: debugAndroidTest
// Config: debug
// Store: C:\Users\Dell\.android\debug.keystore
// Alias: AndroidDebugKey
// MD5: B3:F4:5C:31:20:ED:3C:54:CE:23:E1:00:E1:3E:2D:A4
// SHA1: 4B:C2:4E:63:6D:44:F1:49:9E:84:44:4E:5B:5A:03:24:58:59:38:EF
// SHA-256: 7E:72:28:99:48:E6:56:42:75:75:FE:9E:F4:A4:E3:1F:23:C7:86:E2:B1:49:37:67:FB:00:05:BD:21:28:36:75
// Valid until: Monday, 8 July, 2052
// ----------

// > Task :google_sign_in_android:signingReport
// Variant: debugAndroidTest
// Config: debug
// Store: C:\Users\Dell\.android\debug.keystore
// Alias: AndroidDebugKey
// MD5: B3:F4:5C:31:20:ED:3C:54:CE:23:E1:00:E1:3E:2D:A4
// SHA1: 4B:C2:4E:63:6D:44:F1:49:9E:84:44:4E:5B:5A:03:24:58:59:38:EF
// SHA-256: 7E:72:28:99:48:E6:56:42:75:75:FE:9E:F4:A4:E3:1F:23:C7:86:E2:B1:49:37:67:FB:00:05:BD:21:28:36:75
// Valid until: Monday, 8 July, 2052
// ----------

// > Task :path_provider_android:signingReport
// Variant: debugAndroidTest
// Config: debug
// Store: C:\Users\Dell\.android\debug.keystore
// Alias: AndroidDebugKey
// MD5: B3:F4:5C:31:20:ED:3C:54:CE:23:E1:00:E1:3E:2D:A4
// SHA1: 4B:C2:4E:63:6D:44:F1:49:9E:84:44:4E:5B:5A:03:24:58:59:38:EF
// SHA-256: 7E:72:28:99:48:E6:56:42:75:75:FE:9E:F4:A4:E3:1F:23:C7:86:E2:B1:49:37:67:FB:00:05:BD:21:28:36:75
// Valid until: Monday, 8 July, 2052
// ----------

// > Task :smart_auth:signingReport
// Variant: debugAndroidTest
// Config: debug
// Store: C:\Users\Dell\.android\debug.keystore
// Alias: AndroidDebugKey
// MD5: B3:F4:5C:31:20:ED:3C:54:CE:23:E1:00:E1:3E:2D:A4
// SHA1: 4B:C2:4E:63:6D:44:F1:49:9E:84:44:4E:5B:5A:03:24:58:59:38:EF
// SHA-256: 7E:72:28:99:48:E6:56:42:75:75:FE:9E:F4:A4:E3:1F:23:C7:86:E2:B1:49:37:67:FB:00:05:BD:21:28:36:75
// Valid until: Monday, 8 July, 2052
// ----------

// > Task :sqflite:signingReport
// Variant: debugAndroidTest
// Config: debug
// Store: C:\Users\Dell\.android\debug.keystore
// Alias: AndroidDebugKey
// MD5: B3:F4:5C:31:20:ED:3C:54:CE:23:E1:00:E1:3E:2D:A4
// SHA1: 4B:C2:4E:63:6D:44:F1:49:9E:84:44:4E:5B:5A:03:24:58:59:38:EF
// SHA-256: 7E:72:28:99:48:E6:56:42:75:75:FE:9E:F4:A4:E3:1F:23:C7:86:E2:B1:49:37:67:FB:00:05:BD:21:28:36:75
// Valid until: Monday, 8 July, 2052
// ----------

// BUILD SUCCESSFUL in 1h 20m 47s
// 9 actionable tasks: 9 executed
// PS E:\firebaseproject\mantravat project\mantravat_intern2\android> 

