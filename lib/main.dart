import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mantravat_intern2/chat/chathome.dart';
import 'package:mantravat_intern2/chat/chathome1.dart';
import 'package:mantravat_intern2/chat/chatlogin.dart';
import 'package:mantravat_intern2/chat/constant/mathod/authentication.dart';
import 'package:mantravat_intern2/chat/constant/splash1.dart';
import 'package:mantravat_intern2/model/googlelogin.dart';
import 'package:mantravat_intern2/model/learnfirebase.dart';

import 'package:get/get.dart';

void main() async {
  //initializing the firebase
  WidgetsFlutterBinding.ensureInitialized();

    if (kIsWeb) {
    //  for web fire base connection Abhishek
    await Firebase.initializeApp(
        options: const FirebaseOptions(
     apiKey: "AIzaSyBDAP64sEd4NCygTnMdmHEAWmXH-1d89YM",
  authDomain: "mantravat-intern2.firebaseapp.com",
  projectId: "mantravat-intern2",
  storageBucket: "mantravat-intern2.appspot.com",
  messagingSenderId: "1005115983298",
  appId: "1:1005115983298:web:e3d2c86c1aab734a8dc25b",
  measurementId: "G-9VL3878J9R"
    )).then((value) => Get.put(AuthenticationRepository()));
  } 
  else {
    //  for android fire base connection connection  priya
    print("not connected");
        
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
    
            debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      // theme: ThemeData(

      //   colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 255, 255)),
      //   useMaterial3: true,
      // ),
      home:  chatlogin(),
    );
  }
}




// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:mantravat_intern2/chat/chatlogin.dart';
// void main() {
//   runApp(MyApp());
// }
  
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Splash Screen',
//       home: MyHomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
  
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 5),
//           ()=>Navigator.pushReplacement(context,
//                                         MaterialPageRoute(builder:
//                                                           (context) => 
//                                                           chatlogin()
//                                                          )
//                                        )
//          );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
        
//           child: 
//           Column(mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Center(child: Text("Hindu Rashtra",style: TextStyle(color: Color.fromARGB(255, 245, 145, 15), fontSize: 40),)),
// Column(mainAxisAlignment: MainAxisAlignment.end,
// crossAxisAlignment: CrossAxisAlignment.end,
//   children: [
//     Container(
//       child: Text("तुम मेरा साथ दो मे तुम्हे हिंदू राष्ट्र दुंगा🙏🚩",style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 30)),
//     )
//   ],
// )
//             ],
//           ),
//           );
        
    
//   }
// }
