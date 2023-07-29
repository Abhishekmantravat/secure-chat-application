import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mantravat_intern2/chat/constant/color.dart';
import 'package:mantravat_intern2/chat/constant/userprofile.dart';
import 'package:xen_popup_card/xen_card.dart';

class singlechat extends StatefulWidget {
   singlechat({required this.username, required this.image });
String username;
  String image;
 
  @override
  State<singlechat> createState() => _singlechatState();
}

class _singlechatState extends State<singlechat> {
  


  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Jai Shree Ram", messageType: "receiver"),
    ChatMessage(messageContent: "Jai Shree Ram ji?", messageType: "receiver"),
    ChatMessage(messageContent: "How are you?", messageType: "sender"),
    ChatMessage(messageContent: "All is well by the grace f the Lord", messageType: "receiver"),
    ChatMessage(messageContent: "And you?", messageType: "receiver"),
        ChatMessage(messageContent: "Mine is fine too", messageType: "sender"),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        

        appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                    tooltip: "Back",

                  icon: Icon(Icons.arrow_back,color: Colors.black,),
                ),
                SizedBox(width: 3,),
                IconButton(onPressed: (){
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
                        child: Image.asset(widget.image,
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
                                  imageUrl:widget.image,
                                  // placeholder: (context, url) =>
                                  //     const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const CircleAvatar(
                                          child: Icon(Icons.person)),
                               
                               )
                          )
                                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> userprofile(username: widget.username, image: widget.image, )));
                      }, child:                       Text(widget.username,style: TextStyle( fontSize: 16 , color:black,fontWeight: FontWeight.w600),),
),
                      SizedBox(height: 6,),
                      Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 10),),
                    ],
                  ),
                ),
                 IconButton(
                    onPressed: () {},
                                    tooltip: "Calls",

                    icon: Icon(
                      Icons.call,
                      color: black,
                    )),
                    SizedBox(width: 6,),
                IconButton(
                    onPressed: () {},
                                    tooltip: "Vedio Call",

                    icon: Icon(Icons.video_camera_back, color: Colors.black)),
                                        SizedBox(width: 6,),
// IconButton(
//                     onPressed: () {},
//                                     tooltip: "More options",

//                     icon: Icon(Icons.more_vert, color: Colors.black)),
PopupMenuButton(
            onSelected: (item) => handleClick(item),

itemBuilder: (context) =>[
  PopupMenuItem(value: 0, child: Text("View contact")),
    PopupMenuItem(value:1,child: Text("Wallpaper")),
  PopupMenuItem( value: 2, child: Text("Search")),
  PopupMenuItem( value: 3,child: Text("clear chat")),
  PopupMenuItem( value: 4,child: Text("Report")),

]
),

              ]
            ),
          ),
        ),
      ),
        body: 
           Stack(

            children: [

               ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                child: Align
                
                (
                  alignment: (messages[index].messageType== "receiver"? Alignment.topLeft:Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: (messages[index].messageType == "receiver"?BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)):BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
                      // BorderRadius.circular(20),
                      color: (messages[index].messageType == "receiver"?Colors.grey.shade200:Colors.blue[200]
                    ),),
                    padding: EdgeInsets.all(16),
                    child: Text(messages[index].messageContent,style: TextStyle(fontSize: 15),))),
              );
            },
          ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(left: 10,top: 10),
                  height: 60,
                   width:double.infinity,
                   color: secondarycolor,
                   child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(30),

                          ),
                          child: Icon(Icons.add, color: secondarycolor, size: 20,),
                        ),
                        
                      ),
                      SizedBox(width: 15,),
                      Expanded(child: TextField(
                        maxLines:60,
                        decoration: InputDecoration(
                          hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                        ),
                      )),
                      SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: (){},
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                    ],
                   ),
                ),
              )
            ],
           ));
  }
}


//  chatmessagr chass
class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}




// popupmenubutton items

void handleClick(int item) {
  switch (item) {
    case 0:
      break;
    case 1:
      break;
      case 2:
      break;
      case 3:
      break;
      case 4:
      break;
      
  }
}