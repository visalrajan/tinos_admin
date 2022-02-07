import 'package:flutter/material.dart';
import 'package:tinos_admin/leave_model/leave_model.dart';


class LeaveDetailsPage extends StatefulWidget {
  late LeaveDetails leave;
  LeaveDetailsPage({required this.leave});

  @override
  _LeaveDetailsPageState createState() => _LeaveDetailsPageState();
}

class _LeaveDetailsPageState extends State<LeaveDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,
      child: Text(widget.leave.name),);
  }
}