import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PythonTeam extends StatefulWidget {
  const PythonTeam({Key? key}) : super(key: key);

  @override
  _PythonTeamState createState() => _PythonTeamState();
}

class _PythonTeamState extends State<PythonTeam> {

  var groupName = "PYTHON";

  final Stream<QuerySnapshot> user =
  FirebaseFirestore.instance.collection("pythonDep").snapshots();

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
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: Text("${data.docs[index]["name"]}",

                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal,
                                        ),
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
