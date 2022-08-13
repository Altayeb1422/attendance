import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'calendar/years_tabs.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  UserState createState() => UserState();
}

class UserState extends State<User> {

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: IconButton( color: Colors.black, icon: const Icon(Icons.arrow_back_ios), onPressed: () { Navigator.pop(context); },),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Text(
                "Profile",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,fontFamily: 'Tajawal',),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'user_image',
                    child: Container(
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
              padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
              child: Text(
                "Dashboard",
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.6),
                    fontSize: 20,
                    fontWeight: FontWeight.bold, fontFamily: 'Tajawal',),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            OptionsCard(
              title: 'Notifications',
              icon: const Icon(
                Icons.notifications_none_outlined,
                color: Colors.white,
              ),
              color: Colors.green,
              onTap: () {},
            ),
            OptionsCard(
              title: 'Calendar',
              icon: const Icon(
                Icons.calendar_month_outlined,
                color: Colors.white,
              ),
              color: Colors.deepOrangeAccent,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Years()));
              },
            ),

            OptionsCard(
              title: 'Help',
              icon: const Icon(
                Icons.help_outline,
                color: Colors.white,
              ),
              color: Colors.blue,
              onTap: () {},
            ),
            OptionsCard(
              title: 'Contact Us',
              icon: const Icon(
                Icons.call_outlined,
                color: Colors.white,
              ),
              color: Colors.grey,
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
              child: Text(
                "My Account",
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.6),
                    fontSize: 20,
                    fontWeight: FontWeight.bold, fontFamily: 'Tajawal',),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
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
}

class OptionsCard extends StatelessWidget {
  const OptionsCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  }) : super(key: key);
  final dynamic icon;
  final String title;
  final Color color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: const [
                    BoxShadow(blurRadius: 7.0, color: Color(0xffa7a9af))
                  ]),
              child: CircleAvatar(
                maxRadius: 28,
                minRadius: 28,
                foregroundColor: Colors.green,
                backgroundColor: color,
                child: icon,
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,fontFamily: 'Tajawal',),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.withOpacity(0.6),
              size: 22,
            )
          ],
        ),
      ),
    );
  }
}
