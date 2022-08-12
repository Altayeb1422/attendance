import 'package:attendance/screen/login/login_screen.dart';
import 'package:attendance/screen/login/register/register_user_screen.dart';
import 'package:attendance/screen/user/calendar/years_tabs.dart';
import 'package:attendance/screen/attendance/user_check_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';


class BottomHomeScreen extends StatefulWidget {
  const BottomHomeScreen({Key? key}) : super(key: key);

  @override
  BottomHomeScreenState createState() => BottomHomeScreenState();
}

class BottomHomeScreenState extends State<BottomHomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _screen = [
    const RegisterUser(),
     UserCheckIn(),
    const Years(),
    const LoginScreen(),
  ];
  final iconList = <IconData>[
    Icons.app_registration,
    Icons.pin_drop,
    Icons.settings,
    Icons.person,
  ];
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTapped(int selectedIndex ) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: _screen,
      ),//destination screen
      bottomNavigationBar: AnimatedBottomNavigationBar(
        gapLocation: GapLocation.none,
        backgroundColor: const Color(0xfff2f2f2),
        height: MediaQuery.of(context).size.height*0.07,
        iconSize: 30,
        activeColor: Colors.deepOrange,
        splashColor: Colors.deepOrange,
        icons: iconList,
        activeIndex: _selectedIndex,
        notchSmoothness: NotchSmoothness.sharpEdge,

        // leftCornerRadius: 32,
        // rightCornerRadius: 32,
        onTap: (index) => setState(() => _onTapped(index)),
        //other params
      ),
    );
  }
}
