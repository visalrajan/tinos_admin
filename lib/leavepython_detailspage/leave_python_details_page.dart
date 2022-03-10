import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LeavePythonDetailsPage extends StatefulWidget {

  late String emailId = " ";
  LeavePythonDetailsPage({required this.emailId});


  @override
  _LeavePythonDetailsPageState createState() => _LeavePythonDetailsPageState();
}

class _LeavePythonDetailsPageState extends State<LeavePythonDetailsPage> {

  final Stream<QuerySnapshot> user =
  FirebaseFirestore.instance.collection("leave").snapshots();

  @override
  Widget build(BuildContext context) {
    print(widget.emailId);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("REGISTER"),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10,top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(

                  height: MediaQuery.of(context).size.height * 0.95,
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
                            return data.docs[index]["email"] == widget.emailId ? Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                              child: Container(
                                child: Column(

                                  children: [
//------------------------------------------------------------------------------------------------------

                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        child: Center(
                                          child: Text("Date:   ${data.docs[index]["date"]}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        width: double.infinity,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(color: Colors.white, width: 2),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
//---------------------------------------------------------------------------------------------------------
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        child: Center(
                                          child: Text("Type Of Day:   ${data.docs[index]["day-type"]}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        width: double.infinity,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(color: Colors.white, width: 2),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
//----------------------------------------------------------------------------------------------------
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        child: Center(
                                          child: Text("Type Of Leave:   ${data.docs[index]["leave-type"]}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        width: double.infinity,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(color: Colors.white, width: 2),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
//----------------------------------------------------------------------------------------

                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        child: SingleChildScrollView(
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text("Reason:   ${data.docs[index]["reason"]}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),

                                        width: double.infinity,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(color: Colors.white, width: 2),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
//----------------------------------------------------------------------------------------------------------
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.white, width: 2),
                                ),
                                width: double.infinity,
                                height: 400,

                              ),
                            ) : Container();


                          },

                        );
                      }

                  ),
                ),

              ),


            ],
          ),
        ),
      ),

    );
  }
}
