import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';
import 'add_note.dart';
import 'notes_view.dart';
import 'user_profile.dart';

class NoteDashboard extends StatefulWidget {
  const NoteDashboard({Key? key}) : super(key: key);

  @override
  _ExpensesHomeState createState() => _ExpensesHomeState();
}

class _ExpensesHomeState extends State<NoteDashboard> {
  int _selectedIndex = 0;
  List<Widget> myBody = [
    const AddNote(isEdit: false,),
    const NotesView(),
    const UserProfile(),
    //Other(),
  ];
  BottomNavigationBarItem bottomNavigationBarItem(
      IconData iconData, String label) =>
      BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Icon(
            iconData,
          ),
        ),
        label: label,
      );

  @override
  void initState() {
    super.initState();
    //DB.init();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {

    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428.0, 926.0));
    List<BottomNavigationBarItem> bottomItems = <BottomNavigationBarItem>[
      bottomNavigationBarItem(Icons.add, 'Add Notes'),
      bottomNavigationBarItem(Icons.analytics_outlined, 'My Notes'),
      bottomNavigationBarItem(Icons.person, 'Profile'),
      // bottomNavigationBarItem(Icons.account_circle, 'Other'),
    ];

    return Scaffold(
      // appBar: AppBar(
      //     backgroundColor: Colors.black,
      //     title:
      //     //Text("Events")
      //     _selectedIndex == 0
      //         ? Text("Add Expense")
      //         :
      //     _selectedIndex == 1
      //         ? Text("Analysis")
      //         :
      //     _selectedIndex == 2
      //         ? Text("Calendar")
      //         :
      //     Text("Other")),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: grey,
              ),
            ],
          ),
          child: BottomNavigationBar(
            iconSize: 27.sp,
            selectedFontSize: 16.sp,
            unselectedFontSize: 14.sp,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            items: bottomItems,
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
        body: myBody[_selectedIndex]);
  }
}