import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traxsmart_swm_staff_app/data/dummy.dart';
import 'package:traxsmart_swm_staff_app/data/img.dart';
import 'package:traxsmart_swm_staff_app/data/my_colors.dart';
import 'package:traxsmart_swm_staff_app/model/base/bottom_nav.dart';
import 'package:traxsmart_swm_staff_app/model/base/icon_details.dart';
import 'package:traxsmart_swm_staff_app/routes/attendance.dart';
import 'package:traxsmart_swm_staff_app/routes/home.dart';
import 'package:traxsmart_swm_staff_app/routes/more.dart';
import 'package:traxsmart_swm_staff_app/routes/profile.dart';
import 'package:traxsmart_swm_staff_app/utils/my_text.dart';

class DashboardRoute extends StatefulWidget {

  DashboardRoute({Key? key}) : super(key: key);

  final List<BottomNav> itemsNav = <BottomNav>[
    BottomNav('Dashboard', Icons.dashboard_rounded, null),
    BottomNav('Attendance', Icons.calendar_today_rounded, null),
    BottomNav('Profile', Icons.account_box_rounded, null),
    BottomNav('More', Icons.more_horiz_rounded , null)
  ];

  @override
  DashboardRouteState createState() => DashboardRouteState();
}

class DashboardRouteState extends State<DashboardRoute> with SingleTickerProviderStateMixin {

  int currentIndex = 0;
  late BuildContext ctx;

  void onBackPress(){
    if(Navigator.of(ctx).canPop()){
      Navigator.of(ctx).pop();
    }
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return HomeRoute();
      case 1:
       return AttendanceRoute();
      case 2:
        return ProfileRoute();
      case 3:
        return MoreRoute();
      default:
        return HomeRoute();
    }
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green[400],
        unselectedItemColor: Colors.grey[400],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: widget.itemsNav.map((BottomNav d){
          return BottomNavigationBarItem(
            icon: Icon(d.icon),
            label: d.title,
          );
        }).toList(),
      ),
      body: _getDrawerItemWidget(currentIndex),
    );
  }
}