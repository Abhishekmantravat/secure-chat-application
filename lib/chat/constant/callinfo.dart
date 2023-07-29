import 'package:flutter/material.dart';
import 'package:mantravat_intern2/chat/constant/color.dart';
import 'package:xen_popup_card/xen_card.dart';

class callinfo extends StatelessWidget {
   callinfo({required this.username ,required this.image ,});
String username;
String image;

var size,height,width;
  @override
  Widget build(BuildContext context) {
 size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondarycolor,
        elevation: 1.2,
        title: const Text("Call info", style: TextStyle(color: Colors.black)),
        leading: const BackButton(
          color: black,
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.message, color: black,)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 15, top: 25),
        child: Column(
          children: [
            Row(
              children: [
 


                  SizedBox(
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child:     Image.asset(image, fit: BoxFit.fill,)
                              //  Image(image: AssetImage(userprofiledata[index]["image"])),
                              ),
                        ),
                const SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    
                       Text( username,style: TextStyle( fontSize: 16 , color:black,fontWeight: FontWeight.w600),),

                      const SizedBox(height: 4,),
                      Text("Hello my dear",style: TextStyle(color: Colors.grey.shade600, fontSize: 10),),
                    ],
                  ),
                ),
                 IconButton(
                    onPressed: () {},
                                    tooltip: "Calls",

                    icon: const Icon(
                      Icons.call,
                      color: black,
                    )),
                    const SizedBox(width: 8,),
                IconButton(
                    onPressed: () {
                    
          },
                                    tooltip: "Vedio Call",

                    icon: const Icon(Icons.video_camera_back, color: Colors.black)),
                                        const SizedBox(width: 6,),
    
           
              ],
            ),
            const SizedBox(height: 10,),
             
        const  Divider(),
                         const SizedBox(height: 15,),
Row(
  children: [
    Padding(padding: EdgeInsets.only(left: 38)),
     Text("july 17",style: TextStyle(color: grey),),

  ]
  ,
)          
       ,     
            const SizedBox(height: 20,),





 Row(
              children: [

             Icon(Icons.call_received, ),
              
                const SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    
                      const Text("Incoming",style: TextStyle( fontSize: 16 , color:black,),),

                      const SizedBox(height: 2,),
                      Text("7:16 pm",style: TextStyle(color: Colors.grey.shade600, fontSize: 15),),
                    ],
                  ),
                ),
                 const Text("Call duration",style: TextStyle(color: grey),),
                                        
    
           
              ],
            ),



          ],
        ),
      ),
      
    );
  }
}





