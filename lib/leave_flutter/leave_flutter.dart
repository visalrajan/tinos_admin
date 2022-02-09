// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:tinos_admin/leave_details/leave_details.dart';
// import 'package:tinos_admin/leave_model/leave_model.dart';
//
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
//   // var groupName = "FLUTTER";
//
//   final Stream<QuerySnapshot> user =
//   FirebaseFirestore.instance.collection("flutterDep").snapshots();
//
//   final Stream<QuerySnapshot> user1 =
//   FirebaseFirestore.instance.collection("leave").snapshots();
//   List<LeaveDetails>? leaveData = [];
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
//                     stream: user1,
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
//                           final leaveDetails = snapshot.requireData;
//
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const SizedBox(
//                                 height: 15,
//                               ),
//                               Container(
//
//                                 child:
//                                 StreamBuilder<QuerySnapshot>(
//                                     stream: user,
//                                     builder: (
//                                         BuildContext
//                                         context,
//                                         AsyncSnapshot<QuerySnapshot>snapshot,
//                                         ) {
//                                       if (snapshot.hasError) {
//                                         return const Text("Something wrong");
//                                       }
//                                       // if (snapshot.connectionState == ConnectionState.waiting) {
//                                       //   return const Text("Loading");
//                                       // }
//                                       final data = snapshot.requireData;
//                                       var employeeId;
//
//                                       String? appliedLeaveUser ="";
//                                       String? leaveDate ="";
//                                       dynamic userName;
//                                       late LeaveDetails? selectedLeave;
//                                       //leave = data.docs.map((e) => LeaveDetails.fromJson(e.data()).toList).cast<LeaveDetails>();
//
//                                       data.docs.map((e) => {
//
//                                         if (leaveDetails.docs[index]["email"] == e['email'])
//                                           {
//                                             selectedLeave = LeaveDetails(name: leaveDetails.docs[index]['name'],
//                                                 email: leaveDetails.docs[index]['email'],
//                                                 date: leaveDetails.docs[index]['date'],
//                                                 day_type: leaveDetails.docs[index]['day-type'],
//                                                 leave_type: leaveDetails.docs[index]['leave-type'],
//                                                 reason: leaveDetails.docs[index]['reason']),
//                                             leaveData?.add(selectedLeave!),
//                                             appliedLeaveUser = selectedLeave?.name,
//                                             employeeId = e["email"],
//                                           }
//                                       })
//                                           .toList();
//                                       return appliedLeaveUser != "" ? GestureDetector(
//                                         child: Padding(
//                                           padding: const EdgeInsets.only(left: 30),
//                                           child: Row(
//
//                                             children: [
//                                               Text(appliedLeaveUser!,
//                                                 style: const TextStyle(
//                                                   color: Colors.green,
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 24,
//
//                                                 ),
//                                               ),
//                                               Spacer(),
//                                               // Text(leaveDate!)
//                                             ],
//                                           ),
//                                         ),
//                                         onTap: () {
//                                           Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LeaveDetailsPage(
//                                             emailId: employeeId,
//
//                                           )));
//                                         },
//                                       ) : Container();
//                                     }),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15),
//                                   border: Border.all(color: Colors.teal, width: 2),
//                                 ),
//                                 width: double.infinity,
//                                 height: 50,
//
//
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
//
// }
//
















import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tinos_admin/leave_details/leave_details.dart';

class LeaveFlutter extends StatefulWidget {


  @override
  _LeaveFlutterState createState() => _LeaveFlutterState();
}

class _LeaveFlutterState extends State<LeaveFlutter> {
  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final User? employee = auth.currentUser;

  DateTime currentTime = DateTime.now();

  // var currentUser = FirebaseAuth.instance;

  var groupName = "FLUTTER";

  final Stream<QuerySnapshot> user =
  FirebaseFirestore.instance.collection("flutterDep").snapshots();


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
                                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LeaveDetailsPage(
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
