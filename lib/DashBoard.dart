import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maths/FrequencyDomain.dart';
import 'package:maths/analysis.dart';
import 'package:maths/sendPara.dart';

List<Color> color = [Color(0xFF06beb6), Color(0xFF48b1bf)];

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Text("Laser Vibratometer UI",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 40, fontFamily: 'BebasNeue'))),
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
                            margin: EdgeInsets.all(10.0),
                            height: MediaQuery.of(context).size.height / 6,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFFfed7c3),
                                      blurRadius: 10.0,
                                      offset: Offset(1, 8.0))
                                ],
                                color: Color(0xFFf8b195),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "Time Domain Analysis",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Comfortaa",
                                fontSize: 18,
                                color: Colors.white,
                              ),
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
                            margin: EdgeInsets.all(10.0),
                            height: MediaQuery.of(context).size.height / 6,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFFffc5bf),
                                      blurRadius: 10.0,
                                      offset: Offset(1, 8.0))
                                ],
                                color: Color(0xFFf67280),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "Dominant Frequency",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Comfortaa",
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            )),
                          )))),
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
                            margin: EdgeInsets.all(10.0),
                            height: MediaQuery.of(context).size.height / 6,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color(0xFFc06c84),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFFecd5e3),
                                      blurRadius: 10.0,
                                      offset: Offset(1, 8.0))
                                ],
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "Targeted Displacement",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Comfortaa",
                                fontSize: 18,
                                color: Colors.white,
                              ),
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
                            margin: EdgeInsets.all(10.0),
                            height: MediaQuery.of(context).size.height / 6,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFFecd5e3),
                                      blurRadius: 10.0,
                                      offset: Offset(1, 8.0))
                                ],
                                color: Color(0xFF6c567b),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "Frequency Domain Analysis",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Comfortaa",
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            )),
                          )))),
            ],
          )),
    );
  }
}
