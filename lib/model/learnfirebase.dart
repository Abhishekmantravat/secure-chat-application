import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class firebase extends StatefulWidget {
  const firebase({super.key});

  @override
  State<firebase> createState() => _firebaseState();
}

class _firebaseState extends State<firebase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          
        child: StreamBuilder<QuerySnapshot>  (
              stream:  FirebaseFirestore.instance.collection("random").snapshots(),
              builder: (context, snapshot){
                final user =snapshot.data!.docs;
                         return ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                   if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else {
                    return 
                    
                    Column(
                      children: [
      
                        Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black ,
              ),
              child: TextButton(onPressed: () async{
      await FirebaseFirestore.instance.collection("random").add({
        "name":'abhisehk',
        "address":'mohammad pur'
      
              });
              }, child: Text("Add data"),
              
              ),
            ),
                     
                      
                         SizedBox( 
                           height: 200,
              width: double.infinity,
              child:DecoratedBox(decoration: BoxDecoration(color: Colors.red),
                                  child:    Row(
                                          children: [
                                            Text(user[index]['name']),
                                                                                        Text(user[index]['name']),

                                            Text(user[index]['address']),
                                          ],
                                         ),
              ),
                                     
                                      // Text(user[index]['address']),
                                        
                         
                                ),
                ]);
                    
              }
                  },
                );
              },
            ),
      )
       
    );
  }
}
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseFirestore.instance.collection("random").snapshots(),
    builder: (context, snapshot) {
                final user =snapshot.data!.docs;
                return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Text(user[index]["name"]);
                },
                );
    },);
     
    }
  }
