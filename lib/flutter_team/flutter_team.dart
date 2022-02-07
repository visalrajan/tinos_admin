import 'package:cloud_firestore/cloud_firestore.dart';
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
  final DateTime? date = DateTime.now();

  final Stream<QuerySnapshot> user2 =
      FirebaseFirestore.instance.collection("leaving").snapshots();

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
                                        child: Text(
                                          "${data.docs[index]["name"]}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal,
                                          ),
                                        ),
                                      ),
                                      width: MediaQuery.of(context).size.width * 0.6,
                                    ),
//--------------------------------------------------
                                    Container(

                                      width: MediaQuery.of(context).size.width * 0.27,

                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 30),
                                        child: StreamBuilder<QuerySnapshot>(
                                            stream: user2,
                                            builder: (
                                              BuildContext context,
                                              AsyncSnapshot<QuerySnapshot>snapshot,
                                            ) {
                                              if (snapshot.hasError) {
                                                return const Text("Something wrong");
                                              }
                                              if (snapshot.connectionState == ConnectionState.waiting) {
                                                return const Text("Loading");
                                              }
                                              final data = snapshot.requireData;
                                              var isPunchOut = false;
                                              dynamic punchOutDate;
                                              data.docs.map((e) => {
                                                        if (userDetails.docs[index]["email"] == e["email"])
                                                          {
                                                            punchOutDate = e["punchOut-date"],
                                                            if (punchOutDate ==
                                                                "${date!.day.toString()}:${date!.month.toString()}:${date!.year.toString()}")
                                                              {isPunchOut = true}
                                                            else
                                                              {isPunchOut = false}
                                                          }
                                                      })
                                                  .toList();

                                              return isPunchOut
                                                  ? const Text("OUT",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),)
                                                  : Container(
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
                                                                var punchTime ="OFF";
                                                                dynamic punchDate;
                                                                data.docs.map((e) => {
                                                                          if (userDetails.docs[index]["email"] == e["email"])
                                                                            {
                                                                              punchDate = e["punch-date"],
                                                                              if (punchDate ==
                                                                                  "${date!.day.toString()}:${date!.month.toString()}:${date!.year.toString()}")
                                                                                {
                                                                                  punchTime = "IN",
                                                                                }
                                                                              else
                                                                                {
                                                                                  punchTime = "OFF",
                                                                                }
                                                                            }
                                                                        })
                                                                    .toList();
                                                                return Text(punchTime,
                                                                  style: const TextStyle(
                                                                  color: Colors.green,
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 18,

                                                                ),
                                                                );
                                                              }),

                                                    );
                                            }),
                                      ),

                                    ),
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
