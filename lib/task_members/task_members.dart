import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMembers extends StatefulWidget {
  String selectedDepartment = "";

  AddMembers({required this.selectedDepartment});

  @override
  _AddMembersState createState() => _AddMembersState();
}

class _AddMembersState extends State<AddMembers> {
  bool value = false;

  final Stream<QuerySnapshot> user =
      FirebaseFirestore.instance.collection("flutterDep").snapshots();
  late List<bool> _teamSelected = [];
  late List<Map<String, dynamic>> teamMembersList = [];

  // List selectedList = [];
  List<Map<String, String>> selectedList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.selectedDepartment == "FLUTTER"
        ? getFlutterTeam()
        : widget.selectedDepartment == "NODE"
            ? getNodeTeam()
            : widget.selectedDepartment == "REACT"
                ? getReactTeam()
                : getPythonTeam();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.8,
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: ListView.builder(
                    itemCount: teamMembersList.length,
                    itemBuilder: (context, index) {
                      //final userDetails = snapshot.requireData;
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 5, bottom: 5, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${teamMembersList[index]["name"]}",
                                      style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Checkbox(
                                      value: _teamSelected[index],
                                      onChanged: (value) {
                                        setState(() {
                                          //print("value = ${value}");
                                          _teamSelected[index] = value!;
                                          Map<String, String> lists = {};
                                          if (value == true) {
                                            // selectedList.add(teamMembersList[index]["name"]);
                                            lists["name"] =
                                                teamMembersList[index]["name"];
                                            lists["email"] =
                                                teamMembersList[index]["email"];
                                            selectedList.add(lists);
                                          } else {
                                            for (var item in selectedList) {
                                              if (item["name"] ==
                                                  (teamMembersList[index]
                                                      ["name"])!) {
                                                selectedList.remove(item);
                                                break;
                                              }
                                            }
                                            // print(selectedList.indexOf(teamMembersList[index]["name"]));
                                            // int itemIndex = selectedList.indexOf(teamMembersList[index]["name"]);
                                            // selectedList.removeAt(itemIndex);

                                          }

                                          print(selectedList);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: Colors.teal, width: 2),
                              ),
                            ),
                          ],
                        ),
                      );
                    })),
            Padding(
              padding: const EdgeInsets.only(left: 28, right: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 45,
                    width: 130,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, selectedList);
                      },
                      child: const Text("OK"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    width: 130,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("CANCEL"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getFlutterTeam() async {
    var collection = FirebaseFirestore.instance.collection('flutterDep');
    var querySnapshot = await collection.get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data();
      setState(() {
        teamMembersList.add(data);
      });
    }
    _teamSelected =
        List<bool>.filled(teamMembersList.length, false, growable: true);
  }

  Future getReactTeam() async {
    var collection = FirebaseFirestore.instance.collection('reactDep');
    var querySnapshot = await collection.get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data();
      setState(() {
        teamMembersList.add(data);
      });
    }
    _teamSelected =
        List<bool>.filled(teamMembersList.length, false, growable: true);
  }

  Future getNodeTeam() async {
    var collection = FirebaseFirestore.instance.collection('nodeDep');
    var querySnapshot = await collection.get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data();
      setState(() {
        teamMembersList.add(data);
      });
    }
    _teamSelected =
        List<bool>.filled(teamMembersList.length, false, growable: true);
  }

  Future getPythonTeam() async {
    var collection = FirebaseFirestore.instance.collection('pythonDep');
    var querySnapshot = await collection.get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data();
      setState(() {
        teamMembersList.add(data);
      });
    }
    _teamSelected =
        List<bool>.filled(teamMembersList.length, false, growable: true);
  }
}
