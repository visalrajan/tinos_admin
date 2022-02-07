//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class EmployeeLeavePage extends StatefulWidget {
//   const EmployeeLeavePage({Key? key}) : super(key: key);
//
//   @override
//   _EmployeeLeavePageState createState() => _EmployeeLeavePageState();
// }
//
// class _EmployeeLeavePageState extends State<EmployeeLeavePage> {
//   // final FirebaseAuth auth = FirebaseAuth.instance;
//   // final User? employee = auth.currentUser;
//
//   DateTime currentTime = DateTime.now();
//
//   // var currentUser = FirebaseAuth.instance;
//
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
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
//
//   FirebaseAuth auth = FirebaseAuth.instance;
//   late User? employee = auth.currentUser;
//   late var uid =employee?.uid;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//                                 decoration: BoxDecoration(
//                                   border:
//                                   Border.all(color: Colors.teal, width: 2),
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       child: Padding(
//                                         padding: const EdgeInsets.fromLTRB(
//                                             10, 10, 10, 10),
//                                         child: Text(
//                                           "${data.docs[index]["name"]}",
//                                           style: const TextStyle(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.teal,
//                                           ),
//                                         ),
//                                       ),
//                                       width: MediaQuery.of(context).size.width * 0.7,
//                                     ),
// //--------------------------------------------------
//
//                                   ],
//                                 ),
//                                 width: double.infinity,
//                                 height: 50,
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