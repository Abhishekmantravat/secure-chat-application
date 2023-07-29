import 'package:flutter/material.dart';
import 'package:mantravat_intern2/chat/constant/color.dart';

class userprofile extends StatefulWidget {
   userprofile({required this.username, required this.image, });
String username;
  String image;
    // String phoneno;
  // String about;


  @override
  State<userprofile> createState() => _userprofileState();
}

class _userprofileState extends State<userprofile> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondarycolor,
        elevation: 1.2,
        title: Text("Profile", style: TextStyle(color: Colors.black)),
        leading: BackButton(
          color: black,
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(top: 30),
              child: Column(children: [
                Container(
                  child: Column(children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child:    Image.asset(widget.image,
                              fit: BoxFit.fill,
                      )
                              //  Image(image: AssetImage(userprofiledata[index]["image"])),
                              ),
                        ),

                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(widget.username,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    Text(
                      "6356******",
                      style: TextStyle(color: Color.fromARGB(255, 48, 45, 45)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: grey),
                        readOnly: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          
                          focusedBorder: InputBorder.none,
                          hintText: widget.username,
                          hintStyle: TextStyle(color: black),
                          prefixIcon: Icon(Icons.person_2),
                          prefixIconColor: black,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      const Divider(),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        style: TextStyle(color: grey),
                                                readOnly: true,

                        decoration: InputDecoration(
                         border: InputBorder.none,
                         errorBorder: InputBorder.none,
                         filled: false,
                          hintText: "Hello my dear",
                          prefixIcon: Icon(Icons.more),
                          prefixIconColor: black,
                          hintStyle: TextStyle(color: black),
                        ),
                      ),
                      
                      SizedBox(
                        height: 5,
                      ),
                      const Divider(),
                      SizedBox(
                        height: 5,
                      ),

                      TextFormField(
                        style: TextStyle(color: grey),
                                                readOnly: true,

                        decoration: InputDecoration(
                       border: InputBorder.none,
                          hintText: "6356******",
                          hintStyle: TextStyle(color: black),
                          prefixIcon: Icon(Icons.phone),
                          prefixIconColor: black,
                        ),
                      ),

 SizedBox(
                        height: 5,
                      ),
                     
                    ],
                  ),
                ),
                const Divider(),
                
               
              ]))),
    );
  }
}
