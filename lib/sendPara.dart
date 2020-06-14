import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plot/flutter_plot.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

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
      body: Container(
          padding: EdgeInsets.only(top: 30.0),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Text("Time Domain",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 40, fontFamily: 'BebasNeue'))),
              Container(
                alignment: Alignment.center,
                height: 60.0,
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Color(0xFFf8b195),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFfed7c3),
                        blurRadius: 10.0,
                        offset: Offset(1, 8.0))
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: number,
                  style: TextStyle(fontFamily: "Quicksand"),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontFamily: "Comfortaa"),
                      hintText: "Enter Number of Samples",
                      border: InputBorder.none),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 60.0,
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Color(0xFFf67280),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFffc5bf),
                        blurRadius: 10.0,
                        offset: Offset(1, 8.0))
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: sample,
                  style: TextStyle(fontFamily: "Quicksand"),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontFamily: "Comfortaa"),
                      hintText: "Enter Sample Frequency",
                      border: InputBorder.none),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 60.0,
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Color(0xFFc06c84),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFecd5e3),
                        blurRadius: 10.0,
                        offset: Offset(1, 8.0))
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: freq,
                  style: TextStyle(fontFamily: "Quicksand"),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontFamily: "Comfortaa"),
                      hintText: "Enter Number of Maximum Frequency",
                      border: InputBorder.none),
                ),
              ),
              Expanded(child: SizedBox()),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, bottom: 20.0),
                child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: FlatButton(
                        onPressed: () {
                          if (number.text != "" && sample.text != "") {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => GetData(
                                        context, number.text, sample.text)));
                            Fluttertoast.showToast(
                                msg: "Data Send",
                                toastLength: Toast.LENGTH_SHORT);
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
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Quicksand"),
                        ))),
              )
            ],
          )),
    );
  }
}

Widget GetData(BuildContext context, String number, String sample) {
  return Scaffold(
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
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFecd5e3),
                            blurRadius: 10.0,
                            offset: Offset(1, 10.0))
                      ],
                      color: Color(0xFFff9aa2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    "Show  Data",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Quicksand",
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
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFecd5e3),
                            blurRadius: 10.0,
                            offset: Offset(1, 10.0))
                      ],
                      color: Color(0xFFcbaacb),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    "Plot Data",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Quicksand",
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
                return ListView.builder(
                    itemCount: data['time'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                                child: Text(
                              data['time'][index].toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                          ));
                    });
              } else {
                return Center(child: Text("No Length"));
              }
            } else {
              //spinner
              return Center(
                child: SpinKitWave(
                    color: Colors.black, type: SpinKitWaveType.center),
              );
            }
          }),
    ),
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
                    child: Center(
                        child: Plot(
                      height: 400.0,
                      data: data.isEmpty ? [Point(0.0, 0.0)] : temp,
                      gridSize: Offset(2.0, 2.0),
                      style: PlotStyle(
                        pointRadius: 3.0,
                        outlineRadius: 1.0,
                        trace: true,
                        primary: Colors.white,
                        secondary: Colors.orange,
                        textStyle: TextStyle(
                          fontSize: 8.0,
                          color: Colors.blueGrey,
                        ),
                        axis: Colors.blueGrey[600],
                        gridline: Colors.blueGrey[100],
                      ),
                      padding:
                          const EdgeInsets.fromLTRB(40.0, 12.0, 12.0, 40.0),
                      xTitle: 'Time',
                      yTitle: 'Signal',
                    )),
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
                  child: SpinKitWave(
                      color: Colors.black, type: SpinKitWaveType.center),
                );
              }
            })),
  );
}
