import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plot/flutter_plot.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maths/analysis.dart';

class Parameter extends StatefulWidget {
  @override
  _Parameter createState() => _Parameter();
}

List<Point> temp = [];
Future<Map> getUri(String number, String sample) async {
  String url =
      'https://barc.herokuapp.com/signal/?sampnum=$number&sampfreq=$sample';
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

TextEditingController number = TextEditingController();
TextEditingController sample = TextEditingController();
TextEditingController freq = TextEditingController();

class _Parameter extends State<Parameter> {
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
              child: Text(
            "Send Data ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 50),
          )),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(width: 2.0, color: Colors.black)),
            child: TextField(
              controller: number,
              style: TextStyle(fontFamily: "Quicksand"),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontFamily: "Comfortaa"),
                  hintText: "Enter Number of Samples",
                  border: InputBorder.none),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(width: 2.0, color: Colors.black)),
            child: TextField(
              controller: sample,
              style: TextStyle(fontFamily: "Quicksand"),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontFamily: "Comfortaa"),
                  hintText: "Enter Sample Frequency",
                  border: InputBorder.none),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(width: 2.0, color: Colors.black)),
            child: TextField(
              controller: freq,
              style: TextStyle(fontFamily: "Quicksand"),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontFamily: "Comfortaa"),
                  hintText: "Enter Number of Maximum Frequency",
                  border: InputBorder.none),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30)),
                child: FlatButton(
                    onPressed: () {
                      if (number.text != "" &&
                          sample.text != "" &&
                          freq.text != "") {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => GetData(
                                    context, number.text, sample.text)));
                        Fluttertoast.showToast(
                            msg: "Data Send", toastLength: Toast.LENGTH_SHORT);
                      } else {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    GetData(context, "2000", "2048")));
                        Fluttertoast.showToast(
                            msg: "Default Data Send",
                            toastLength: Toast.LENGTH_SHORT);
                      }
                      number.clear();
                      sample.clear();
                      freq.clear();
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ))),
          )
        ],
      )),
    );
  }
}

Widget GetData(BuildContext context, String number, String sample) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        "SIH 2020",
      ),
    ),
    body: Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 80, right: 80, bottom: 30),
          child: Image(image: AssetImage('assets/images/barc.png')),
        ),
        Padding(
            padding: EdgeInsets.all(20),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              ViewData(context, number, sample)));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
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
                    "Show  Data",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ))),
        SizedBox(height: 10),
        Padding(
            padding: EdgeInsets.all(20),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              PlotData(context, number, sample)));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
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
                    "Plot Data",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                )))
      ],
    )),
  );
}

Widget ViewData(context, String number, String sample) {
  return Scaffold(
    body: Container(
        child: FutureBuilder(
            future: getUri(number, sample),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                Map data = snapshot.data;
                if (data['time'] != null) {
                  return Center(child: Text(data['time'].toString()));
                } else {
                  //no data
                  return Center(
                    child: Text("No Lenght"),
                  );
                }
              } else {
                //spinner
                return Center(
                  child: Text("No Data"),
                );
              }
            })),
  );
}

Widget PlotData(BuildContext context, String number, String sample) {
  return Scaffold(
    body: Container(
        child: FutureBuilder(
            future: getUri(number, sample),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                Map data = snapshot.data;
                if (data['time'] != null) {
                  for (int i = 0; i < int.parse(number); i++) {
                    temp.add(Point(data['time'][i], data['signal'][i]));
                  }
                  return Container(
                    child: new Plot(
                      height: 400.0,
                      data: data.isEmpty ? [Point(0.0, 0.0)] : temp,
                      gridSize: new Offset(2.0, 2.0),
                      style: new PlotStyle(
                        pointRadius: 3.0,
                        outlineRadius: 1.0,
                        trace: true,
                        primary: Colors.white,
                        secondary: Colors.orange,
                        textStyle: new TextStyle(
                          fontSize: 8.0,
                          color: Colors.blueGrey,
                        ),
                        axis: Colors.blueGrey[600],
                        gridline: Colors.blueGrey[100],
                      ),
                      padding:
                          const EdgeInsets.fromLTRB(40.0, 12.0, 12.0, 40.0),
                      xTitle: 'My X Title',
                      yTitle: 'My Y Title',
                    ),
                  );
                } else {
                  //no data
                  return Center(
                    child: Text("No Lenght"),
                  );
                }
              } else {
                //spinner
                return Center(
                  child: Text("No Data"),
                );
              }
            })),
  );
}
