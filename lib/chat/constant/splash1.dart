import 'dart:async';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:mantravat_intern2/chat/chatlogin.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({super.key});
void initState() {
    Timer(Duration(seconds: 3),
          ()=>Navigator.pushReplacement(context as BuildContext,
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                          SecondScreen()
                                                         )
                                       )
         );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("GeeksForGeeks")),
      body: Center(
        child:Text("Home page",textScaleFactor: 2,)
      ),
    );
  }
}