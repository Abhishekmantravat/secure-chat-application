import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mantravat_intern2/chat/chathome.dart';
import 'package:mantravat_intern2/chat/chathome1.dart';
import 'package:mantravat_intern2/chat/constant/color.dart';
import 'package:mantravat_intern2/chat/constant/mathod/signupcontroller.dart';
import 'package:mantravat_intern2/chat/forgotpassword.dart';
import 'package:mantravat_intern2/model/phonelogin.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class chatlogin extends StatefulWidget {
  const chatlogin({super.key});

  @override
  State<chatlogin> createState() => _chatloginState();
}

class _chatloginState extends State<chatlogin> {
   final GoogleSignIn googleSignIn = GoogleSignIn();
  String? name, imageUrl, userEmail, uid;


  late bool _passwordVisible;
  late bool validate;

@override
void initState() {
    _passwordVisible = false;
    validate= false;
    super.initState();
}
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formkey = GlobalKey<FormState>();
      final GlobalKey<FlutterPwValidatorState> validatorKey = GlobalKey<FlutterPwValidatorState>();

    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text(
          "Aao Jude Sanatani Bharat se",
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), fontStyle: FontStyle.italic),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 250),
          child: Form(
key: _formkey,
            child: Column(
              children: [
                //
                TextFormField(
                  controller: controller.email,
             
              
                  style: TextStyle(color: grey),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: grey)),
                                       labelText: "Email",

                    labelStyle: TextStyle(color: grey),
                  ),
                ),
                SizedBox(height: 15,),
                
                TextFormField(
                   controller: controller.password,
                obscureText: !_passwordVisible,
                  style: TextStyle(color: grey),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: grey)),
                    labelText: "Password",
                    labelStyle: TextStyle(color: grey),
                    suffixIcon: GestureDetector(
                  onDoubleTap: () {
            setState(() {
              _passwordVisible = true;
            });
                  },
                  onTap: () {
            setState(() {
              _passwordVisible = false;
            });
                  },
                  child: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off),
            ),
                  ),
                
                
                  ),
                   SizedBox(height: 5,),
                  SizedBox(
                    width: double.infinity,
                    child: FlutterPwValidator(
                      key: validatorKey,
                      controller: controller.password,
                      minLength: 8,
                      // specialCharCount: 1,
                      width: 400,
                      height: 30,

successColor: Colors.green,                      onSuccess: () {
                        setState(() {
              validate = true;

            });
                        // ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        //     content:  Text("Password is matched")));
                      },
                      onFail: () {
                        // print("NOT MATCHED");
                      },
                    ),
                  ),
                
                //
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> forgotpassword()));
                    },
                         child: Text("Forgot Password?",
                        style: TextStyle(color: grey))),
                 ],
                ),
                SizedBox(height: 15,),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: DecoratedBox(decoration: BoxDecoration(color: blue,
                      borderRadius: BorderRadius.circular(100)
                      ),
                      
                      child: ElevatedButton(
                          onPressed: () {



                               if(validate==true){
                           
 SignUpController.instance.registerUser(
                          controller.email.text.trim(),
                          controller.password.text.trim());                            }
                            else{
                               ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                            content: new Text("Check Your Password")));
                            }
                            
                                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> chathome1()));
                
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: secondarycolor),
                          ))),
                    ),
                SizedBox(height: 20,),
                
                    SizedBox(
                      height: 40,
                                        width: double.infinity,
                
                                        child: DecoratedBox(decoration: BoxDecoration(color: secondarycolor,
                                                      borderRadius: BorderRadius.circular(100)
                ),
                
                      child: ElevatedButton(
                          onPressed: () {
                            signInWithGoogle();
                          },
                          child: Text(
                            "Sign in with Google",
                            style: TextStyle(color: black),
                          ))),
                    ),
 SizedBox(height: 20,),

                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: DecoratedBox(decoration: BoxDecoration(color: blue,
                      borderRadius: BorderRadius.circular(100)
                      ),
                      
                      child: ElevatedButton(
                          onPressed: () {
                            
                           
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> phonelogin()));
                            
                          
                          },
                          child: Text(
                            "Sign in with Phone no",
                            style: TextStyle(color: black),
                          ))),
                    ),
                    SizedBox(height: 30,),
                
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",style: TextStyle(color: grey),),
                        TextButton(onPressed: (){
                          
                        },
                         child: Text("Register",
                        style: TextStyle(color: grey)))
                      ],
                    )
               
              ],
            ),
          ),
        ),
      ),
    );
  }
   Future<User?> signInWithGoogle() async {
    // Initialize Firebase
    await Firebase.initializeApp();
    User? user;
    FirebaseAuth auth = FirebaseAuth.instance;
    // The `GoogleAuthProvider` can only be 
    // used while running on the web
    GoogleAuthProvider authProvider = GoogleAuthProvider();
  
    try {
      final UserCredential userCredential =
      await auth.signInWithPopup(authProvider);
      user = userCredential.user;
    } catch (e) {
      print(e);
    }
  
    if (user != null) {
      uid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;
  
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('auth', true);
      print("name: $name");
      print("userEmail: $userEmail");
      print("imageUrl: $imageUrl");
    }
    return user;
  }
}









