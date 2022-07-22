import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'days_card.dart';


DateTime logout = DateTime.now();

class Month extends StatefulWidget {
  const Month({Key? key}) : super(key: key);

  @override
  _MonthState createState() => _MonthState();
}

class _MonthState extends State<Month>
    with TickerProviderStateMixin {
  final List<MyTabs> _tabs = [
    MyTabs(
      title: "January",
    ),
    MyTabs(
      title: "February",
    ),
    MyTabs(
      title: "March",
    ),
    MyTabs(
      title: "April",
    ),
    MyTabs(
      title: "May",
    ),  MyTabs(
      title: "June",
    ),  MyTabs(
      title: "July",
    ),  MyTabs(
      title: "August",
    ),
    MyTabs(
      title: "September",
    ),  MyTabs(
      title: "October",
    ),  MyTabs(
      title: "November",
    ),  MyTabs(
      title: "December",
    ),


  ];
  late MyTabs _myHandler;
  late TabController _tabController;


  @override
  void initState() {
    _myHandler = _tabs[0];
    _tabController = TabController(length: 12, vsync: this);
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
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          elevation: 0.0,

          backgroundColor: Colors.transparent,
          bottom: TabBar(
            padding: const EdgeInsets.only( bottom: 10),
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            labelColor: const Color(0xff864468),
            unselectedLabelColor: Colors.grey,
            controller: _tabController,
            labelStyle: TextStyle(color:  Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
            unselectedLabelStyle: TextStyle(color:Colors.grey, fontWeight: FontWeight.bold, fontSize: 15),
            indicator: BoxDecoration(
              color: const Color(0xfffecb00),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            indicatorWeight: .09,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.only(top:40, left: 15, right: 30),
            tabs: [
              Tab(
                text: _tabs[0].title,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Tab(
                  text: _tabs[1].title,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Tab(
                  text: _tabs[2].title,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Tab(
                  text: _tabs[3].title,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Tab(
                  text: _tabs[4].title,
                ),
              ), Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Tab(
                  text: _tabs[5].title,
                ),
              ), Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Tab(
                  text: _tabs[6].title,
                ),
              ), Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Tab(
                  text: _tabs[7].title,
                ),
              ), Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Tab(
                  text: _tabs[8].title,
                ),
              ), Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Tab(
                  text: _tabs[9].title,
                ),
              ), Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Tab(
                  text: _tabs[10].title,
                ),
              ), Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Tab(
                  text: _tabs[11].title,
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
          children:  [
            Days(),
            Days(),
            Days(),
            Days(),
            Days(),
            Days(),
            Days(),
            Days(),
            Days(),
            Days(),
            Days(),
            Days(),
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
