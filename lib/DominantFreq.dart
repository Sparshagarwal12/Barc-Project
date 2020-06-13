import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class Dominant extends StatefulWidget {
  @override
  _Dominant createState() => _Dominant();
}

Future<dynamic> getUri(String number, String sample, String freq) async {
  String url =
      'https://barc.herokuapp.com/dom/?sampnum=$number&sampfreq=$sample&maxfreq=$freq';
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

TextEditingController number = TextEditingController();
TextEditingController sample = TextEditingController();
TextEditingController freq = TextEditingController();

class _Dominant extends State<Dominant> {
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
              keyboardType: TextInputType.number,
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
              keyboardType: TextInputType.number,
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
              keyboardType: TextInputType.number,
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
                                builder: (context) => ViewData(context,
                                    number.text, sample.text, freq.text)));
                        Fluttertoast.showToast(
                            msg: "Data Send", toastLength: Toast.LENGTH_SHORT);
                      } else {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    ViewData(context, "2000", "2048", "2000")));
                        Fluttertoast.showToast(
                            msg: "Default Data Send",
                            toastLength: Toast.LENGTH_SHORT);
                      }
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

Widget ViewData(context, String number, String sample, String freq) {
  return Scaffold(
    body: Container(
        child: FutureBuilder(
            future: getUri(number, sample, freq),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                dynamic data= snapshot.data;
                return Center(child: Text(data.toString()));
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
