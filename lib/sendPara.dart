import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Parameter extends StatefulWidget {
  @override
  _Parameter createState() => _Parameter();
}

TextEditingController number = TextEditingController();
TextEditingController sample = TextEditingController();

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
            "Send Data To Server",
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
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30)),
                child: FlatButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "Data Send", toastLength: Toast.LENGTH_SHORT);
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
