import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mantravat_intern2/chat/constant/color.dart';
import 'package:xen_popup_card/xen_card.dart';

class group extends StatefulWidget {
  const group({super.key});

  @override
  State<group> createState() => _groupState();
}

class _groupState extends State<group> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, top: 20, right: 30),
                child:  Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("All groups"),
                        SizedBox(
                          height: 40,
                          width: 140,
                          child:DecoratedBox(decoration: BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20))

                          ),
                          child: TextButton(onPressed:(){},  child: Text("Create New",style: TextStyle(fontSize: 17, color: Colors.white),))))
                      ],
                    ),
                    SizedBox(height: 15),
                 ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                  return  SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(top: 6),
                child: Column(children: [
               ListTile(
                      leading: IconButton(onPressed: (){
                             showDialog(
                                context: context,
                                builder: (builder) => Container(
                                  padding: EdgeInsets.only(left:MediaQuery.of(context).size.width * 0.18,
                             right:MediaQuery.of(context).size.width * 0.18,bottom: MediaQuery.of(context).size.height*0.20, 
                             top:  MediaQuery.of(context).size.height*0.20,),
                                
                                  child: XenPopupCard(
                                    body: 
                                      Container( 
                                       height: double.infinity,
                        width: double.infinity,
                        child: Image.asset("assets/images/images.jpg",
                         height: double.infinity,
                        width: double.infinity,
                        ),
                                      )
                                    ),
                                ),
                                ); 
                          }, icon: 
                          ClipRRect(
                                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * .10),
                                child: CachedNetworkImage(
                                  width: MediaQuery.of(context).size.height * .090,
                                  height: MediaQuery.of(context).size.height * .090,
                                  fit: BoxFit.fill,
                                  //  user profile image in users collection
                                  imageUrl: "assets/images/images.jpg",
                                  // placeholder: (context, url) =>
                                  //     const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const CircleAvatar(
                                          child: Icon(Icons.person)),
                               
                               )
                          )
                                ),
                      title: Text(
                        "Hindu Rashtra",
                        style: TextStyle(color: black),
                      ),
                      subtitle: Text(
                        "Jai Shree Ram",
                        style: TextStyle(color: grey),
                      ),
                      trailing: Text("today", style: TextStyle(color: grey)),
                      tileColor: secondarycolor,
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: ((context) => singlechat())));
                      },
                      selectedColor: Colors.pink,
                      ),
                 
   
                 
              
                  
                ]
                )
               
                   ) );
                
  }
  )
                  ],
                ),
               
             
              ),
            ]
    )
        )
      )
    );

  }
}