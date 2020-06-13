import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maths/DominantFreq.dart';
import 'package:maths/FrequencyDomain.dart';
import 'package:maths/analysis.dart';
import 'package:maths/sendPara.dart';

List<Color> color = [Color(0xFF06beb6), Color(0xFF48b1bf)];

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SIH 2020",
        ),
      ),
      body: Container(
          child: ListView(
        children: <Widget>[
          Center(
              child: Text("Laser Vibratometer UI",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Philosopher'))),
          SizedBox(height: 40),
          Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => Parameter()));
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF48b1bf),
                                    blurRadius: 10.0, // soften the shadow
                                    spreadRadius: 2.0, //extend the shadow
                                    offset: Offset(
                                      3.0, // Move to right 10  horizontally
                                      3.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                                gradient: LinearGradient(colors: color),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "Time Domain Analysis",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          )))),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => Dominant()));
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF48b1bf),
                                    blurRadius: 10.0, // soften the shadow
                                    spreadRadius: 2.0, //extend the shadow
                                    offset: Offset(
                                      3.0, // Move to right 10  horizontally
                                      3.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                                gradient: LinearGradient(colors: color),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "Dominant Frequency",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          )))),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: GestureDetector(
                          onTap: () {
                            Fluttertoast.showToast(
                                msg: "Only Show Data",
                                toastLength: Toast.LENGTH_SHORT);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF48b1bf),
                                    blurRadius: 10.0, // soften the shadow
                                    spreadRadius: 2.0, //extend the shadow
                                    offset: Offset(
                                      3.0, // Move to right 10  horizontally
                                      3.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                                gradient: LinearGradient(colors: color),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "Targeted Displacement",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          )))),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => FrequencyPara()));
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF48b1bf),
                                    blurRadius: 10.0, // soften the shadow
                                    spreadRadius: 2.0, //extend the shadow
                                    offset: Offset(
                                      3.0, // Move to right 10  horizontally
                                      3.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                                gradient: LinearGradient(colors: color),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "Frequency Domain Analysis",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          )))),
            ],
          ),
        ],
      )),
    );
  }
}
