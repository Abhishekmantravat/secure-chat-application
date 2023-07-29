import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:mantravat_intern2/chat/call.dart';
import 'package:mantravat_intern2/chat/chatlogin.dart';
import 'package:mantravat_intern2/chat/constant/chatusers.dart';
import 'package:mantravat_intern2/chat/constant/color.dart';
import 'package:mantravat_intern2/chat/constant/group.dart';
import 'package:mantravat_intern2/chat/constant/mathod/authentication.dart';
import 'package:mantravat_intern2/chat/constant/onlineusers.dart';
import 'package:mantravat_intern2/chat/onetoonechat.dart';
import 'package:mantravat_intern2/chat/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class chathome1 extends StatefulWidget {
  const chathome1({super.key});

  @override
  State<chathome1> createState() => _chathome1State();
}

class _chathome1State extends State<chathome1> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading= false;
  late Map<String, dynamic> userMap;
  List<DocumentSnapshot> searchlist=[];
  final TextEditingController _search = TextEditingController();

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    // print(_search.text);

QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("user").where("email", isEqualTo: _search.text).get();

    // await _firestore.collection('user').where("email", isEqualTo: _search.text).get().then((value){
      setState(() {
        searchlist=snapshot.docs;
        // print(searchlist);
      });

      
    // });  

  }

  // void initState(){
  //   super.initState();
  //   onSearch();
  // }

  @override
  void initState() {
    super.initState();
    onSearch();
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          var name = searchlist[index]['name'];
          return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.2,
            backgroundColor: Colors.white,
            leading: Builder(
              builder: (BuildContext context) {
                return CircleAvatar(
                  maxRadius: 30,
                  // backgroundColor: secondarycolor,

                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    height: 110,
                    width: 110,
                    child: IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        //  tooltip: "Show profile",
                        icon: Image.asset(
                          "assets/images/react2.png",
                        )),
                  ),
                );
              },
            ),
            flexibleSpace: SafeArea(
              child: Container(
                padding: EdgeInsets.only(right: 16, top: 10),
                child: Row(children: <Widget>[
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: SizedBox(
                        height: 43,
                        width: 400,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: TextField(
                                controller:  _search,
                                onChanged: (value) {
                                  onSearch();

                                },
                                  decoration: InputDecoration(
                                    
                                border: InputBorder.none,
                                hintText: "Search...",
                                hintStyle: TextStyle(color: Colors.grey.shade600),
                              
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey.shade600,
                                  size: 20,
                                ),
                                fillColor: Colors.grey.shade200,
                                contentPadding: EdgeInsets.all(8),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade200)),
                              ))),
                        )),
                  ),
                ]),
              ),
            ),
          ),
          backgroundColor: secondarycolor,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.chat),
          ),
          drawer: Drawer(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DrawerHeader(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1)),
                      //BoxDecoration
                      child: UserAccountsDrawerHeader(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        accountName: const Text(
                          "Abhishek Mishra",
                          style: TextStyle(fontSize: 18, color: black),
                        ),
                        accountEmail:
                            Text("6386444795", style: TextStyle(color: black)),
                        currentAccountPictureSize: const Size.square(50),
                        currentAccountPicture: CircleAvatar(
                            // backgroundColor:
                            //     Color.fromARGB(255, 225, 223, 223),
                            child: TextButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>    
                                  //             ProfileScreen()));
                                },
                                child: Image.asset(
                                    "assets/images/react2.png"))), //circleAvatar
                      ), //UserAccountDrawerHeader
                    ), //DrawerHeader

                    const SizedBox(height: 10),

                    ListTile(
                      textColor: const Color.fromARGB(255, 0, 0, 0),
                      iconColor: const Color.fromARGB(255, 0, 0, 0),
                      leading: const Icon(
                        Icons.account_box_rounded,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: const Text(
                        ' Profile ',
                        style: TextStyle(),
                      ),
                      onTap: () {
                        // go to profile screen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()));
                      },
                    ),
                    SizedBox(
                      height: 7,
                    ),

                    ListTile(
                      textColor: const Color.fromARGB(255, 0, 0, 0),
                      iconColor: const Color.fromARGB(255, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      leading: const Icon(Icons.group_add),
                      title: const Text(' New Group '),
                      onTap: () {},
                    ),

                    SizedBox(
                      height: 7,
                    ),
                    ListTile(
                      textColor: const Color.fromARGB(255, 0, 0, 0),
                      iconColor: const Color.fromARGB(255, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      leading: const Icon(Icons.logout),
                      title: const Text("searchlist[index]['name']"),
                      onTap: () {
                        AuthenticationRepository.instance
                      .logout()
                      .then((value) => Get.to(chatlogin()));
                      },
                    ),
                  ],
                ),
              )),
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  DefaultTabController(
                    length: 4, // length of tabs
                    initialIndex: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: TabBar(
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.black26,
                            indicatorColor: Colors.black,
                            tabs: [
                              Tab(text: "name"),
                              Tab(text: 'Online'),
                              Tab(text: 'Groups'),
                              Tab(text: 'Calls'),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height *
                              0.90, //height of TabBarView

                          child: TabBarView(
                            children: <Widget>[
                              chatuser(),
                              onlineusers(),
                              group(),
                              calls(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
