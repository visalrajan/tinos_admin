// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// class LeavePage extends StatelessWidget {
//
//   final Stream<QuerySnapshot> user =
//   FirebaseFirestore.instance.collection("leave").snapshots();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("LEAVE REQUEST"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               // color: Colors.red,
//               height: MediaQuery.of(context).size.height * 0.7 ,
//               padding: EdgeInsets.symmetric(vertical: 20),
//               child: StreamBuilder<QuerySnapshot>(
//                   stream: user,
//
//                   builder: (
//                       BuildContext context,
//                       AsyncSnapshot<QuerySnapshot> snapshot,
//                       ) {
//                     if(snapshot.hasError){
//                       return Text("Something wrong");
//                     }
//                     if(snapshot.connectionState == ConnectionState.waiting) {
//                       return Text("Loading");
//                     }
//                     final data = snapshot.requireData;
//
//                     return ListView.builder(
//
//                       itemCount: data.size,
//                       itemBuilder: (context, index) {
//                         return Column(
//
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: 20,
//                             ),
//                           SingleChildScrollView(
//
//                             child: Container(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
//                                       child: Container(
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Center(
//                                               child: Text( "${data.docs[index]["name"]}",style: TextStyle(
//
//                                          fontWeight: FontWeight.bold,
//                                               fontSize: 24,
//                                               color: Colors.black87),),
//                                             ),
//                                           ),
//
//                                         decoration: BoxDecoration(
//
//                                           borderRadius: BorderRadius.circular(15),
//                                           border: Border.all(color: Colors.black, width: 2),
//                                             color: Colors.white
//
//                                         ),
//
//                                         width: double.infinity,
//                                         height: 50,
//                                       ),
//                                     ),
//
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
//                                       child: Container(
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Center(
//                                             child: Text( "${data.docs[index]["departmentName"]}",style: TextStyle(
//
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 22,
//                                                 color: Colors.black87),),
//                                           ),
//                                         ),
//                                         decoration: BoxDecoration(
//
//                                             borderRadius: BorderRadius.circular(15),
//                                             border: Border.all(color: Colors.black, width: 2),
//                                             color: Colors.white
//
//                                         ),
//
//                                         width: double.infinity,
//                                         height: 50,
//                                       ),
//                                     ),
//
//
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
//                                       child: Row(
//                                         children: [
//                                           Container(
//                                             width: 130,
//                                             height: 50,
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(15),
//                                               color: Colors.white,
//                                               border: Border.all(color: Colors.black87, width: 2),
//                                             ),
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(8.0),
//                                               child: Text( "${data.docs[index]["date"]}",style: TextStyle(
//
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 22,
//                                                   color: Colors.black87),),
//                                             ),
//
//                                           ),
//
//                                           SizedBox(
//                                             width: 20,
//                                           ),
//
//                                           Container(
//                                             width: 130,
//                                             height: 50,
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(15),
//                                               color: Colors.white,
//                                               border: Border.all(color: Colors.black87, width: 2),
//                                             ),
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(8.0),
//                                               child: Center(
//                                                 child: Text( "${data.docs[index]["day-type"]}",style: TextStyle(
//
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 22,
//                                                     color: Colors.black87),),
//                                               ),
//                                             ),
//
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//
//
//
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
//                                       child: Container(
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Center(
//                                             child: Text( "${data.docs[index]["leave-type"]}",style: TextStyle(
//
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 22,
//                                                 color: Colors.black87),),
//                                           ),
//                                         ),
//                                         decoration: BoxDecoration(
//
//                                             borderRadius: BorderRadius.circular(15),
//                                             border: Border.all(color: Colors.black, width: 2),
//                                             color: Colors.white
//
//                                         ),
//
//                                         width: double.infinity,
//                                         height: 50,
//                                       ),
//                                     ),
//
//
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
//                                       child: Container(
//                                         child: SingleChildScrollView(
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Center(
//                                               child: Text( " Reason :  ${data.docs[index]["reason"]}",style: TextStyle(
//
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 18,
//                                                   color: Colors.black87),),
//                                             ),
//                                           ),
//                                         ),
//
//                                         decoration: BoxDecoration(
//
//                                             borderRadius: BorderRadius.circular(15),
//                                             border: Border.all(color: Colors.black, width: 2),
//                                             color: Colors.white
//
//                                         ),
//
//                                         width: double.infinity,
//                                         height: 100,
//                                       ),
//                                     ),
//
//
//
//
//
//                                   ],
//                                 ),
//
//
//                               width: double.infinity,
//                               height: 370,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.blueGrey,
//                                 border: Border.all(color: Colors.black, width: 3),
//                               ),
//                             ),
//                           ),
//
//
//
//
//                           ],
//
//                         );
//
//                       },
//
//                     );
//                   }
//               ),
//             )
//
//           ],
//         ),
//       ),
//
//     );
//   }
// }







//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class LeavePage extends StatefulWidget {
//   const LeavePage({Key? key}) : super(key: key);
//
//   @override
//   _LeavePageState createState() => _LeavePageState();
// }
//
// class _LeavePageState extends State<LeavePage> {
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
//                                       width: MediaQuery.of(context).size.width * 0.6,
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





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinos_admin/leave_flutter/leave_flutter.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({Key? key}) : super(key: key);

  @override
  _LeavePageState createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
  //---------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
              child: Container(
                width: double.infinity,
                child: RawMaterialButton(
                  fillColor: Colors.teal,
                  elevation: 0.0,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  onPressed: ()  {

                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LeaveFlutter()));

                  },
                  child: const Text(
                    "FLUTTER",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

//--------------------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
              child: Container(
                width: double.infinity,
                child: RawMaterialButton(
                  fillColor: Colors.teal,
                  elevation: 0.0,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  onPressed: ()  {

                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => LeaveFlutter()));

                  },
                  child: const Text(
                    "NODE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

//-------------------------------------------------------------------

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
              child: Container(
                width: double.infinity,
                child: RawMaterialButton(
                  fillColor: Colors.teal,
                  elevation: 0.0,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  onPressed: ()  {

                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => LeaveFlutter()));

                  },
                  child: const Text(
                    "PYTHON",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

//------------------------------------------------------------------------

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
              child: Container(
                width: double.infinity,
                child: RawMaterialButton(
                  fillColor: Colors.teal,
                  elevation: 0.0,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  onPressed: ()  {

                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => LeaveFlutter()));

                  },
                  child: const Text(
                    "REACT",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

          ],

        ),
      ),
    );
  }
}
