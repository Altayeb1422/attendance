


import 'package:attendance/screen/user/calendar/years_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'attendance/user_check_in_screen.dart';
import 'notifications.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return SafeArea(
      child: Row(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: const [
                          BoxShadow(blurRadius: 7.0, color: Color(0xffa7a9af))
                        ]),
                    child: const CircleAvatar(
                      maxRadius: 28,
                      minRadius: 28,
                      foregroundColor: Colors.green,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.fingerprint_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: const [
                          BoxShadow(blurRadius: 7.0, color: Color(0xffa7a9af))
                        ]),
                    child: const CircleAvatar(
                      maxRadius: 28,
                      minRadius: 28,
                      foregroundColor: Colors.green,
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.notifications_none_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: const [
                          BoxShadow(blurRadius: 7.0, color: Color(0xffa7a9af))
                        ]),
                    child: const CircleAvatar(
                      maxRadius: 28,
                      minRadius: 28,
                      foregroundColor: Colors.green,
                      backgroundColor: Colors.deepOrangeAccent,
                      child: Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: Container(
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  UserCheckIn(),
                  Years(),
                  Notifications(),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
