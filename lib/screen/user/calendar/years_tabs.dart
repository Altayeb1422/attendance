import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'month_tabs.dart';


DateTime logout = DateTime.now();

class Years extends StatefulWidget {
  const Years({Key? key}) : super(key: key);

  @override
  _YearsState createState() => _YearsState();
}

class _YearsState extends State<Years>
    with TickerProviderStateMixin {
  final List<MyTabs> _tabs = [
    MyTabs(
      title: "2022",
    ),
    MyTabs(
      title: "2023",
    ),
    MyTabs(
      title: "2024",
    ),
    MyTabs(
      title: "2025",
    ),
    MyTabs(
      title: "2025",
    ),  MyTabs(
      title: "2026",
    ),  MyTabs(
      title: "2027",
    ),  MyTabs(
      title: "2028",
    ),
  ];
  late MyTabs _myHandler;
  late TabController _tabController;


  @override
  void initState() {
    _myHandler = _tabs[0];
    _tabController = TabController(length: 8, vsync: this);
    _tabController.addListener(_handleSelected);
    super.initState();
  }

  void _handleSelected() {
    setState(() {
      _myHandler = _tabs[_tabController.index];
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
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(

          elevation: 0.0,
          backgroundColor: Colors.transparent,
          bottom: TabBar(
            // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            labelColor: const Color(0xff864468),
            unselectedLabelColor: Colors.grey,
            controller: _tabController,
            labelStyle: const TextStyle(color:  Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
            unselectedLabelStyle: const TextStyle(color:Colors.grey, fontWeight: FontWeight.bold, fontSize: 15),
            indicator:const BoxDecoration(
              color: Color(0xfffecb00),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            indicatorWeight: .09,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: const EdgeInsets.only(top:40,left: 15, right: 15),
            tabs: [
              Tab(
                text: _tabs[0].title,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Tab(
                  text: _tabs[1].title,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Tab(
                  text: _tabs[2].title,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Tab(
                  text: _tabs[3].title,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Tab(
                  text: _tabs[4].title,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Tab(
                  text: _tabs[5].title,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Tab(
                  text: _tabs[6].title,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Tab(
                  text: _tabs[7].title,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: TabBarView(
          controller: _tabController,
          children:  const[
            Month(),
            Month(),
            Month(),
            Month(),
            Month(),
            Month(),
            Month(),
            Month(),
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
