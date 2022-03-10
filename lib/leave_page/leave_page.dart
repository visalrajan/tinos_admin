
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinos_admin/leave_flutter/leave_flutter.dart';
import 'package:tinos_admin/leave_node/leave_node.dart';
import 'package:tinos_admin/leave_python/leave_python.dart';
import 'package:tinos_admin/leave_react/leave_react.dart';

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
                        builder: (context) => LeaveNode()));

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
                        builder: (context) => LeavePython()));

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
                        builder: (context) => LeaveReact()));

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




