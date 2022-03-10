import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tinos_admin/leave_nodedetails_page/leave_node_detailspage.dart';

class LeaveNode extends StatefulWidget {


  @override
  _LeaveNodeState createState() => _LeaveNodeState();
}

class _LeaveNodeState extends State<LeaveNode> {
  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final User? employee = auth.currentUser;

  DateTime currentTime = DateTime.now();

  // var currentUser = FirebaseAuth.instance;

  var groupName = "FLUTTER";

  final Stream<QuerySnapshot> user =
  FirebaseFirestore.instance.collection("nodeDep").snapshots();


  final DateTime? date = DateTime.now();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: StreamBuilder<QuerySnapshot>(
                    stream: user,
                    builder: (
                        BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot,
                        ) {
                      if (snapshot.hasError) {
                        return const Text("Something wrong");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("Loading");
                      }
                      final employeeData = snapshot.requireData;


                      return ListView.builder(
                        itemCount: employeeData.size,
                        itemBuilder: (context, index) {
                          final userDetails = snapshot.requireData;
                          var userEmail = userDetails.docs[index]["email"];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.teal, width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 10, 10),
                                        child: GestureDetector(
                                          child: Text(
                                            "${employeeData.docs[index]["name"]}",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.teal,
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LeaveNodeDetailsPage(
                                              emailId: userEmail,

                                            )));
                                          },
                                        ),
                                      ),
                                      width: MediaQuery.of(context).size.width * 0.75,
                                    ),
//--------------------------------------------------

                                  ],
                                ),
                                width: double.infinity,
                                height: 50,
                              ),
                            ],
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
