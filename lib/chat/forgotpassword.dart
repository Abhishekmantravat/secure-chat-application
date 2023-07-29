import 'package:flutter/material.dart';
import 'package:mantravat_intern2/chat/chatlogin.dart';
import 'package:mantravat_intern2/chat/constant/color.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({super.key});

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
                backgroundColor: primarycolor,
title: Text("forgotpassword",style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), fontStyle: FontStyle.italic),
),
        leading: BackButton(
          color: secondarycolor,
        ),
        
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20,top: 80),
        child: Column(
          children: [
           TextFormField(
              style: TextStyle(color: grey),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: grey)),
                labelText: "New Password",
                labelStyle: TextStyle(color: grey),
              ),
            ),
SizedBox(height: 20,),

             TextFormField(
              style: TextStyle(color: grey),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: grey)),
                labelText: "Confirm new Password",
                labelStyle: TextStyle(color: grey),
              ),

            ),
            SizedBox(height: 25,),

            SizedBox(
              height: 40,
              width: double.infinity,
          
              child: ElevatedButton(
               
                onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> chatlogin()));

                }, 
              
                child: Text("Save Password"),
            
                
                ),
            ),
            
          ],
        ),
      ),
    );
  }
}