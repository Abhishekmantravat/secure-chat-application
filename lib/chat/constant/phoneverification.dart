import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
TextEditingController phoneNumber = TextEditingController();
  TextEditingController otp = TextEditingController();
  
class PhoneOTPVerification extends StatefulWidget {
  const PhoneOTPVerification({Key? key}) : super(key: key);
  
  @override
  State<PhoneOTPVerification> createState() => _PhoneOTPVerificationState();
}
  
class _PhoneOTPVerificationState extends State<PhoneOTPVerification> {
  
  bool visible = false;
  var temp;
  
  // @override
  // void dispose() {
  //   phoneNumber.dispose();
  //   otp.dispose();
  //   super.dispose();
  // }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Phone OTP Authentication"),
      ),
      body: SizedBox(
        // width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
             TextFormField(
          controller: phoneNumber,
          decoration: InputDecoration(
            hintText: "labelText",
            hintStyle: TextStyle(color: Colors.blue),
            filled: true,
            fillColor: Colors.blue[100],
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: const Color.fromARGB(0, 2, 1, 1)),
              borderRadius: BorderRadius.circular(5.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.5),
            ),
          ),
        ),
        TextButton(onPressed: () async {
  temp = await FirebaseAuthentication().sendOTP(phoneNumber.text);
}, child: Text("data"))   ,
          TextFormField(
          controller: otp,
          decoration: InputDecoration(
            hintText: "labelText",
            hintStyle: TextStyle(color: Colors.blue),
            filled: true,
            fillColor: Colors.blue[100],
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: const Color.fromARGB(0, 2, 1, 1)),
              borderRadius: BorderRadius.circular(5.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.5),
            ),
          ),
        ),
TextButton(onPressed: (){
FirebaseAuthentication().authenticate(temp, otp.text);
}, child: Text("data"))          ],
        ),
      ),
    );
  }
  
  // Widget SendOTPButton(String text) => ElevatedButton(
  //   onPressed: () async {
  //     setState(() {visible = !visible;});
  //     temp = await FirebaseAuthentication().sendOTP(phoneNumber.text);
  //   },
  //   child: Text(text),
  // );
  
  // Widget SubmitOTPButton(String text) => ElevatedButton(
  //   onPressed: () =>FirebaseAuthentication().authenticate(temp, otp.text),
  //   child: Text(text),
  // );
  
  // Widget inputTextField(String labelText, TextEditingController textEditingController, BuildContext context) =>
  //   Padding(
  //     padding: EdgeInsets.all(10.00),
  //     child: SizedBox(
  //       width: MediaQuery.of(context).size.width / 1.5,
  //       child: TextFormField(
  //         obscureText: labelText == "OTP" ? true : false,
  //         controller: textEditingController,
  //         decoration: InputDecoration(
  //           hintText: labelText,
  //           hintStyle: TextStyle(color: Colors.blue),
  //           filled: true,
  //           fillColor: Colors.blue[100],
  //           enabledBorder: OutlineInputBorder(
  //             borderSide: BorderSide(color: const Color.fromARGB(0, 2, 1, 1)),
  //             borderRadius: BorderRadius.circular(5.5),
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //             borderSide: BorderSide(color: Colors.transparent),
  //             borderRadius: BorderRadius.circular(5.5),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
}
  
class FirebaseAuthentication {
  String phoneNumber = "";
  
  sendOTP(String phoneNumber) async {
    this.phoneNumber = phoneNumber;
    FirebaseAuth auth = FirebaseAuth.instance;
    ConfirmationResult result = await auth.signInWithPhoneNumber(
      '+91$phoneNumber',
    );
    printMessage("OTP Sent to +91 $phoneNumber");
    return result;
  }
  
  authenticate(ConfirmationResult confirmationResult, String otp) async {
    UserCredential userCredential = await confirmationResult.confirm(otp);
    userCredential.additionalUserInfo!.isNewUser
        ? printMessage("Authentication Successful")
        : printMessage("User already exists");
  }
  
  printMessage(String msg) {
    debugPrint(msg);
  }
}