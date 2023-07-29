import 'package:flutter/material.dart';
import 'package:mantravat_intern2/chat/constant/color.dart';
import 'package:mantravat_intern2/chat/onetoonechat.dart';
import 'package:xen_popup_card/xen_card.dart';
import 'package:cached_network_image/cached_network_image.dart';

late Size mq;
class chatuser extends StatefulWidget {
  const chatuser({super.key});

  @override
  State<chatuser> createState() => _chatuserState();
}

class _chatuserState extends State<chatuser> {
   List<user> users = [
    user(
        username: "पंडित धीरेंद्र कृष्ण शास्त्री",
                lastmessage: "ok",

        image: "assets/images/dhirendra.jpg",
        lastmessagetime: "3h ago",

        
    ),
     user(
        username: "Aniruddhacharya ",
                lastmessage: "ok",

        image: "assets/images/anuradha.jpg",
        lastmessagetime: "3h ago",

        
    ),
     user(
        username: "Aachal",
                lastmessage: "ok",

        image: "assets/images/react2.png",
        lastmessagetime: "1m ago",

        
    ),
     user(
        username: "Aacharya",
                lastmessage: "ok",

        image: "assets/images/react2.png",
        lastmessagetime: "2h ago",

        
    ),
     user(
        username: "Aadal Azhagi",
                lastmessage: "ok",

        image: "assets/images/react2.png",
        lastmessagetime: "yesterday ",

        
    ),
     user(
        username: "Aadarsh",
                lastmessage: "ok",

        image: "assets/images/react2.png",
        lastmessagetime: "3h ago",

        
    ),
     user(
        username: "Aadav",
                lastmessage: "ok",

        image: "assets/images/react2.png",
        lastmessagetime: "2h ago",

        
    ),
     user(
        username: "Aadhik",
                lastmessage: "ok",

        image: "assets/images/react2.png",
        lastmessagetime: "20m ago",

        
    ),
     user(
        username: "Aadinath",
                lastmessage: "ok",

        image: "assets/images/react2.png",
        lastmessagetime: "3h ago",

        
    ), user(
        username: "Aadinadh",
                lastmessage: "ok",

        image: "assets/images/react2.png",
        lastmessagetime: "3h ago",

        
    ),
     user(
        username: "Rached jenkins",
                lastmessage: "ok",

        image: "assets/images/react2.png",
        lastmessagetime: "3h ago",

        
    )];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
         Container(
                              padding: EdgeInsets.only(top: 6),

           child:
             ListView.builder(
                      itemCount: users.length,
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                      return  SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(bottom: 6),
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
                        child: Image.asset(users[index].image,
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
                                  imageUrl: users[index].image,
                                  // placeholder: (context, url) =>
                                  //     const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const CircleAvatar(
                                          child: Icon(Icons.person)),
                               
                               )
                          )
                                ),
                                
                        


                          title: Text(
                            users[index].username,
                            style: TextStyle(color: black),
                          ),
                          subtitle: Text(
                            users[index].lastmessage,
                            style: TextStyle(color: grey),
                          ),
                          trailing: Text(users[index].lastmessagetime, style: TextStyle(color: grey)),
                          tileColor: secondarycolor,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => singlechat(username:users[index].username,image:users[index].image  ,))));
                          },
                          selectedColor: Colors.pink,
                          ),
                     
   
                     
                    

                      
                    ]
                    ),
                 
                   
                       ) 
                       );
                    
  }
  ),
         )
                );
  }
}



class user {
  String username;
    String image;
  String lastmessage;

  String lastmessagetime;

  
  user(
      {
        required this.username,
        required this.image,
        required this.lastmessage,
        required this.lastmessagetime,

      // required this.time,
    });
}