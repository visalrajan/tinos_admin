import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinos_admin/task_members/task_members.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (newDateRange == null) return; // pressed 'X'
    setState(() {
      dateRange = newDateRange;
      final start = dateRange.start;
      final end = dateRange.end;
      buttonText =
          "${start.day}/${start.month}/${start.year}"; // press save button
      buttonText1 = "${end.day}/${end.month}/${end.year}";
    });
  }

  var buttonText = "Start Date";
  var buttonText1 = "End Date";

  // List addedMembers = [];
  List<Map<String, String>> addedMembers = [];

  final nameEditingController = TextEditingController();
  final departmentNameEditingController = TextEditingController();

  final item1 = ["FLUTTER", "NODE", "REACT", "PYTHON"];
  final item2 = ["Medical", "Casual"];
  String? valueChoose1;
  String? valueChoose2;

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Task"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              border: Border.all(color: Colors.blueGrey, width: 3),
            ),
            width: double.infinity,
            // height: MediaQuery.of(context).size.height *0.7,

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 22, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      autofocus: false,
                      controller: nameEditingController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regex = new RegExp(r'^.{3,}$');
                        if (value!.isEmpty) {
                          return ("Name cannot be Empty");
                        }

                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Name(Min. 3 character)");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        nameEditingController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Task Name",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      underline: const SizedBox(),
                      iconSize: 36,
                      hint: const Text("Select Department"),
                      value: valueChoose1,
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose1 = newValue as String?;
                        });
                      },
                      items: item1.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (valueChoose1 != null) {
                        List<Map<String, String>> result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => AddMembers(
                                    selectedDepartment: valueChoose1!)));
                        addedMembers = result;
                        print("result= ${addedMembers}");
                      } else {
                        const Text(
                          "Please Choose Any Dipartment",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Add Members",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Duration",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 130,
                        height: 45,
                        child: ElevatedButton(
                          child: Text(buttonText),
                          onPressed: () {
                            pickDateRange();
                            //buttonText = "${start.day}/${start.month}/${start.year}";
                            setState(() {
                              buttonText =
                                  "${start.day}/${start.month}/${start.year}";
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.teal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        width: 130,
                        child: ElevatedButton(
                          child: Text(buttonText1),
                          onPressed: () {
                            pickDateRange();
                            buttonText1 = "${end.day}/${end.month}/${end.year}";
                            // setState(() {
                            //   buttonText1 = "${end.day}/${end.month}/${end.year}";
                            // });
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.teal),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const Center(
                              child: Text("Task Added Successfully"),
                            );
                          });

                      FirebaseFirestore.instance
                          .collection("task")
                          .doc(DateTime.now().millisecondsSinceEpoch.toString())
                          .set({
                        "task-name": "${nameEditingController.text.toString()}",
                        "department": valueChoose1,
                        "members": addedMembers,
                        "start-date": buttonText,
                        "end-date": buttonText1,
                      });
                    },
                    child: const Text(
                      "Add Task",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 15, bottom: 15),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                          itemCount: addedMembers.length,
                          itemBuilder: (context, index) {
                            return Text(
                              addedMembers[index]["name"]!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
