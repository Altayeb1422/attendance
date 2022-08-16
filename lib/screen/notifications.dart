import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
      physics: BouncingScrollPhysics(),
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 32),
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff9b6ebe), Color(0xff9b83a9)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 8,
                    spreadRadius: 2,
                    // offset: Offset(4, 4),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      "Tue, Aug 16",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'avenir'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: const <Widget>[
                          Icon(
                            Icons.label,
                            color: Colors.white,
                            size: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Request",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'avenir'),
                          ),
                        ],
                      ),
                       const CircleAvatar(
                         maxRadius: 25,
                         minRadius: 25,
                         foregroundColor: Colors.green,
                         backgroundColor: Colors.transparent,
                         child: Icon(
                           Icons.sick,
                           color: Colors.white,
                           size: 35,
                         ),
                       ),
                    ],
                  ),
                  const Text(
                    'Mon-Fri',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'avenir'),
                  ),
                  Row(
                    children: <Widget>[
                      const Text(
                        "Medical Leave",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'avenir',
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      Spacer(),
                      const Text(
                        'Pending',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'avenir'),),
                      IconButton(
                          icon: const Icon(Icons.pending),
                          color: Colors.black54,
                          onPressed: () {
                            // deleteAlarm(alarm.id);
                          }),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: CircleAvatar(
                maxRadius: 7,
                minRadius: 7,
                foregroundColor: Colors.red,
                backgroundColor: Colors.red,
              ),),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 32),
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 8),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff347d7b), Color(0xff448d8b)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 8,
                spreadRadius: 2,
                // offset: Offset(4, 4),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  "Tue, Aug 16",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'avenir'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: const <Widget>[
                      Icon(
                        Icons.label,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Request",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'avenir'),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    maxRadius: 25,
                    minRadius: 25,
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.luggage,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ],
              ),
              const Text(
                '10 days,  Staring  Mon,12th',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'avenir'),
              ),
              Row(
                children: <Widget>[
                  const Text(
                    "Vacation",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'avenir',
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  const Text(
                    'Denied',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'avenir'),),
                  IconButton(
                      icon: const Icon(Icons.cancel),
                      color: Color(0xffff889a),
                      onPressed: () {
                        // deleteAlarm(alarm.id);
                      }),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Tue, Aug 16",
                    style: TextStyle(
                        color: Color(0xffff889a),
                        fontFamily: 'avenir'),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 32),
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 8),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff8da67c), Color(0xff8e9e83)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 8,
                spreadRadius: 2,
                // offset: Offset(4, 4),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  "Tue, Aug 16",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'avenir'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: const <Widget>[
                      Icon(
                        Icons.label,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Request",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'avenir'),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    maxRadius: 25,
                    minRadius: 25,
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.monetization_on,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ],
              ),
              const Text(
                '50,000',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'avenir'),
              ),
              Row(
                children: <Widget>[
                  const Text(
                    "Cash Loan",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'avenir',
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Center(
                    child: Text(
                      "Approved",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'avenir'),
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.check_circle),
                      color: Colors.yellow,
                      onPressed: () {
                        // deleteAlarm(alarm.id);
                      }),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(

                    "Tue, Aug 16",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontFamily: 'avenir'),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 32),
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 8),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff91b3be), Color(0xffb5ccd3)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 8,
                spreadRadius: 2,
                // offset: Offset(4, 4),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: const <Widget>[
                      Icon(
                        Icons.label,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Work",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'avenir'),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    maxRadius: 25,
                    minRadius: 25,
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.receipt_long,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ],
              ),
              const Text(
                'Mon,12 8:00 am',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'avenir'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  <Widget>[
                  Text(
                    "New Task",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'avenir',
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                      icon: const Icon(Icons.fingerprint_rounded),
                      color: Colors.white,
                      onPressed: () {
                        // deleteAlarm(alarm.id);
                      }),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
