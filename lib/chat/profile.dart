import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mantravat_intern2/chat/constant/color.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
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
                              child:    Image.asset("assets/images/react2.png",
                      )
                              //  Image(image: AssetImage(userprofiledata[index]["image"])),
                              ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.blue),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.edit),
                                iconSize: 20,
                                color: Colors.white,
                                tooltip: "change picture",
                                mouseCursor: SystemMouseCursors.click,
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text("Abhishek Mishra",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    Text(
                      "6386444795",
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
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: grey)),
                          labelText: "Name",
                          labelStyle: TextStyle(color: grey),
                          prefixIcon: Icon(Icons.person_2),
                          prefixIconColor: Colors.grey,
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
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: grey)),
                          labelText: "About",
                          prefixIcon: Icon(Icons.more),
                          prefixIconColor: Colors.grey,
                          labelStyle: TextStyle(color: grey),
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
                        
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: grey)),
                          labelText: "Phone no",
                          labelStyle: TextStyle(color: grey),
                          prefixIcon: Icon(Icons.phone),
                          prefixIconColor: Colors.grey,
                        ),
                      ),

 SizedBox(
                        height: 5,
                      ),
                      const Divider(),
                      SizedBox(
                        height: 5,
                      ),
                       SizedBox(
                  height: 45,
                  width: double.infinity,
child:DecoratedBox(decoration: BoxDecoration(
  color: Colors.lightBlue,
  borderRadius: BorderRadius.circular(20)
),
                  child: ElevatedButton(
                      onPressed: () {}, child: Text("Update Information")),
  )  ),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
               
              ]))),
    );
  }
}
