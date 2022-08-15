import 'package:attendance/screen/attendance/user_check_in_screen.dart';
import 'package:attendance/screen/user/calendar/years_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../login/login_screen.dart';
import '../notifications.dart';



DateTime logout = DateTime.now();

class MainTabs extends StatefulWidget {
   MainTabs({Key? key,this.imeiNo,
    this.empID,
    this.attendID,
    this.dateOn,
    this.attenID,
    this.attenIn,
    this.attenOut,
    this.status,
    this.location,
    this.clockIn,
    this.clockOut,
    this.totalHrs}) : super(key: key);

  String? imeiNo;
  String? empID;
  String? attenID;
  String? location;
  String? clockIn;
  String? clockOut;
  String? totalHrs;
  String? status;
  String? attenIn;
  String? attenOut;
  String? dateOn;
  String? attendID;
  @override
  _MainTabsState createState() => _MainTabsState();
}

class _MainTabsState extends State<MainTabs>
    with TickerProviderStateMixin {
  // final List _tabs = [
  //   Tab(
  //     child: Container(
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(20),
  //           boxShadow: const [
  //             BoxShadow(blurRadius: 7.0, color: Color(0xffa7a9af))
  //           ]),
  //       child: const CircleAvatar(
  //         maxRadius: 30,
  //         minRadius: 30,
  //         foregroundColor: Colors.green,
  //         backgroundColor: Colors.blue,
  //         child: Icon(
  //           Icons.fingerprint_rounded,
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //   ),
  //   Tab(
  //     child: Container(
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(30),
  //           boxShadow: const [
  //             BoxShadow(blurRadius: 7.0, color: Color(0xffa7a9af))
  //           ]),
  //       child: const CircleAvatar(
  //         maxRadius: 30,
  //         minRadius: 30,
  //         foregroundColor: Colors.green,
  //         backgroundColor: Colors.green,
  //         child: Icon(
  //           Icons.notifications_none_outlined,
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //   ),
  //   Tab(
  //     child: Container(
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(30),
  //           boxShadow: const [
  //             BoxShadow(blurRadius: 12.0, color: Color(0xffa7a9af))
  //           ]),
  //       child: const CircleAvatar(
  //         maxRadius: 30,
  //         minRadius: 30,
  //         foregroundColor: Colors.green,
  //         backgroundColor: Colors.deepOrangeAccent,
  //         child: Icon(
  //           Icons.calendar_month_outlined,
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //   )
  // ];
  late TabController _tabController;


  @override
  void initState() {

    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_handleSelected);
    super.initState();
  }

  void _handleSelected() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    // context.locale;
    bool isRtl = Directionality.of(context).index == 0;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: true,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
        overlays: [SystemUiOverlay.top]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: AppBar(
         elevation: 0.0,
          backgroundColor: Colors.transparent,
          bottom: TabBar(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            // labelColor: const Color(0xff864468),
            // unselectedLabelColor: Colors.grey,
            controller: _tabController,
            // labelStyle: const TextStyle(color:  Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
            // unselectedLabelStyle: const TextStyle(color:Colors.grey, fontWeight: FontWeight.bold, fontSize: 15),
            indicator:const BoxDecoration(
              color: Color(0xfffecb00),
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            //
            indicatorWeight: 5,
            // indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: const EdgeInsets.only(top:40,left: 25, right: 25),
            tabs: [
              Tab(
                child: Container(
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(90),
                  //     boxShadow: const [
                  //       BoxShadow(blurRadius: 12.0, color: Color(0xffa7a9af))
                  //     ]),
                  child: const CircleAvatar(
                    maxRadius: 28,
                    minRadius: 28,
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.fingerprint_rounded,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(90),
                  //     boxShadow: const [
                  //       BoxShadow(blurRadius: 12.0, color: Color(0xffa7a9af))
                  //     ]),
                  child: const CircleAvatar(
                    maxRadius: 28,
                    minRadius: 28,
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(90),
                  //     boxShadow: const [
                  //       BoxShadow(blurRadius: 12.0, color: Color(0xffa7a9af))
                  //     ]),
                  child: const CircleAvatar(
                    maxRadius: 28,
                    minRadius: 28,
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.deepOrangeAccent,
                    child: Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(90),
                  //     boxShadow: const [
                  //       BoxShadow(blurRadius: 12.0, color: Color(0xffa7a9af))
                  //     ]),
                  child: const CircleAvatar(
                    maxRadius: 28,
                    minRadius: 28,
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.call_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(90),
                  //     boxShadow: const [
                  //       BoxShadow(blurRadius: 12.0, color: Color(0xffa7a9af))
                  //     ]),
                  child: const CircleAvatar(
                    maxRadius: 28,
                    minRadius: 28,
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.teal,
                    child: Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: TabBarView(
          controller: _tabController,
          children:  [
            UserCheckIn(imeiNo: widget.imeiNo,
              empID: empID,
              totalHrs: widget.totalHrs,
              clockOut: widget.clockOut,
              clockIn: widget.clockIn,
              location: widget.location,
              dateOn: widget.dateOn,
              status: widget.status,),

            Notifications(),
            Years(),
            Notifications(),
            Years(),
          ],
        ),
      ),
    );
  }
}

class CircleIndicator extends Decoration {
  final color;
  double radius;

  CircleIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  late Color color;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}

class MyTabs {
  final String title;
  MyTabs({required this.title});
}
