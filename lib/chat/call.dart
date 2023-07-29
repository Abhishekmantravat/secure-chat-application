import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mantravat_intern2/chat/constant/callinfo.dart';
import 'package:mantravat_intern2/chat/constant/color.dart';
import 'package:xen_popup_card/xen_card.dart';

class calls extends StatefulWidget {
  const calls({super.key});

  @override
  State<calls> createState() => _callsState();
}

class _callsState extends State<calls> {
  List<call> calls = [
    call(
        username: "Aadal Azhagi",
        callType: "outgoing call",
                image:"assets/images/react2.png",

                callway: "video",

        callstatus: "missed call",
        time: "July 27, 14:12 "),
    call(
        username: "Aacharya",
        callType: "incoming call",
                        image: "assets/images/react2.png",

                callway: "video",

        callstatus: "missed call",
        time: "July 27, 14:12 "),
    call(
        username: "Aachal",
        callType: "incoming call",
                callway: "audio",
                image:"assets/images/react2.png",

        callstatus: "recive",
        time: "July 27, 14:12 "),
    call(
        username: "पंडित धीरेंद्र कृष्ण शास्त्री",
        callType: "outgoing call",
                callway: "audio",
                image: "assets/images/dhirendra.jpg",

        callstatus: "recive",
        time: "July 27, 14:12 "),
    call(
        username: "Aniruddhacharya",
        callType: "incoming call",
                callway: "audio",
                image: "assets/images/anuradha.jpg",

        callstatus: "Aachal",
        time: "July 27, 14:12 "),
    call(
        username: "Sanki",
        callType: "outgoing call",
                callway: "audio",
                image: "assets/images/react2.png",

        callstatus: "missed call",
        time: "July 27, 14:12 "),
    call(
        username: "Ravina",
        callType: "incoming call",
        callway: "audio",
                image:"assets/images/react2.png",
        callstatus: "missed call",
        time: "July 27, 14:12 "),
    call(
        username: "Aacharya",
        callType: "outgoing call",
                callway: "video",
                image: "assets/images/react2.png",

        callstatus: "recive",
        time: "July 27, 14:12 "),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, top: 30),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.phone_android),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Recent",
                      style: TextStyle(color: grey),
                    )
                  ],
                ),
              ),
              ListView.builder(
                  itemCount: calls.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    Color iconColor;
      // Icon icon;
                    if (calls[index].callType == "incoming call" &&
                        calls[index].callstatus == "missed call") {
                      iconColor = Colors.red;
                    } else if (calls[index].callType == "outgoing call") {
                      iconColor = Colors.green;
                    } else {
                      iconColor = Colors.green;
                    }
      
                    Color textColor;
      // Icon icon;
                    if (calls[index].callType == "incoming call" &&
                        calls[index].callstatus == "missed call") {
                      textColor = Colors.red;
                    } else {
                      textColor = Colors.black;
                    }
      
                    return ListTile(
                      leading:  IconButton(onPressed: (){
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
                        child: Image.asset(calls[index].image,
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
                                  imageUrl: calls[index].image,
                                  // placeholder: (context, url) =>
                                  //     const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const CircleAvatar(
                                          child: Icon(Icons.person)),
                               
                               )
                          )
                                ),
                      title: Text(
                        calls[index].username,
                        style: TextStyle(color: textColor),
                      ),
                      subtitle: Row(
                        children: [
                          Icon(
                            calls[index].callType == "outgoing call"
                                ? Icons.call_missed
                                : Icons.call_received,
                            color: iconColor,
                          ),
                          Text(
                            calls[index].time,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        calls[index].callway == "audio" ? Icons.call:
                        Icons.missed_video_call,
                        color: blue,
                      ),
                      tileColor: secondarycolor,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> callinfo(username:calls[index].username ,image: calls[index].image,)));
                      },
                    );
                  }),
              SizedBox(
                height: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class call {
  String username;
  String callType;
  String time;
  String callstatus;
  String image;
    String callway;

  call(
      {required this.username,
      required this.time,
      required this.callstatus,
      required this.callType,
      required this.image,
      required this.callway});
}









//https://github.com/Abhishekmantravat/chatapp.git




