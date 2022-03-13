import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinos_admin/flutter_team/flutter_team.dart';
import 'package:tinos_admin/node_team/node_team.dart';
import 'package:tinos_admin/python_team/python_team.dart';
import 'package:tinos_admin/react_team/react_team.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        bottom: TabBar(
          isScrollable: true,
          indicatorColor: Colors.white,
          controller: _controller,
          tabs: [
            Tab(
              child: Container(
                child: const Text(
                  "FLUTTER",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(
                child: const Text(
                  "NODE",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(
                child: const Text(
                  "PYTHON",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(
                child: const Text(
                  "REACT",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const <Widget>[
          FlutterTeam(),
          NodeTeam(),
          PythonTeam(),
          ReactTeam(),
        ],
      ),
    );
  }
}
