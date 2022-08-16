import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  UserState createState() => UserState();
}

class UserState extends State<User> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .23,
                    width: MediaQuery.of(context).size.width * .43,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(blurRadius: 7.0, color: Color(0xffa7a9af))
                      ],
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/user.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),

                    // "assets/user.svg",
                    // height:size.height * .20,
                    // width: size.width * .20,
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 4.0, color: Color(0xffa7a9af))
                            ]),
                        child: const CircleAvatar(
                          maxRadius: 20,
                          minRadius: 20,
                          foregroundColor: Colors.green,
                          backgroundColor: Colors.red,
                          child: Icon(
                            Icons.security_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Security Guard",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,fontFamily: 'Tajawal',),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Altayeb",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,fontFamily: 'Tajawal',),
                      ),
                      const Text(
                        "Yousif",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,fontFamily: 'Tajawal',),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Edit profile",
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,fontFamily: 'Tajawal',),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25, bottom: 8),
              child: Text(
                "Requests",
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.6),
                  fontSize: 20,
                  fontWeight: FontWeight.bold, fontFamily: 'Tajawal',),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  InkWell(
                    onTap:(){},
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(150),
                      ),
                      color: const Color(0xff746d83),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Tab(
                            child: SizedBox(
                              width: 50,
                              height: 70,
                              child:  CircleAvatar(
                                maxRadius: 25,
                                minRadius: 25,
                                foregroundColor: Colors.green,
                                backgroundColor: Color(0xff746d83),
                                child: Icon(
                                  Icons.directions_walk,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.0, top: 8),
                            child: Text(
                              "Leave  ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold, fontFamily: 'Tajawal',),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(150),
                      ),
                      color: const Color(0xff90a97d),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Tab(
                            child: SizedBox(
                              width: 50,
                              height: 70,
                              child:  CircleAvatar(
                                maxRadius: 25,
                                minRadius: 25,
                                foregroundColor: Colors.green,
                                backgroundColor: Color(0xff90a97d),
                                child: Icon(
                                  Icons.monetization_on,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.0, top: 8),
                            child: Text(
                              " Loan    ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold, fontFamily: 'Tajawal',),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 25, right: 25),
              child: Text(
                "Statistics",
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.6),
                    fontSize: 20,
                    fontWeight: FontWeight.bold, fontFamily: 'Tajawal',),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          SfCircularChart(
            title:
            ChartTitle(text: 'Attendance Data',textStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold, fontFamily: 'Tajawal',),),
            legend:
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            tooltipBehavior: _tooltipBehavior,
            series: <CircularSeries>[
              DoughnutSeries<GDPData, String>(
                  dataSource: _chartData,
                  xValueMapper: (GDPData data, _) => data.continent,
                  yValueMapper: (GDPData data, _) => data.gdp,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  enableTooltip: true,
                animationDuration: 1,
                animationDelay: .5
              )
            ],
          ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                "My Account",
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.6),
                    fontSize: 20,
                    fontWeight: FontWeight.bold, fontFamily: 'Tajawal',),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
              child: TextButton(
                  onPressed: () {},
                  child:  Text(
                    "log out".tr(),
                    style: const TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,fontFamily: 'Tajawal',),
                  )),
            )
          ],
        ),
      ),
    );
  }
  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Weekend', 52),
      GDPData('Working Days', 260),
      GDPData('Sick Days', 3),
      GDPData('Vacation', 26),
      GDPData('Absence', 7),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}