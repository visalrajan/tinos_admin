import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tinos_admin/leave_page/leave_page.dart';
import 'package:tinos_admin/register/register.dart';
import 'package:tinos_admin/task/task.dart';



class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int currentIndex = 0;
  final _pages = [TaskPage(), Register(), LeavePage()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[currentIndex],
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: currentIndex,
          duration: const Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.task_alt_rounded,
              ),
              title: const Text('Task'),
              selectedColor: Colors.black,
              unselectedColor: Colors.grey,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.receipt_long_rounded),
              title: const Text('Register'),
              selectedColor: Colors.black,
              unselectedColor: Colors.grey,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.work_off_outlined),
              title: const Text('Leave'),
              selectedColor: Colors.black,
              unselectedColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
