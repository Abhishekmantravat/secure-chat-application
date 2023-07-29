import 'package:flutter/material.dart';
import 'package:mantravat_intern2/chat/chatlogin.dart';
import 'package:mantravat_intern2/chat/constant/color.dart';

class chathome extends StatefulWidget {
  const chathome({super.key});

  @override
  State<chathome> createState() => _chathomeState();
}

class _chathomeState extends State<chathome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text(
          "Hello chattly",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
              height: 50,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: grey,
                  
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                                      style: TextStyle(color: secondarycolor),

                        decoration: InputDecoration(
                            fillColor: grey,
                            border: InputBorder.none,
                            hintText: "Search Bar",
                            hintStyle: TextStyle(color: secondarycolor),
                            icon: Icon(Icons.search, color: secondarycolor,)),
                      )))),
                      ListTile(
                        // tileColor: Colors.,
                        title: Text("Dr. Arvind kumar Mishra",style: TextStyle(color: secondarycolor)),
                        subtitle: Text("arvingkumarmishra@gmail.com",style: TextStyle(color: secondarycolor),),
                        trailing: SizedBox(child: DecoratedBox(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: blue),
                          child: TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>chatlogin()));
                          },
                          
                          child: const Text("Message",style: TextStyle(color: secondarycolor))),
                        ),)
                      ),
        ],
      ),
    );
  }
}
