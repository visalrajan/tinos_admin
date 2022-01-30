import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterTeam extends StatefulWidget {
  const FlutterTeam({Key? key}) : super(key: key);

  @override
  _FlutterTeamState createState() => _FlutterTeamState();
}

class _FlutterTeamState extends State<FlutterTeam> {



  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final User? employee = auth.currentUser;

  DateTime currentTime = DateTime.now();

  // var currentUser = FirebaseAuth.instance;

  var groupName = "FLUTTER";

  final Stream<QuerySnapshot> user =
  FirebaseFirestore.instance.collection("flutterDep").snapshots();

  final Stream<QuerySnapshot> user1 =
  FirebaseFirestore.instance.collection("punching").snapshots();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: StreamBuilder<QuerySnapshot>(
                    stream: user,

                    builder: (
                        BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot,
                        ) {
                      if(snapshot.hasError){
                        return Text("Something wrong");
                      }
                      if(snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      }
                      final data = snapshot.requireData;

                      return ListView.builder(

                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          return Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Container(

                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.teal, width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child:
                                Row(
                                  children: [

                                    Container(

                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: Text("${data.docs[index]["name"]}",

                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal,
                                          ),
                                        ),

                                      ),
                                      width: MediaQuery.of(context).size.width * 0.6,
                                    ),

                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child:StreamBuilder<QuerySnapshot>(
                                          stream: user1,


                                          builder: (
                                              BuildContext context,
                                              AsyncSnapshot<QuerySnapshot> snapshot,
                                              ) {
                                            if(snapshot.hasError){
                                              return Text("Something wrong");
                                            }
                                            if(snapshot.connectionState == ConnectionState.waiting) {
                                              return Text("Loading");
                                            }
                                            final data = snapshot.requireData;

                                            return ListView.builder(

                                              itemCount: data.size,
                                              itemBuilder: (context, index) {
                                                return Text(  "${data.docs[index]["punch-time"]}",


                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.teal,
                                                  ),
                                                );

                                              },

                                            );
                                          }
                                      ),
                                    ),



                                  ],
                                ),

                                width: double.infinity,
                                height: 50,
                              ),


                              // Text( "Punch out Date: ${data.docs[index]["date"]}"),
                              // Text( "Punch out Time: ${data.docs[index]["time"]}"),
                            ],

                          );

                        },

                      );
                    }
                ),
              ),

            ],
          ),
        ),

      ),
    );
  }
}
