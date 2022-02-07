// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:tinos_admin/employee_leave/employee_leave.dart';
//
// class LeaveFlutter extends StatefulWidget {
//   const LeaveFlutter({Key? key}) : super(key: key);
//
//   @override
//   _LeaveFlutterState createState() => _LeaveFlutterState();
// }
//
// class _LeaveFlutterState extends State<LeaveFlutter> {
//   // final FirebaseAuth auth = FirebaseAuth.instance;
//   // final User? employee = auth.currentUser;
//
//   DateTime currentTime = DateTime.now();
//
//   // var currentUser = FirebaseAuth.instance;
//
//   var groupName = "FLUTTER";
//
//   final Stream<QuerySnapshot> user =
//   FirebaseFirestore.instance.collection("flutterDep").snapshots();
//
//   final Stream<QuerySnapshot> user1 =
//   FirebaseFirestore.instance.collection("punching").snapshots();
//   final DateTime? date = DateTime.now();
//
//   final Stream<QuerySnapshot> user2 =
//   FirebaseFirestore.instance.collection("leaving").snapshots();
//
//   FirebaseAuth auth = FirebaseAuth.instance;
//   late User? employee = auth.currentUser;
//   late var uid =employee?.uid;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Users"),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height,
//                 padding: const EdgeInsets.symmetric(vertical: 20),
//                 child: StreamBuilder<QuerySnapshot>(
//                     stream: user,
//                     builder: (
//                         BuildContext context,
//                         AsyncSnapshot<QuerySnapshot> snapshot,
//                         ) {
//                       if (snapshot.hasError) {
//                         return const Text("Something wrong");
//                       }
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const Text("Loading");
//                       }
//                       final data = snapshot.requireData;
//
//                       return ListView.builder(
//                         itemCount: data.size,
//                         itemBuilder: (context, index) {
//                           final userDetails = snapshot.requireData;
//
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const SizedBox(
//                                 height: 15,
//                               ),
//                               Container(
//                                 child: RawMaterialButton(
//                                   // fillColor: Colors.teal,
//                                   elevation: 0.0,
//                                   padding: EdgeInsets.symmetric(vertical: 12.0),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(12.0),
//                                   ),
//                                   onPressed: ()  {
//
//                                     Navigator.of(context).pop();
//                                     Navigator.of(context).pushReplacement(MaterialPageRoute(
//                                         builder: (context) => EmployeeLeavePage()));
//
//                                   },
//                                   child:  Text(
//                                     "${data.docs[index]["name"]}",
//                                     style: TextStyle(
//                                       color: Colors.teal,
//                                       fontSize: 24.0,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15),
//                                   border: Border.all(color: Colors.teal),
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// //------------------------------------------------------------------------------------
//
//
//
//


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LeaveFlutter extends StatefulWidget {
  const LeaveFlutter({Key? key}) : super(key: key);

  @override
  _LeaveFlutterState createState() => _LeaveFlutterState();
}

class _LeaveFlutterState extends State<LeaveFlutter> {
  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final User? employee = auth.currentUser;

  DateTime currentTime = DateTime.now();

  // var currentUser = FirebaseAuth.instance;

  // var groupName = "FLUTTER";

  final Stream<QuerySnapshot> user =
  FirebaseFirestore.instance.collection("flutterDep").snapshots();

  final Stream<QuerySnapshot> user1 =
  FirebaseFirestore.instance.collection("leave").snapshots();
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
                      final data = snapshot.requireData;

                      return ListView.builder(
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          final userDetails = snapshot.requireData;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                width:
                                MediaQuery.of(context).size.width * 0.4,
                                child:
                                StreamBuilder<QuerySnapshot>(
                                    stream: user1,
                                    builder: (
                                        BuildContext
                                        context,
                                        AsyncSnapshot<QuerySnapshot>snapshot,
                                        ) {
                                      if (snapshot.hasError) {
                                        return const Text("Something wrong");
                                      }
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return const Text("Loading");
                                      }
                                      final data = snapshot.requireData;
                                      var appliedLeaveUser ="No Leave Request Found";

                                      dynamic userName;
                                      data.docs.map((e) => {
                                        if (userDetails.docs[index]["email"] == e["email"])
                                          {
                                            userName = e["name"],

                                            if (userName ==
                                                "${data.docs[index]["name"]}")
                                              {
                                                appliedLeaveUser = "name",
                                              }else{
                                                appliedLeaveUser ="No Leave Request Found",
                                            }

                                          }
                                      })
                                          .toList();
                                      return Text(appliedLeaveUser,
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,

                                        ),
                                      );
                                    }),


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
