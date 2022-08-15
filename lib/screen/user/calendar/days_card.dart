import 'package:flutter/material.dart';

class Days extends StatefulWidget {
  const Days({Key? key}) : super(key: key);

  @override
  State<Days> createState() => _DaysState();
}

class _DaysState extends State<Days> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: MediaQuery.of(context).size.height* .25,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.blueGrey.withOpacity(0.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height* .25,
                    width: MediaQuery.of(context).size.width*0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text("14",style: TextStyle(color:  Colors.black, fontWeight: FontWeight.bold, fontSize: 25)),
                        SizedBox(height: 8,),
                        Text("WED",style: TextStyle(color:  Colors.black, fontWeight: FontWeight.bold, fontSize: 25)),
                        SizedBox(height: 8,),
                        Icon(Icons.emergency, color: Colors.redAccent, size: 30,),

                      ],
                    ),
                  ),
                ),
                SizedBox(width: 35,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                    Text("Check in",style: TextStyle(color: Colors.grey, fontSize: 15,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Icon(Icons.timer_outlined, color: Colors.blueAccent,size: 30,),
                    SizedBox(height: 8,),
                    Text("9:00",style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    SizedBox(width: 50, child: Divider(color: Colors.black,)),
                    SizedBox(height: 10,),
                    Icon(Icons.timer_outlined, color: Colors.blueAccent,size: 30,),
                    SizedBox(height: 8,),
                    Text("--:--",style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(width: 25,),
                VerticalDivider(color: Colors.black,indent: 40, endIndent: 40, ),
                SizedBox(width: 25,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                    Text("Clock Out",style: TextStyle(color: Colors.grey, fontSize: 15,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Icon(Icons.timer_off_outlined, color: Colors.redAccent,size: 30,),
                    SizedBox(height: 8,),
                    Text("4:00",style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    SizedBox(width: 50, child: Divider(color: Colors.black,)),
                    SizedBox(height: 10,),
                    Icon(Icons.timer_off_outlined, color: Colors.redAccent,size: 30,),
                    SizedBox(height: 8,),
                    Text("--:--",style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: MediaQuery.of(context).size.height* .25,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.blueGrey.withOpacity(0.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height* .25,
                    width: MediaQuery.of(context).size.width*0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("14",style: TextStyle(color:  Colors.black, fontWeight: FontWeight.bold, fontSize: 25)),
                        SizedBox(height: 8,),
                        Text("WED",style: TextStyle(color:  Colors.black, fontWeight: FontWeight.bold, fontSize: 25)),
                        SizedBox(height: 8,),
                        Icon(Icons.person_off_outlined, color: Colors.grey, size: 30,),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 35,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                    Text("Check in",style: TextStyle(color: Colors.grey, fontSize: 15,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Icon(Icons.timer_outlined, color: Colors.blueAccent,size: 30,),
                    SizedBox(height: 8,),
                    Text("9:00",style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    SizedBox(width: 50, child: Divider(color: Colors.black,)),
                    SizedBox(height: 10,),
                    Icon(Icons.timer_outlined, color: Colors.blueAccent,size: 30,),
                    SizedBox(height: 8,),
                    Text("9:00",style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(width: 25,),
                VerticalDivider(color: Colors.black,indent: 40, endIndent: 40, ),
                SizedBox(width: 25,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                    Text("Clock Out",style: TextStyle(color: Colors.grey, fontSize: 15,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Icon(Icons.timer_off_outlined, color: Colors.redAccent,size: 30,),
                    SizedBox(height: 8,),
                    Text("4:00",style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    SizedBox(width: 50, child: Divider(color: Colors.black,)),
                    SizedBox(height: 10,),
                    Icon(Icons.timer_off_outlined, color: Colors.redAccent,size: 30,),
                    SizedBox(height: 8,),
                    Text("4:00",style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: MediaQuery.of(context).size.height* .25,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.blueGrey.withOpacity(0.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height* .25,
                    width: MediaQuery.of(context).size.width*0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("14",style: TextStyle(color:  Colors.black, fontWeight: FontWeight.bold, fontSize: 25)),
                        SizedBox(height: 8,),
                        Text("WED",style: TextStyle(color:  Colors.black, fontWeight: FontWeight.bold, fontSize: 25)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 35,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                    Text("Check in",style: TextStyle(color: Colors.grey, fontSize: 15,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Icon(Icons.timer_outlined, color: Colors.blueAccent,size: 30,),
                    SizedBox(height: 8,),
                    Text("9:00",style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    SizedBox(width: 50, child: Divider(color: Colors.black,)),
                    SizedBox(height: 10,),
                    Icon(Icons.timer_outlined, color: Colors.blueAccent,size: 30,),
                    SizedBox(height: 8,),
                    Text("9:00",style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(width: 25,),
                VerticalDivider(color: Colors.black,indent: 40, endIndent: 40, ),
                SizedBox(width: 25,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                    Text("Clock Out",style: TextStyle(color: Colors.grey, fontSize: 15,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Icon(Icons.timer_off_outlined, color: Colors.redAccent,size: 30,),
                    SizedBox(height: 8,),
                    Text("4:00",style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    SizedBox(width: 50, child: Divider(color: Colors.black,)),
                    SizedBox(height: 10,),
                    Icon(Icons.timer_off_outlined, color: Colors.redAccent,size: 30,),
                    SizedBox(height: 8,),
                    Text("4:00",style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: MediaQuery.of(context).size.height* .25,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.blueGrey.withOpacity(0.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height* .25,
                    width: MediaQuery.of(context).size.width*0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("14",style: TextStyle(color:  Colors.black, fontWeight: FontWeight.bold, fontSize: 25)),
                        SizedBox(height: 8,),
                        Text("WED",style: TextStyle(color:  Colors.black, fontWeight: FontWeight.bold, fontSize: 25)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 35,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                    Text("Check in",style: TextStyle(color: Colors.grey, fontSize: 15,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Icon(Icons.timer_outlined, color: Colors.blueAccent,size: 30,),
                    SizedBox(height: 8,),
                    Text("9:00",style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    SizedBox(width: 50, child: Divider(color: Colors.black,)),
                    SizedBox(height: 10,),
                    Icon(Icons.timer_outlined, color: Colors.blueAccent,size: 30,),
                    SizedBox(height: 8,),
                    Text("9:00",style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(width: 25,),
                VerticalDivider(color: Colors.black,indent: 40, endIndent: 40, ),
                SizedBox(width: 25,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                    Text("Clock Out",style: TextStyle(color: Colors.grey, fontSize: 15,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Icon(Icons.timer_off_outlined, color: Colors.redAccent,size: 30,),
                    SizedBox(height: 8,),
                    Text("4:00",style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    SizedBox(width: 50, child: Divider(color: Colors.black,)),
                    SizedBox(height: 10,),
                    Icon(Icons.timer_off_outlined, color: Colors.redAccent,size: 30,),
                    SizedBox(height: 8,),
                    Text("4:00",style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
